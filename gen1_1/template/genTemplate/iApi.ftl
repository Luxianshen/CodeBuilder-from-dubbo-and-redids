package ${paramMap.packageName}.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.minstone.common.exception.CommonException;
import ${paramMap.packageName}.model.${table.modelName};

/**
 * ${table.comment}服务接口
 * 
 * @copyright 广州明动软件股份有限公司 Copyright (c) ${.now?string("yyyy")}  
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
public interface I${table.modelName}Api {
	
	/**
	 * 获取单条数据
	 * @param entity,必填code
	 * @return entity
	 */
	public ${table.modelName} get(${table.modelName} entity);
	
	/**
	 * 查询列表数据
	 * @param entity,必填applicationCode
	 * @return List<${table.modelName}>
	 */
	public List<${table.modelName}> findList(${table.modelName} entity);
	
	/**
	 * 查询所有数据
	 * @return List<${table.modelName}>
	 */
	public List<${table.modelName}> findAllList();
	
	/**
	 * 查询指定域的所有数据
	 * @param entity,必填applicationCode
	 * @return List<${table.modelName}>
	 */
	public List<${table.modelName}> findAllList(${table.modelName} entity);
	
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity,必填applicationCode
	 * @return PageInfo<${table.modelName}>
	 */
	public PageInfo<${table.modelName}> findPage(PageInfo<${table.modelName}> page, ${table.modelName} entity);
	
	/**
	 * 删除数据
	 * @param area，必填code
	 * return boolean 是否操作成功
	 */
	public boolean delete(${table.modelName} entity) throws CommonException;
	
	
	/**
	 * 删除数据
	 * @param entity,必填codes
	 * return boolean 是否操作成功
	 */
	public boolean deleteAll(${table.modelName} entity) throws CommonException;
	
	
	/**
	 * 新增数据
	 * @param entity,必填code、applicationCode
	 * return boolean 是否操作成功
	 */
	public boolean insert(${table.modelName} entity) throws CommonException;
	
	
	/**
	 * 更新数据
	 * @param entity,必填code、applicationCode
	 * return boolean 是否操作成功
	 */
	public boolean update(${table.modelName} entity) throws CommonException;
	
}
