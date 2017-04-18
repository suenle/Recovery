package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IHomeDao;
import com.huifu.entity.Home;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class HomeDao extends BaseIbatis3Dao<Home, Integer> implements IHomeDao {

	public Class getEntityClass() {
		return Home.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("Home.deleteByPrimaryKey", id);
	}

	public int insert(Home record) {

		return getSqlSession().insert("Home.insert", record);
	}

	public int insertSelective(Home record) {

		return getSqlSession().insert("Home.insertSelective", record);
	}

	public Home selectByPrimaryKey(Integer id) {

		return getSqlSession().selectOne("Home.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(Home record) {
		return getSqlSession().update("Home.updateByPrimaryKeySelective",
				record);
	}

	public int updateByPrimaryKey(Home record) {

		return getSqlSession().update("Home.updateByPrimaryKey", record);
	}

	public List<Home> getAllHome() {

		return getSqlSession().selectList("Home.getAllHome");
	}

	public Home selectByName(Home record) {
		
		return getSqlSession().selectOne("Home.selectByName", record);
	}

	public Home HomeIsExist(Home record) {
		
		return getSqlSession().selectOne("Home.HomeIsExist", record);
	}

	public List<Home> queryHome(Map<String, Object> data) {
		
		return getSqlSession().selectList("Home.queryHome", data);
	}

	public int getHomeNum(Map<String, Object> data) {
		
		return getSqlSession().selectOne("Home.getHomeNum", data);
	}

}
