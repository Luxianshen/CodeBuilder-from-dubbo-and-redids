package com.minstone.platform.configuration;

import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis扫描
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) ${.now?string("yyyy")}  
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
@Configuration
// 因为这个对象的扫描，需要在MyBatisConfig的后面注入，所以加上下面的注解
@AutoConfigureAfter(MyBatisConfig.class)
public class MyBatisMapperScannerConfig {
	@Bean
	public MapperScannerConfigurer mapperScannerConfigurer() {
		MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
		// 获取之前注入的beanName为sqlSessionFactory的对象
		mapperScannerConfigurer
				.setSqlSessionFactoryBeanName("sqlSessionFactory");
		// 指定xml配置文件的路径
		mapperScannerConfigurer.setBasePackage("com.minstone.**.dao");
		mapperScannerConfigurer.setAnnotationClass(com.minstone.common.persistence.annotation.MyBatisDao.class);
		return mapperScannerConfigurer;
	}
}
