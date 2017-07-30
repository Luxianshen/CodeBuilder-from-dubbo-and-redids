package com.minstione.common.gen.model;

import java.util.List;
import java.util.Map;

/**
 * 保存了最基础的配置文件信息
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 * @since 2016-6-17
 * @author Mazp
 * @version 1.0
 * 
 */
public class Conf {
//	/**
//	 * 作者
//	 */
//	private String author;
//	/**
//	 * 基础包名
//	 */
//	private String packageName;
//	/**
//	 * 即将要解析的pdm的路径
//	 */
//	private String pdmUrl;
//	/**
//	 * 想要生成的文件的路径
//	 */
//	private String targetPath;
//	/**
//	 * 生成的model名称
//	 */
//	private String modelName;
//	/**
//	 * 是否生成所有pmd里面所有的表,默认是
//	 */
//	private boolean isGenAllTable = true;
	/**
	 * 参数map
	 */
	private Map<String, String> paramMap;
	
	/**
	 * 模板的集合
	 */
	private List<Tpl> tplList;
	/**
	 * mybatis需要使用的字段的map
	 */
	public Map<String, FieldType> fieldTypeMap;
//	/**
//	 * 作者
//	 */
//	public String getAuthor() {
//		return author;
//	}
//	/**
//	 * 作者
//	 */
//	public void setAuthor(String author) {
//		this.author = author;
//	}
//	/**
//	 * 基础包名
//	 */
//	public String getPackageName() {
//		return packageName;
//	}
//
//	/**
//	 * 基础包名
//	 */
//	public void setPackageName(String packageName) {
//		this.packageName = packageName;
//	}
//
//	/**
//	 * 即将要解析的pdm的路径
//	 */
//	public String getPdmUrl() {
//		return pdmUrl;
//	}
//
//	/**
//	 * 即将要解析的pdm的路径
//	 */
//	public void setPdmUrl(String pdmUrl) {
//		this.pdmUrl = pdmUrl;
//	}
//
//	/**
//	 * 想要生成的文件的路径
//	 */
//	public String getTargetPath() {
//		return targetPath;
//	}
//
//	/**
//	 * 想要生成的文件的路径
//	 */
//	public void setTargetPath(String targetPath) {
//		this.targetPath = targetPath;
//	}
//	/**
//	 * 生成的model名称
//	 */
//	public String getModelName() {
//		return modelName;
//	}
//	/**
//	 * 生成的model名称
//	 */
//	public void setModelName(String modelName) {
//		this.modelName = modelName;
//	}
//	/**
//	 * 是否生成所有pmd里面所有的表,默认是
//	 */
//	public boolean getIsGenAllTable() {
//		return isGenAllTable;
//	}
//	/**
//	 * 是否生成所有pmd里面所有的表,默认是
//	 */
//	public void setIsGenAllTable(boolean isGenAllTable) {
//		this.isGenAllTable = isGenAllTable;
//	}

	/**
	 * 模板的集合
	 */
	public List<Tpl> getTplList() {
		return tplList;
	}

	/**
	 * 模板的集合
	 */
	public void setTplList(List<Tpl> tplList) {
		this.tplList = tplList;
	}
	/**
	 * mybatis需要使用的字段的map
	 */
	public Map<String, FieldType> getFieldTypeMap() {
		return fieldTypeMap;
	}
	/**
	 * mybatis需要使用的字段的map
	 */
	public void setFieldTypeMap(Map<String, FieldType> fieldTypeMap) {
		this.fieldTypeMap = fieldTypeMap;
	}
	/**
	 * 参数map
	 */
	public Map<String, String> getParamMap() {
		return paramMap;
	}
	/**
	 * 参数map
	 */
	public void setParamMap(Map<String, String> paramMap) {
		this.paramMap = paramMap;
	}
	
	
}
