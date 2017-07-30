package com.minstione.common.gen.model;

/**
 * 模板信息类,存放了模板的信息
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 * @since 2016-6-18
 * @author Mazp
 * @version 1.0
 * 
 */
 public class Tpl {
	/**
	 * 模板的名称
	 */
	private String name;
	/**
	 * 该模板是否为api项目,true为api项目，false为provider项目
	 */
	private boolean isApiPath;
	/**
	 * 该模板是否默认路径生成的文件的路径,true为packageName+前缀suffix，false为自定义路径
	 */
	private boolean isDefault;
	/**
	 * 该模板生成的文件的路径,packageName+前缀suffix
	 */
	private String suffix;
	/**
	 * 该模板生成的文件的src路径
	 */
	private String srcPath;
	/**
	 * 生成的文件名
	 */
	private String fileName;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	/**
	 * 生成的文件路径以及文件名
	 */
	public String getFileName() {
		return  fileName;
	}
	/**
	 * 生成的文件路径以及文件名
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public boolean isDefault() {
		return isDefault;
	}

	public void setDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	public boolean isApiPath() {
		return isApiPath;
	}

	public void setApiPath(boolean isApiPath) {
		this.isApiPath = isApiPath;
	}

	public String getSrcPath() {
		return srcPath;
	}

	public void setSrcPath(String srcPath) {
		this.srcPath = srcPath;
	}
}
