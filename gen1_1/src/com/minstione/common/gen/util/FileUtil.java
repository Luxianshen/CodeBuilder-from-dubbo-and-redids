package com.minstione.common.gen.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.minstione.common.gen.model.Conf;
import com.minstione.common.gen.model.Table;
import com.minstione.common.gen.model.Tpl;
import com.mysql.jdbc.StringUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 文件相关工具类
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2017
 * @since 2017-1-13
 * @author Mazp
 * @version 1.0
 *
 */
public class FileUtil {

	/**
	 * 生成文件
	 * @param <T>
	 * 
	 * @param list
	 * @throws IOException
	 * @throws TemplateException
	 */
	public static <T> void genCode(T collection, Conf conf) throws IOException, TemplateException {
		// 判断是生成pdm里面所有的表呢,还是只生成对应的一个
        if (collection instanceof List) {
        	List<Table> tableList = (List<Table>) collection;
        	// 遍历生成文件
        	for (Table table : tableList) {
        		createFile(conf, table);
        	}
        } else if (collection instanceof Map) {
        	Map<String, Table> tableMap = (Map<String, Table>) collection;
        	Table table = tableMap.get(conf.getParamMap().get("modelName"));
        	createFile(conf, table);
        } else {
        	Table table = (Table) collection;
        	createFile(conf, table);
        }
	}

	/**
	 * 创建文件
	 * @param conf 配置文件信息
	 * @param template freemarker的模板
	 * @param root freemarket需要的模板数据
	 * @param packageUrl 生成的报名
	 * @param tplList
	 * @param table
	 * @throws IOException
	 * @throws TemplateException
	 */
	private static void createFile(Conf conf, Table table) throws IOException, TemplateException {
		List<Tpl> tplList = conf.getTplList(); // 模板集合
		Map<String, String> paramMap = conf.getParamMap();
		// 这里遍历所有需要生成的文件模板
		for (Tpl tpl : tplList) {
			String packageUrl =  "";
			String getModelName = table.getModelName();
			if (!StringUtils.isNullOrEmpty(tpl.getSrcPath())) {
				packageUrl += tpl.getSrcPath()+"/";	// 完整的包名
			}
			if(tpl.isDefault()){
				if (null != tpl.getSuffix()||!"".equals(tpl.getSuffix())) {
					packageUrl += paramMap.get("packageName") + "." + tpl.getSuffix();	// 完整的包名
				} 
			}else{
				if(!StringUtils.isNullOrEmpty(tpl.getSuffix())){
					packageUrl += tpl.getSuffix();
				}
			}
			String lowerCase = getModelName.substring(0,1).toLowerCase()+getModelName.substring(1);
			packageUrl  = MessageFormat.format(packageUrl, lowerCase);
			
			String names[] = paramMap.get("pk").split("_");
			String name = "";
			for (int i = 0; i < names.length; i++) {
				name += names[i].substring(0,1).toUpperCase() + names[i].substring(1).toLowerCase();
			}
			// 获取模板
			Template template = getTemplate(tpl.getName());
			//建立数据模型（Map）  
			Map<String, Object> root = new HashMap<String, Object>(); 
			paramMap.put("pkName", name);
			paramMap.put("pkLowerCaseName", name.substring(0,1).toLowerCase()+name.substring(1, name.length()));
			paramMap.put("lowerCaseModelName", lowerCase);
			root.put("paramMap", paramMap);	// 参数map
			root.put("table", table);  
			// 文件的路径 = 目标的路径 + 包名路径 + 文件名称
			String filePath=paramMap.get("targetPath") ;	// 生成的基础路径
			if(tpl.isApiPath()){
				filePath += paramMap.get("apiProjectName") + "/";	// 为api项目
			}else{
				filePath += paramMap.get("providerProjectName") + "/";	// 为provider项目
			}
			filePath += packageUrl.replaceAll("\\.", "/") + "/";	// 加上文件附属路径、
			filePath += MessageFormat.format(tpl.getFileName(), getModelName);
			File file = new File(filePath);
			// 判断需要生成的文件的路径是否已经存在,如果不存在,那么我们帮他创建一个
			if (!file.exists()) {
				file.getParentFile().mkdirs();
			}
			FileWriter writer = new FileWriter(file);
			//数据与模板合并（数据+模板=输出）  
			template.process(root, writer);
			writer.flush();
			writer.close();
		}
	}
	
	/**
	 * 根据模板名称获取模板
	 * 
	 * @return
	 * @throws IOException
	 */
	public static Template getTemplate(String templateName) throws IOException {
		// 创建配置实例Cofiguration
		Configuration configuration = new Configuration();

		// 设置模板文件目录
		configuration.setDirectoryForTemplateLoading(new File("template/genTemplate"));
		// 获取模板（template）
		Template template = configuration.getTemplate(templateName);
		return template;
	}
}
