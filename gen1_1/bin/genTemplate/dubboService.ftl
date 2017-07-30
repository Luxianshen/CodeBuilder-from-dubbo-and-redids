<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:dubbo="http://code.alibabatech.com/schema/dubbo"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
       http://code.alibabatech.com/schema/dubbo
       http://code.alibabatech.com/schema/dubbo/dubbo.xsd">

    <context:property-placeholder file-encoding="utf-8"
                                  ignore-unresolvable="true"
                                  ignore-resource-not-found="true"
                                  system-properties-mode="OVERRIDE"
                                  location="classpath:dubbo.properties" />

	<!-- 提供方应用信息，用于计算依赖关系 -->
    <dubbo:application name="<#noparse>${</#noparse>dubbo.application.name<#noparse>}</#noparse>" owner="<#noparse>${</#noparse>dubbo.application.owner<#noparse>}</#noparse>"/>

    <!-- 使用zookeeper注册中心暴露服务地址 -->
	<dubbo:registry protocol="zookeeper" address="<#noparse>${</#noparse>dubbo.registry.address<#noparse>}</#noparse>" />

	<!-- 用dubbo协议端口暴露服务 -->
    <dubbo:protocol name="<#noparse>${</#noparse>dubbo.protocol.name<#noparse>}</#noparse>" port="<#noparse>${</#noparse>dubbo.protocol.port<#noparse>}</#noparse>" />
	
	<!-- 当ProtocolConfig和ServiceConfig某属性没有配置时,采用此缺省值 -->
	<dubbo:provider timeout="10000" threadpool="fixed" threads="100" accepts="1000" />
	
	<!-- 缓存服务接口 -->
	<dubbo:reference  version="<#noparse>${</#noparse>dubbo.service.cache.version<#noparse>}</#noparse>" interface="com.minstone.platform.cache.service.ICacheApi" id="cacheApi" check="false" />

    <!-- ${paramMap.comment}接口 -->
	<dubbo:service  version="<#noparse>${</#noparse>dubbo.service.${paramMap.lowerCaseModelName}.version<#noparse>}</#noparse>" interface="${paramMap.packageName}.service.I${paramMap.modelName}Api" ref="${paramMap.lowerCaseModelName}Api"/>
	
	<!-- 配置 JSR303 Bean Validator 定义 -->
	<bean id="validator" class="org.springframework.validation.beanvalidation.LocalValidatorFactoryBean" />
</beans>