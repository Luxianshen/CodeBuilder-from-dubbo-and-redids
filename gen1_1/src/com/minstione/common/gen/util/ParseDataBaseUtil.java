package com.minstione.common.gen.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.minstione.common.gen.model.Column;
import com.minstione.common.gen.model.Conf;
import com.minstione.common.gen.model.FieldType;
import com.minstione.common.gen.model.Table;
import com.mysql.jdbc.StringUtils;

/**
 * 解析数据库的工具类
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2017
 * @since 2017-1-13
 * @author Mazp
 * @version 1.0
 *
 */
public class ParseDataBaseUtil {
	
	public static Table parseDataBaseTable(Conf conf) throws Exception {
        // 定义表格
        Table table = new Table();
		table.setComment(conf.getParamMap().get("comment"));	// 表的注释
		table.setModelName(conf.getParamMap().get("modelName"));// model名称.因为pdm需要,所以这里有冗余.
		table.setTableName(conf.getParamMap().get("tableName"));// 表名
		table.setModelRedis(conf.getParamMap().get("modelRedis")); //是否需要缓存
		table.setConstant(conf.getParamMap().get("constant")); //redis key值
		setColumnList(table, conf); // 设置列信息
        
		return table;
		
	}
	
	// 其他数据库不需要这个方法 oracle和db2需要
	private static String getSchema(Connection conn) throws Exception {
		String schema;
		schema = conn.getMetaData().getUserName();
		if ((schema == null) || (schema.length() == 0)) {
			throw new Exception("ORACLE数据库模式不允许为空");
		}
		return schema.toUpperCase().toString();

	}
	
	/**
	 * 设置列的信息
	 * @param columnsElement
	 * @param table
	 * @param conf 
	 * @throws SQLException 
	 */
	private static void setColumnList(Table table, Conf conf) throws Exception {
		 // 设置字段信息
        Connection conn = JdbcUtil.getConn();
        // 获取指定表的信息
		ResultSet rs = conn.getMetaData().getColumns(null, getSchema(conn), conf.getParamMap().get("tableName").toUpperCase(), "%"); 
		
		// 定义列
        Column column = null;
        Set<String> importClassSet = new HashSet<String>();	// 需要导入的jar包
        List<Column> columnNullList = new ArrayList<Column>();	// 不为空列属性
        List<Column> columnList = new ArrayList<Column>();	// 列属性
        
        while (rs.next()) {
			column = new Column();
			String sqlName = rs.getString("COLUMN_NAME"); // 数据库字段名称
			String names[] = sqlName.split("_");
			String name = "";
			for (int i = 0; i < names.length; i++) {
				if (i ==0) {
					name = names[0].toLowerCase();
				} else {
					name += names[i].substring(0,1).toUpperCase() + names[i].substring(1).toLowerCase();
				}
			}
			String comment = rs.getString("REMARKS"); // 字段注释
			String sqltype = rs.getString("TYPE_NAME"); // 数据库字段类型
			String nullable = rs.getString("NULLABLE"); // 字段是否允许为空
			column.setName(name);// model属性名
			column.setSqlName(sqlName);// 对应的数据库字段名
			column.setNullAble(nullable);// 该字段是否允许为空
			
			if(StringUtils.isNullOrEmpty(comment)){
				column.setComment("");// 字段注释
			}else{
				column.setComment(comment);// 字段注释
				
			}
			FieldType fieldType = FieldType.getFieldType(conf, sqltype); // 从map中获取到对应的字段类型model
			
			column.setType(fieldType.getMybatisFieldType());// mybatis对应的字段类型
			
			column.setFileType(fieldType.getModelFieldType());	// 设置model的类型
			
			// 判断是否有需要导入的jar包,如果有的话,那么就将需要导入的jar包,加到对应的表之中
			if (null != fieldType.getImportClass() && !"".equals(fieldType.getImportClass())) {
				importClassSet.add(fieldType.getImportClass());
			}
			if(column.getNullAble().equals("0")){
				columnNullList.add(column);
			}
			columnList.add(column);
		}
        // 没有列,那么说明表是不存在的或者说没有列.
        if (columnList.size() == 0) {
        	System.err.println("想要查询的表,不存在于数据库中,或者该表,没有列,因此本次无法生成代码.");
			System.exit(0);
        }
        
		table.setImportClassSet(importClassSet);	// 设置需要导入的jar包
		table.setColumnNullList(columnNullList); // 设置列不为空的属性信息
		table.setColumnList(columnList);	// 设置列的属性信息
	}
	
}
