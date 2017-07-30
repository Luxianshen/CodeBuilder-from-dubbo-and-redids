package com.minstione.common.gen.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.XPath;
import org.dom4j.io.SAXReader;

import com.minstione.common.gen.model.Column;
import com.minstione.common.gen.model.Conf;
import com.minstione.common.gen.model.FieldType;
import com.minstione.common.gen.model.Table;

/**
 * 解析Pdm的工具类
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2017
 * @since 2017-1-13
 * @author MAZP
 * @version 1.0
 *
 */
public class ParsePdmUtil {

	/**
	 * 解析pdm文件,并且返回解析后的对象容器,如果是list类型的,那么就是生成所有的表,如果是map,那么就只生成对应的某张表
	 * 
	 * @param conf 配置文件信息类
	 * @param clazz 类文件,注意,这里只能是List的子类或者map的子类
	 * @param collection 存放table信息的集合,可以是list,也可以是map
	 * @return
	 * @throws DocumentException
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public static <T> T parsePdm(Conf conf, Class clazz) throws DocumentException, InstantiationException, IllegalAccessException {
		// 创建集合的实例
		T collection = (T) clazz.newInstance();
		// 定义pdm的文件
		File pdmFile = new File(conf.getParamMap().get("pdmUrl"));
		// 定义table属性信息的列表,如果pdm的文件是不存在那么就直接返回
		if(pdmFile == null || !pdmFile.exists() || pdmFile.isDirectory()){
			System.err.println("pdm的路径写错或者没有写,请确保conf.xml里面的pdmUrl元素的值没有写错!");
			System.exit(0);
		}
		// 获取表格元素
		Element tableElements = getTableEmelemt(pdmFile);
        if(tableElements == null){
        	System.err.println("请确保你的pdm文件里面的表格至少有一个!");
        	System.exit(0);
        }
        // 定义表格
        Table table = null;
        // 循环遍历表信息
        for (Iterator<Element> it = tableElements.elementIterator("Table"); it.hasNext();) {
        	table = new Table();
			Element tableElement = it.next();
			// 获取数据库表名
			String tableName = tableElement.elementText("Code"); 
			// 判断是否是我们需要的数据库表,如果不是,那么跳过
			if(tableName == null || "".equals(tableName)){
				continue;
			}
			table.setTableName(tableName);	// 对应的数据库表名
			String name = tableElement.elementText("Name"); // 生成的model的名称
			table.setModelName(name);	
			String comment = tableElement.elementText("Comment");
			if (comment == null || comment.length() == 0) {
				System.out.println("亲,表的注释没有写呢......去补上");
				System.exit(0);
			}
			table.setComment(tableElement.elementText("Comment"));	// 表的注释
			// 获取列的元素并且设置到table中
			Element columnsElement = tableElement.element("Columns");
			boolean hasColumnList = setColumnList(columnsElement, table, conf);
			if (hasColumnList) {
				// 将数据存放到容器之中
				if (collection instanceof Map) {
					((Map) collection).put(name, table);
				} else if (collection instanceof List) {
					((List) collection).add(table);
				}
			}
		}
		return collection;
	}

	/**
	 * 获取表格元素
	 * 
	 * @param pdmFile : pdm的文件
	 * @return
	 * @throws DocumentException
	 */
	private static Element getTableEmelemt(File pdmFile) throws DocumentException {
		SAXReader reader = new SAXReader();
        Document document = reader.read(pdmFile);
        Map<String,String> map = new HashMap<String, String>();  
        map.put("c","collection"); // 设置pdm的命名空间,c="collection"
        XPath path = document.createXPath("//c:Tables"); // 定义获取c:Tables的内容
        path.setNamespaceURIs(map);
        // 获取到我们想要的节点元素
        Element tableElements = (Element)path.selectSingleNode(document);
		return tableElements;
	};

	/**
	 * 设置列的信息
	 * @param columnsElement
	 * @param table
	 * @param conf 
	 */
	private static boolean setColumnList(Element columnsElement, Table table, Conf conf) {
		if (null == columnsElement) {
			System.out.println("必须要有列的信息,请检查一下你的pdm里面是否有一些表是没有列的!");
			System.exit(0);
		}
		boolean falg = false;
		Iterator<Element> columnsIt = columnsElement.elementIterator("Column");
		// 定义列
        Column column = null;
        Set<String> importClassSet = new HashSet<String>();	// 需要导入的jar包
        List<Column> columnList = new ArrayList<Column>();	// 列属性
		// 获取表的字段信息
		while (columnsIt.hasNext()) {
			falg = true;
			Element columnElement = columnsIt.next();
			column = new Column();
			column.setName(columnElement.elementText("Name"));// model属性名
			column.setSqlName(columnElement.elementText("Code"));// 对应的数据库字段名
			String comment = columnElement.elementText("Comment");
			if (null == comment || comment.length() == 0) {
				System.out.println("亲,表的列,要有注释哦,嗯!没有列注释的,不给你生成代码~~老老实实去补回来~");
				System.exit(0);
			}
			column.setComment(comment);// 字段注释
			String sqltype = columnElement.elementText("DataType");// 数据库字段类型
			FieldType fieldType = FieldType.getFieldType(conf, sqltype);
			
			column.setType(fieldType.getMybatisFieldType());// mybatis对应的字段类型
			
			column.setFileType(fieldType.getModelFieldType());	// 设置model的类型
			
			// 判断是否有需要导入的jar包,如果有的话,那么就将需要导入的jar包,加到对应的表之中
			if (null != fieldType.getImportClass() && !"".equals(fieldType.getImportClass())) {
				importClassSet.add(fieldType.getImportClass());
			}
			columnList.add(column);
		}
		table.setImportClassSet(importClassSet);	// 设置需要导入的jar包
		table.setColumnList(columnList);	// 设置列的属性信息
		return falg;
	}
}
