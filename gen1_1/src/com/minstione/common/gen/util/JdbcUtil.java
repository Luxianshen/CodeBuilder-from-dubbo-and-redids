package com.minstione.common.gen.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

/**
 * jdbc工具类
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 * @since 2016-3-18
 * @author Mazp
 * @version 1.0
 *
 */
public class JdbcUtil {
	
	
	public static Connection conn;
	
	public static Connection getConn() {
		if (null == conn) {
			Map<String, String> paramMap = TemplateUtil.getConf().getParamMap();
			
			String driver = paramMap.get("driver");
			String url = paramMap.get("url");
			String username = paramMap.get("username");
			String password = paramMap.get("password");
			try {
				Class.forName(driver); //classLoader,加载对应驱动
				 Properties props =new Properties();   
			       props.put("remarksReporting","true");
			       props.setProperty("oracle.jdbc.V8Compatible","true");
			       props.put("user", username);
			       props.put("password", password);

			       conn = DriverManager.getConnection(url, props);
			       
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	    return conn;
	}
	
}
