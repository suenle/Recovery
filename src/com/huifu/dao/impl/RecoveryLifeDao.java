package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IRecoveryLifeDao;
import com.huifu.entity.RecoveryLife;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class RecoveryLifeDao extends BaseIbatis3Dao<RecoveryLife, Integer> implements IRecoveryLifeDao {

	public Class getEntityClass() {
		return RecoveryLife.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("RecoveryLife.deleteByPrimaryKey", id);
	}

	public int insert(RecoveryLife record) {
		
		return getSqlSession().insert("RecoveryLife.insert", record);
	}

	public int insertSelective(RecoveryLife record) {
		
		return getSqlSession().insert("RecoveryLife.insertSelective", record);
	}

	public RecoveryLife selectByPrimaryKey(Integer id) {
		
		return getSqlSession().selectOne("RecoveryLife.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(RecoveryLife record) {
		return getSqlSession().update("RecoveryLife.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(RecoveryLife record) {
		
		return getSqlSession().update("RecoveryLife.updateByPrimaryKey", record);
	}

	public RecoveryLife checkLogin(RecoveryLife record) {
		
		return getSqlSession().selectOne("RecoveryLife.checkLogin", record);
	}









}
