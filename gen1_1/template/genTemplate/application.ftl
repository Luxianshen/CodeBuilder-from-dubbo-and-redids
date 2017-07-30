package com.minstone.platform;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 启动类
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) ${.now?string("yyyy")}  
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan
@EnableTransactionManagement
public class Application {
	protected static Logger logger = LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
		logger.info("用户服务启动......");
		SpringApplication.run(Application.class, args);
		logger.info("用户服务启动中......");
	}
}
