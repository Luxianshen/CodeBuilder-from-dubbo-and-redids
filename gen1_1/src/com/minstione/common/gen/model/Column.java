package com.minstione.common.gen.model;

/**
 * 获取数据库字段model
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2015
 * @since 2015-9-25
 * @author Mazp
 * @version 1.0
 * 
 */
public class Column {
	/**
	 * model属性名
	 */
	private String name;
	/**
	 * sql字段名
	 */
	private String sqlName;
	/**
	 * 数据库字段类型
	 */
	private String type;
	/**
	 * 注释 
	 */
	private String comment;
	/**
	 * 字段类型
	 */
	private String fileType;
	/**
	 * 字段是否允许为空
	 */
	private String nullAble;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSqlName() {
		return sqlName;
	}

	public void setSqlName(String sqlName) {
		this.sqlName = sqlName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getNullAble() {
		return nullAble;
	}

	public void setNullAble(String nullAble) {
		this.nullAble = nullAble;
	}

}
