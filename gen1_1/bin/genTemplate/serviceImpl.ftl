package ${paramMap.packageName}.api;

import java.util.List;

import javax.validation.ConstraintViolationException;
import javax.validation.Validator;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.minstone.common.constant.PublicConstant;
import com.minstone.common.exception.CommonException;
import com.minstone.common.utils.IdGen;
import com.minstone.common.utils.mapper.JsonMapper;
import ${paramMap.packageName}.constant.${table.modelName}Constant;
import ${paramMap.packageName}.model.${table.modelName};
import ${paramMap.packageName}.service.${table.modelName}Service;
import ${paramMap.packageName}.service.I${table.modelName}Api;
import com.minstone.platform.cache.service.ICacheApi;
<#if table.modelRedis == "true">
import com.minstone.platform.bdm.org.area.constant.AreaContant;
import java.util.ArrayList;
import com.fasterxml.jackson.databind.JavaType;
</#if>

/**
 * ${table.comment}事务层
 * 
 * @copyright xx Copyright (c) ${.now?string("yyyy")}
 * @since ${.now?string("yyyy-MM-dd")} 
 * @author ${paramMap.author}
 * @version 1.0
 * 
 */
@Service("${paramMap.lowerCaseModelName}Api")
public class ${table.modelName}ApiImpl implements I${table.modelName}Api <#noparse>{</#noparse>

	private Logger LOGGER = LoggerFactory.getLogger(${table.modelName}ApiImpl.class);
	
	@Autowired
	private ${table.modelName}Service entityService;
	<#if table.modelRedis == "true">
	//缓存开启
	@Autowired
	private ICacheApi cacheApi;
    </#if>
	@Autowired
	private Validator validator;
	
	@Override
	public ${table.modelName} get(${table.modelName} entity) {
		try {
			entity.entityValidator(entity, validator, "${paramMap.pkLowerCaseName}");
			<#if table.modelRedis == "true">
			//缓存开启
			//获取缓存数据
			String cacheVal = cacheApi.get(${table.modelName}Constant.${table.constant}+entity.get${paramMap.pkName}());
			if(StringUtils.isNotBlank(cacheVal)) {
				entity = (${table.modelName}) JsonMapper.fromJsonString(cacheVal,${table.modelName}.class);
			}else {
				entity = entityService.get(entity);
				if(entity != null) {
					cacheApi.set(${table.modelName}Constant.${table.constant}+entity.get${paramMap.pkName}(), JsonMapper.toJsonString(entity));
				}
			}
			</#if>
			return entity;
		}catch (ConstraintViolationException cvEx) {
			LOGGER.error("参数校验失败,异常信息：", cvEx);
		}catch(Exception e) {
			LOGGER.error("报错-位置：[${table.modelName}ApiImpl->get]", e);
		}
		return null;
	}

	@Override
	public List<${table.modelName}> findAllList() {
		try {
		    <#if table.modelRedis != "true">
			List<${table.modelName}> dbList = entityService.findAllList();
			</#if>
			<#if table.modelRedis == "true">
		    //缓存开启
		    JavaType javaType = JsonMapper.getInstance().createCollectionType(ArrayList.class, ${table.modelName}.class); 
			List<${table.modelName}> dbList = (List<${table.modelName}>) JsonMapper.fromJsonObject(cacheApi.get(${table.modelName}Constant.${table.constant}_ALL),javaType);
			if (dbList == null) {
				dbList = entityService.findAllList();

				cacheApi.set(${table.modelName}Constant.${table.constant}_ALL, JsonMapper.toJsonString(dbList));
			}
			</#if>
			return dbList;
		}catch(Exception e) {
			LOGGER.error("报错-位置：[${table.modelName}ApiImpl->findAllList]", e);
		}
		return Lists.newArrayList();
	}

	@Override
	public PageInfo<${table.modelName}> findPage(PageInfo<${table.modelName}> page,
			${table.modelName} entity) {
		try {
			return entityService.findPage(page, entity);
		}catch (ConstraintViolationException cvEx) {
			LOGGER.error("参数校验失败,异常信息：", cvEx);
		}catch(Exception e) {
			LOGGER.error("报错-位置：[${table.modelName}ApiImpl->findPage]", e);
		}
		return null;
	}

	@Override
	public boolean delete(${table.modelName} entity) throws CommonException {
		boolean rtn = false;
		entity.entityValidator(entity, validator, "${paramMap.pkLowerCaseName}");
		String[] arrayString = entity.get${paramMap.pkName}().split(",");
		if(entityService.deleteAll(arrayString) > 0) {
			rtn = true;
		<#if table.modelRedis == "true">
            //缓存开启
			cacheApi.del(${table.modelName}Constant.${table.constant}+entity.get${paramMap.pkName}());
			cacheApi.del(${table.modelName}Constant.${table.constant}_ALL);
		</#if>
		}
		return rtn;
	}

	@Override
	public boolean deleteAll(${table.modelName} entity) throws CommonException {
		boolean rtn = false;
		entity.entityValidator(entity, validator, "codes");
		if(entityService.deleteAll(entity.getCodes())>0) {
			rtn = true;
		<#if table.modelRedis == "true">
            //缓存开启
			for(String code : entity.getCodes()) {
				cacheApi.del(${table.modelName}Constant.${table.constant}+code);
			}
			cacheApi.del(${table.modelName}Constant.${table.constant}_ALL);
		</#if>
		}
		return rtn;
	}

	@Override
	public boolean insert(${table.modelName} entity) throws CommonException {
		entity.entityValidator(entity, validator, "${paramMap.pkLowerCaseName}");
		entity.setIsNewRecord(true);
		entity.setDelFlag(0);
		if(get(entity) != null) {
			throw new CommonException("保存失败，数据库（"+entity.get${paramMap.pkName}()+"）已存在!");
		}
		return entityService.insert(entity)>0;
	}

	@Override
	public boolean update(${table.modelName} entity)throws CommonException  {
		entity.entityValidator(entity, validator, "${paramMap.pkLowerCaseName}");
		entity.setIsNewRecord(false);
		return entityService.update(entity)>0;
	}

	@Override
	public List<${table.modelName}> findList(${table.modelName} entity) {
		try {
			return entityService.findList(entity);
		}catch (ConstraintViolationException cvEx) {
			LOGGER.error("参数校验失败,异常信息：", cvEx);
		}catch(Exception e) {
			LOGGER.error("报错-位置：[${table.modelName}ApiImpl->findList]", e);
		}
		return Lists.newArrayList();
	}
	
	@Override
	public List<${table.modelName}> findAllList(${table.modelName} entity) {
		try{
		    <#if table.modelRedis != "true">
			List<${table.modelName}> areaList = entityService.findAllList(entity);
			</#if>
			<#if table.modelRedis == "true">
            //缓存开启
            JavaType javaType = JsonMapper.getInstance().createCollectionType(ArrayList.class, ${table.modelName}.class); 
			List<${table.modelName}> areaList = (List<${table.modelName}>)JsonMapper.fromJsonObject(cacheApi.get(AreaContant.CACHE_YYZC_BDM_AREA_LIST),javaType);
			if (areaList == null) {
				areaList = entityService.findAllList(entity);
				//写入缓存
				cacheApi.set(AreaContant.CACHE_YYZC_BDM_AREA_LIST, JsonMapper.toJsonString(areaList));
			}
			if(null != entity) {
				if(StringUtils.isNotBlank(entity.getApplicationCode())){
					//需要做应用系统过滤
					List<${table.modelName}> tempList = Lists.newArrayList();
					for(${table.modelName} a : areaList) {
						//获取指定应用系统和公共系统的区域数据
						if(PublicConstant.APPLICATION_CODE.equals(a.getApplicationCode())
								|| entity.getApplicationCode().equals(a.getApplicationCode())) {
							tempList.add(a);
						}
					}
					return tempList;
				}
			}
			 </#if>
			return areaList;
		}catch (ConstraintViolationException cvEx) {
			LOGGER.error("参数校验失败,异常信息：", cvEx);
		}catch(Exception e) {
			LOGGER.error("报错-位置：[${table.modelName}ApiImpl->findAllList]", e);
		}
		return Lists.newArrayList();
	}
	
<#noparse>}</#noparse>