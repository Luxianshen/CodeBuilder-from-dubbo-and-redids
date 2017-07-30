<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript" src="<#noparse>${</#noparse>pageContext.request.contextPath<#noparse>}</#noparse>/test/common/js/jquery.min.js"></script>
<script type="text/javascript">
var path = "<#noparse>${</#noparse>pageContext.request.contextPath<#noparse>}</#noparse>";
</script>
<html>
<head>
<title>${table.comment}</title>
</head>
<body> 
<#list table.columnList as column>
<#if column.type == "TIMESTAMP">
${column.comment}:<input type="text" value="${.now?string("yyyy-MM-dd hh:mm")}" id="${column.name}" name="${column.name}" /> <br/>
<#else>
${column.comment}:<input type="text" value="" id="${column.name}" name="${column.name}" /> <br/>
</#if>
</#list>    
<br />
<input type="button" value="新增按钮" onclick="save();" />
<input type="button" value="修改按钮" onclick="update();" />
<input type="button" value="根据id获取数据按钮" onclick="getById();" />
<input type="button" value="获取列表按钮" onclick="getList();" />
<input type="button" value="获取分页列表按钮" onclick="getPage();" />

<div style="float: right;position:absolute;right: 10px;top: 10; " >
	请求参数:<br/>
	<textarea id="queryData_" rows="20" cols="200">
	</textarea><br/>
	请求结果:<br/>
	<textarea id="result" rows="20" cols="200">
	</textarea>
</div>
	
</body>
</html>
<script type="text/javascript">
/**
 * 新增按钮
 */
function save(){
	var jsons = {
		<#list table.columnList as column>
		<#if column.name != "isValid" && column.name != "createTime" && column.name != "id">
		${column.name}:$("<#noparse>#</#noparse>${column.name}").val()<#if column_has_next >,</#if> // ${column.comment}
		</#if>
		</#list>
	}
	$.ajax({
		data: jsons,
		type: "post",
		url: path + "/${table.modelName?uncap_first}/save",
		success:function(data){
			console.log(data);
			$("<#noparse>#</#noparse>queryData_").val(JSON.stringify(jsons));
			$("<#noparse>#</#noparse>result").val(JSON.stringify(data));
		}
	});
}
/**
 * 修改按钮
 */
function update(){
	var jsons = {
		<#list table.columnList as column>
		<#if column.name != "createTime">
		${column.name}:$("<#noparse>#</#noparse>${column.name}").val()<#if column_has_next >,</#if> // ${column.comment}
		</#if>
		</#list>
	}
	$.ajax({
		data: jsons,
		type: "post",
		url: path + "/${table.modelName?uncap_first}/update",
		success:function(data){
			console.log(data);
			$("<#noparse>#</#noparse>queryData_").val(JSON.stringify(jsons));
			$("<#noparse>#</#noparse>result").val(JSON.stringify(data));
		}
	});
}
/**
 * 根据id获取数据按钮
 */
function getById(){
	var jsons = {
	}
	$.ajax({
		type: "post",
		url: path + "/${table.modelName?uncap_first}/id=" + $("<#noparse>#</#noparse>id").val(),
		success:function(data){
			console.log(data);
			$("<#noparse>#</#noparse>queryData_").val(JSON.stringify(jsons));
			$("<#noparse>#</#noparse>result").val(JSON.stringify(data));
		}
	});
}
/**
 * 获取列表按钮
 */
function getList(){
	var jsons = {
		<#list table.columnList as column>
		<#if column.name != "createTime">
		${column.name}:$("<#noparse>#</#noparse>${column.name}").val()<#if column_has_next >,</#if> // ${column.comment}
		</#if>
		</#list>
	}
	$.ajax({
		data: jsons,
		type: "post",
		url: path + "/${table.modelName?uncap_first}",
		success:function(data){
			console.log(data);
			$("<#noparse>#</#noparse>queryData_").val(JSON.stringify(jsons));
			$("<#noparse>#</#noparse>result").val(JSON.stringify(data));
		}
	});
}
/**
 * 获取分页列表按钮
 */
function getPage(){
	var jsons = {
		page:"1",	// 页数
		rows:"10",// 行数
		<#list table.columnList as column>
		<#if column.name != "createTime">
		${column.name}:$("<#noparse>#</#noparse>${column.name}").val()<#if column_has_next >,</#if> // ${column.comment}
		</#if>
		</#list>
	}
	$.ajax({
		data: jsons,
		type: "post",
		url: path + "/${table.modelName?uncap_first}/page",
		success:function(data){
			console.log(data);
			$("<#noparse>#</#noparse>queryData_").val(JSON.stringify(jsons));
			$("<#noparse>#</#noparse>result").val(JSON.stringify(data));
		}
	});
}
</script>