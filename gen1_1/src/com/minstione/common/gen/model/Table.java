package com.minstione.common.gen.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * pdm表信息
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 * @since 2016-5-27
 * @author Mazp
 * @version 1.0
 * 
 */
public class Table {
	/**
	 * 生成的model的名称
	 */
	private String modelName;
	/**
	 * 对应的数据库的表名称
	 */
	private String tableName;// 表名
	/**
	 * 对应的表注释
	 */
	private String comment;
	/**
	 * 表对应的列属性信息集合
	 */
	private List<Column> columnList;
	/**
	 * 需要导入包的集合
	 */
	private Set<String> importClassSet;
	/**
	 * 需要导入包的集合
	 */
	private List<String> importClassList;
	/**
	 * 表对应的不为空列属性信息集合
	 */
	private List<Column> columnNullList;
	/**
	 * model是否需要redis,modelRedis
	 */
	private String modelRedis;
	/**
	 * 设置constant,用作redis key
	 */
	private String constant;
	/**
	 * 生成的model的名称
	 */
	public String getModelName() {
		return modelName;
	}
	/**
	 * 生成的model的名称
	 */
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	/**
	 * 对应的数据库的表名称
	 */
	public String getTableName() {
		return tableName;
	}
	/**
	 * 对应的数据库的表名称
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	/**
	 * 对应的表注释
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * 对应的表注释
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * 表对应的列属性信息集合
	 */
	public List<Column> getColumnList() {
		return columnList;
	}
	/**
	 * 表对应的列属性信息集合
	 */
	public void setColumnList(List<Column> columnList) {
		this.columnList = columnList;
	}
	/**
	 * 需要导入包的集合
	 */
	public Set<String> getImportClassSet() {
		return importClassSet;
	}
	/**
	 * 需要导入包的集合
	 */
	public void setImportClassSet(Set<String> importClassSet) {
		this.importClassSet = importClassSet;
	}
	/**
	 * 需要导入包的集合
	 */
	public List<String> getImportClassList() {
		return new ArrayList<String>(this.importClassSet);
	}
	/**
	 * 需要导入包的集合
	 */
	public void setImportClassList(List<String> importClassList) {
		this.importClassList = importClassList;
	}
	public List<Column> getColumnNullList() {
		return columnNullList;
	}
	public void setColumnNullList(List<Column> columnNullList) {
		this.columnNullList = columnNullList;
	}
	public String getModelRedis() {
		return modelRedis;
	}
	public void setModelRedis(String modelRedis) {
		this.modelRedis = modelRedis;
	}
	public String getConstant() {
		return constant;
	}
	public void setConstant(String constant) {
		this.constant = constant;
	}

}
