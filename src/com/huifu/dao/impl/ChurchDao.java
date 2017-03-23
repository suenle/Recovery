package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IChurchDao;
import com.huifu.entity.Church;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class ChurchDao extends BaseIbatis3Dao<Church, Integer> implements
		IChurchDao {

	public Class getEntityClass() {
		return Church.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("Church.deleteByPrimaryKey", id);
	}

	public int insert(Church record) {

		return getSqlSession().insert("Church.insert", record);
	}

	public int insertSelective(Church record) {

		return getSqlSession().insert("Church.insertSelective", record);
	}

	public Church selectByPrimaryKey(Integer id) {

		return getSqlSession().selectOne("Church.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(Church record) {
		return getSqlSession().update("Church.updateByPrimaryKeySelective",
				record);
	}

	public int updateByPrimaryKey(Church record) {

		return getSqlSession().update("Church.updateByPrimaryKey", record);
	}

	public Church checkLogin(Church record) {

		return getSqlSession().selectOne("Church.checkLogin", record);
	}

	public List<Church> getAllChurch() {

		return getSqlSession().selectList("Church.getAllChurch");
	}

}
