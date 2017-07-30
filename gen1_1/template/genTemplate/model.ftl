package ${paramMap.packageName}.model;

<#list table.importClassList as importClass> 
${importClass}
</#list>
import com.minstone.common.bean.BaseEntity;
import org.hibernate.validator.constraints.NotEmpty;
/**
 * ${table.comment},对应的数据库表-->${table.tableName}
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) ${.now?string("yyyy")}  
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
public class ${table.modelName} extends BaseEntity<${table.modelName}> <#noparse>{</#noparse>

	private static final long serialVersionUID = 1L;

	private String[] codes;//${table.comment}所有编码
	
	<#list table.columnList as column>
	<#if column.name != "id" && column.name != "isValid" && column.name != "createTime">
	/** ${column.comment} */
	<#if column.nullAble == "0">
	@NotEmpty
	</#if>
	private ${column.fileType} ${column.name};
	</#if>
	</#list>
	
	public ${table.modelName}() <#noparse>{</#noparse>
	<#noparse>}</#noparse>
	
	<#list table.columnList as column>
	<#if column.name == "id" && column.nullAble == "0">
	/**
	 * 设置${table.modelName}
	 */
	public ${table.modelName}(String id) <#noparse>{</#noparse>
		this.id = id;
	<#noparse>}</#noparse>
	</#if>
	<#if column.name == "applicationCode" && column.nullAble == "0">
	/**
	 * 设置${table.modelName}
	 */
	public ${table.modelName}(String id,${column.fileType} ${column.name}) <#noparse>{</#noparse>
		this.id = id;
		this.${column.name} = ${column.name};
	<#noparse>}</#noparse>
	</#if>
	</#list>
	
	/**
	 * 设置${table.modelName}
	 */
	public ${table.modelName}(<#list table.columnNullList as nullColumn><#if !nullColumn_has_next >${nullColumn.fileType} ${nullColumn.name}<#else>${nullColumn.fileType} ${nullColumn.name},</#if></#list>) <#noparse>{</#noparse>
	<#list table.columnList as column>
	<#if column.nullAble == "0">
		this.${column.name} = ${column.name};
	</#if>
	</#list>
	<#noparse>}</#noparse>
	
	<#list table.columnList as column>
	
	<#if column.name != "id" && column.name != "isValid" && column.name != "createTime" >
	/**
	 * 获取${column.comment}
	 */
	public ${column.fileType} get${column.name?cap_first}() <#noparse>{</#noparse>
		return ${column.name};
	<#noparse>}</#noparse>
	/**
	 * 设置${column.comment}
	 */
	public void set${column.name?cap_first}(${column.fileType} ${column.name}) <#noparse>{</#noparse>
		this.${column.name} = ${column.name};
	<#noparse>}</#noparse>
	</#if>
	</#list>
	
	public String[] getCodes() {
		return codes;
	}

	public void setCodes(String[] codes) {
		this.codes = codes;
	}
<#noparse>}</#noparse>