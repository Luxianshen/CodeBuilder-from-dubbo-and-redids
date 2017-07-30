<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>com.minstone.platform.parent</groupId>
		<artifactId>${paramMap.parentProjectName}</artifactId>
		<version>${paramMap.parentProjectVersion}</version>
	</parent>
	<groupId>com.minstone.platform.service</groupId>
	<artifactId>${paramMap.apiProjectName}</artifactId>
	<name>${paramMap.apiProjectName}</name>
	<version>${paramMap.apiProjectVersion}</version>
	
	<dependencies>
		<dependency>
			<groupId>com.minstone.platform.common</groupId>
			<artifactId>platform-basic-api</artifactId>
		</dependency>
		<dependency>
			<groupId>com.github.pagehelper</groupId>
			<artifactId>pagehelper</artifactId>
		</dependency>
	</dependencies>
</project>