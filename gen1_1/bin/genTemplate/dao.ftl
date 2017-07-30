package ${paramMap.packageName}.dao;

import com.minstone.common.persistence.CrudDao;
import com.minstone.common.persistence.annotation.MyBatisDao;
import ${paramMap.packageName}.model.${table.modelName};

/**
 * ${table.comment}持久层
 * 
 * @copyright xx Copyright (c) ${.now?string("yyyy")}
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
@MyBatisDao
public interface ${table.modelName}Dao extends CrudDao<${table.modelName}> <#noparse>{</#noparse>
	
<#noparse>}</#noparse>