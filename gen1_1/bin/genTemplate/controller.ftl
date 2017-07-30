package ${paramMap.packageName}.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.minstone.gx.common.web.controller.BaseController;

import ${paramMap.packageName}.model.${table.modelName};
import ${paramMap.packageName}.service.${table.modelName}Service;

/**
 * ${table.comment}控制层
 * 
 * @copyright xx Copyright (c) ${.now?string("yyyy")}
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
@RestController
@RequestMapping("/${table.modelName?uncap_first}")
public class ${table.modelName}Controller extends BaseController<${table.modelName}Service, ${table.modelName}> <#noparse>{</#noparse>
	
<#noparse>}</#noparse>