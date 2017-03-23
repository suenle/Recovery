package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IDistrictDao;
import com.huifu.entity.District;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class DistrictDao extends BaseIbatis3Dao<District, Integer> implements IDistrictDao {

	public Class getEntityClass() {
		return District.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("District.deleteByPrimaryKey", id);
	}

	public int insert(District record) {
		
		return getSqlSession().insert("District.insert", record);
	}

	public int insertSelective(District record) {
		
		return getSqlSession().insert("District.insertSelective", record);
	}

	public District selectByPrimaryKey(Integer id) {
		
		return getSqlSession().selectOne("District.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(District record) {
		return getSqlSession().update("District.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(District record) {
		
		return getSqlSession().update("District.updateByPrimaryKey", record);
	}

	public District checkLogin(District record) {
		
		return getSqlSession().selectOne("District.checkLogin", record);
	}

	public List<District> getAllDistrict() {
		
		return getSqlSession().selectList("District.getAllDistrict");
	}









}
