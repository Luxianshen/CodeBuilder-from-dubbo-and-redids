package ${paramMap.packageName}.constant;

/**
 * @Description:   ${table.comment}常量类
 * @author:    ${paramMap.author}
 * @date:    ${.now?string("yyyy-MM-dd")} 
 * @version    V1.0   
 * @copyright 广州明动软件股份有限公司 Copyright (c) 2016
 */
public class ${table.modelName}Constant <#noparse>{</#noparse>

    <#if table.modelRedis == "true">
    public static final String ${table.constant} = "${table.constant}";
    public static final String ${table.constant}_ALL = "${table.constant}_ALL";
    </#if>
<#noparse>}</#noparse>
