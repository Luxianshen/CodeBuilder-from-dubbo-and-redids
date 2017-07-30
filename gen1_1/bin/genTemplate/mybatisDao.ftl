<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${paramMap.packageName}.dao.${table.modelName}Dao">
    <resultMap id="BaseResultMap" type="${table.modelName}">
	<#list table.columnList as column>
		<result property="${column.name}" column="${column.sqlName}" jdbcType="${column.type}"/>
	</#list>    
    </resultMap>

    <sql id="Base_Column_List">
	<#list table.columnList as column>
		${column.sqlName} as ${column.name}<#if column_has_next >,</#if>
	</#list>    
    </sql>

    <insert id="insert" parameterType="${table.modelName}">
        INSERT INTO ${table.tableName}(
	<#list table.columnList as column>
			${column.sqlName}<#if column_has_next >,</#if>
	</#list>
        ) VALUES (
	<#list table.columnList as column>
			<#noparse>#{</#noparse>${column.name},jdbcType=${column.type}<#noparse>}</#noparse><#if column_has_next >,</#if>
	</#list>
        )
    </insert>

	<update id="update" parameterType="${table.modelName}" >
        UPDATE ${table.tableName} 
        <set>
		<#list table.columnList as column>
	        <if test="${column.name} != null">
				${column.sqlName} = <#noparse>#{</#noparse>${column.name},jdbcType=${column.type}<#noparse>}</#noparse>,
			</if>
		</#list>	
		</set>	        
        WHERE ${paramMap.pk} = <#noparse>#{</#noparse>${paramMap.pkLowerCaseName},jdbcType=VARCHAR<#noparse>}</#noparse>
	</update>
	
	<select id="get" resultType="${table.modelName}">
		SELECT
		<include refid="Base_Column_List" />
		FROM ${table.tableName} 
		WHERE ${paramMap.pk} = <#noparse>#{</#noparse>${paramMap.pkLowerCaseName}, jdbcType=VARCHAR<#noparse>}</#noparse>
	</select>
	 
	<select id="findList" resultType="${table.modelName}">
		SELECT
		<include refid="Base_Column_List" />
		FROM ${table.tableName} 
		WHERE
		<#list table.columnList as column>
	        <if test="${column.name} != null">
			${column.sqlName} like 
			<if test="dbName == 'oracle'">'%'||<#noparse>#{</#noparse>${column.name},jdbcType=${column.type}<#noparse>}</#noparse>||'%'</if>
			<if test="dbName == 'mssql'">'%'+<#noparse>#{</#noparse>${column.name},jdbcType=${column.type}<#noparse>}</#noparse>+'%'</if>
			<if test="dbName == 'mysql'">CONCAT<#noparse>('%',#{</#noparse>${column.name},jdbcType=${column.type}<#noparse>}</#noparse>, '%'<#noparse>)</#noparse></if> 
			AND
			</if>
		</#list>	
			1=1
	</select>
	
	<update id="deleteAll">
		delete from ${table.tableName} 
		WHERE ${paramMap.pk} in
		<foreach item="item" index="index" collection="array" open="("
			separator="," close=")"> <#noparse>#{</#noparse>item<#noparse>}</#noparse>
		</foreach>
	</update>
	
	<select id="findAllList" resultType="${table.modelName}">
		SELECT
			<include refid="Base_Column_List"/>
		FROM ${table.tableName} 
	</select>
	
</mapper>
