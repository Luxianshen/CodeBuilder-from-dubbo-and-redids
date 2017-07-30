mybatis: 
  mapperLocations: classpath:mappings/modules/**/*.xml
  typeAliasesPackage: com.minstone
  typeAliasesSuperType: com.minstone.common.bean.BaseEntity 
  configLocation: classpath:/mybatis-config.xml
spring:
    datasource:
        name: test
        url: ${paramMap.url}
        username: ${paramMap.username}
        password: ${paramMap.password}
        # 使用druid数据源
        type: com.alibaba.druid.pool.DruidDataSource
        driver-class-name: ${paramMap.driver}
        filters: stat
        maxActive: 200
        initialSize: 1
        maxWait: 60000
        minIdle: 1
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: select 'x'
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxOpenPreparedStatements: 20
