<?xml version="1.0"?>
<project
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
	xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>com.minstone.platform.parent</groupId>
		<artifactId>${paramMap.parentProjectName}</artifactId>
		<version>${paramMap.parentProjectVersion}</version>
	</parent>
	<groupId>com.minstone.platform.service</groupId>
	<artifactId>${paramMap.providerProjectName}</artifactId>
	<version>${paramMap.providerProjectVersion}</version>
	<name>${paramMap.providerProjectName}</name>

	<dependencies>
		<dependency>
			<groupId>com.minstone.platform.common</groupId>
			<artifactId>platform-basic-api</artifactId>
		</dependency>

		<dependency>
			<groupId>com.minstone.platform.common</groupId>
			<artifactId>platform-basic-core</artifactId>
		</dependency>

		<dependency>
			<groupId>com.minstone.platform.service</groupId>
			<artifactId>${paramMap.apiProjectName}</artifactId>
			<version>${paramMap.apiProjectVersion}</version>
		</dependency>

		<dependency>
			<groupId>com.minstone.platform.service</groupId>
			<artifactId>platform-cache-api</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter</artifactId>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>

		<dependency>
			<groupId>org.mybatis.spring.boot</groupId>
			<artifactId>mybatis-spring-boot-starter</artifactId>
		</dependency>

		<!-- 分页插件 start -->
		<dependency>
			<groupId>com.github.pagehelper</groupId>
			<artifactId>pagehelper</artifactId>
		</dependency>

		<dependency>
			<groupId>com.github.jsqlparser</groupId>
			<artifactId>jsqlparser</artifactId>
		</dependency>

		<!-- druid阿里巴巴数据库连接池 -->
		<dependency>
			<groupId>com.alibaba</groupId>
			<artifactId>druid</artifactId>
		</dependency>

		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
		</dependency>

		<dependency>
			<groupId>com.alibaba</groupId>
			<artifactId>dubbo</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.zookeeper</groupId>
			<artifactId>zookeeper</artifactId>
		</dependency>

		<dependency>
			<groupId>com.github.sgroschupf</groupId>
			<artifactId>zkclient</artifactId>
		</dependency>

		<dependency>
			<groupId>com.minstone.industry.app.starter</groupId>
			<artifactId>DubboStarter</artifactId>
		</dependency>

		<!-- bean validate -->
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-validator</artifactId>
		</dependency>

		<dependency>
			<groupId>commons-validator</groupId>
			<artifactId>commons-validator</artifactId>
		</dependency>
        <#if table.modelRedis == "true">
        <dependency>
			<groupId>com.minstone.platform.service</groupId>
			<artifactId>bdm-org-api</artifactId>
		</dependency>
		</#if>
	</dependencies>

	<build>
		<plugins>
			<!-- 打包jar文件时，配置manifest文件，加入lib包的jar依赖 -->
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-jar-plugin</artifactId>
				<configuration>
					<classesDirectory>target/classes/</classesDirectory>
					<archive>
						<manifest>
							<mainClass>com.minstone.platform.Application</mainClass>
							<!-- 打包时 MANIFEST.MF文件不记录的时间戳版本 -->
							<useUniqueVersions>false</useUniqueVersions>
							<addClasspath>true</addClasspath>
							<classpathPrefix><#noparse>${</#noparse>class-path<#noparse>}</#noparse>lib/</classpathPrefix>
						</manifest>
						<manifestEntries>
							<Class-Path>.</Class-Path>
						</manifestEntries>
					</archive>
				</configuration>
			</plugin>

			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-dependency-plugin</artifactId>
				<executions>
					<execution>
						<id>copy-dependencies</id>
						<phase>package</phase>
						<goals>
							<goal>copy-dependencies</goal>
						</goals>
						<configuration>
							<type>jar</type>
							<includeTypes>jar</includeTypes>
							<useUniqueVersions>false</useUniqueVersions>
							<outputDirectory>
								<#noparse>${</#noparse>project.build.directory<#noparse>}</#noparse>/<#noparse>${</#noparse>class-path<#noparse>}</#noparse>lib
							</outputDirectory>
						</configuration>
					</execution>
				</executions>
			</plugin>
		</plugins>

	</build>
</project>
