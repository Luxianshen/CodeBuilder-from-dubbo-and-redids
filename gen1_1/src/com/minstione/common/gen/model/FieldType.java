package com.minstione.common.gen.model;

import java.util.Iterator;
import java.util.Set;

/**
 * 用于处理mybatis与model以及数据库之间字段类型的类
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 * @since 2016-2-1
 * @author Mazp
 * @version 1.0
 *
 */
public class FieldType {
	/**
	 * 数据库类型
	 */
	private String sqlFieldType;
	/**
	 * 字段类型 
	 */
	private String modelFieldType;
	/**
	 * mybatis类型
	 */
	private String mybatisFieldType;
	/**
	 * 需要导入的类
	 */
	private String importClass;
	
	public FieldType() {
		super();
	}

	/**
	 * 
	 * @param sqlFieldType 数据库类型
	 * @param modelFieldType 字段类型
	 * @param mybatisFieldType mybatis类型
	 * @param importClass 需要导入的类
	 */
	public FieldType(String sqlFieldType, String modelFieldType,
			String mybatisFieldType, String importClass) {
		super();
		this.sqlFieldType = sqlFieldType;
		this.modelFieldType = modelFieldType;
		this.mybatisFieldType = mybatisFieldType;
		this.importClass = importClass;
	}

	/**
	 * 从map中获取到对应的字段类型model
	 * @param conf 
	 * @param sqlFieldType
	 * @return
	 */
	public static FieldType getFieldType(Conf conf, String sqlFieldType) {
		sqlFieldType = sqlFieldType.toLowerCase();
		Set keySet = conf.getFieldTypeMap().keySet();
		for (Iterator iterator = keySet.iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			if (sqlFieldType.contains(keyName)) {
				return conf.getFieldTypeMap().get(keyName);
			}
		}
		throw new RuntimeException("很不好意思,报错了呢.....因为目前的配置暂时不支持" + sqlFieldType + "请到conf.xml里面去配置对应的类型");
	}

	public String getSqlFieldType() {
		return sqlFieldType;
	}

	public void setSqlFieldType(String sqlFieldType) {
		this.sqlFieldType = sqlFieldType;
	}

	public String getModelFieldType() {
		return modelFieldType;
	}

	public void setModelFieldType(String modelFieldType) {
		this.modelFieldType = modelFieldType;
	}

	public String getMybatisFieldType() {
		return mybatisFieldType;
	}

	public void setMybatisFieldType(String mybatisFieldType) {
		this.mybatisFieldType = mybatisFieldType;
	}

	public String getImportClass() {
		return importClass;
	}

	public void setImportClass(String importClass) {
		this.importClass = importClass;
	}

}
