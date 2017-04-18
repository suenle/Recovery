package com.huifu.dao.impl;

import java.util.HashMap;
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
public class RecoveryLifeDao extends BaseIbatis3Dao<RecoveryLife, Integer>
		implements IRecoveryLifeDao {

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
		return getSqlSession().update(
				"RecoveryLife.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(RecoveryLife record) {

		return getSqlSession()
				.update("RecoveryLife.updateByPrimaryKey", record);
	}

	public RecoveryLife checkLogin(RecoveryLife record) {

		return getSqlSession().selectOne("RecoveryLife.checkLogin", record);
	}

	public RecoveryLife getTodayInfoByUseridAndTime(Map<String, Object> data) {

		return getSqlSession().selectOne(
				"RecoveryLife.getTodayInfoByUseridAndTime", data);
	}

	public RecoveryLife getLastdayInfoByUseridAndTime(Map<String, Object> data) {
		return getSqlSession().selectOne(
				"RecoveryLife.getLastdayInfoByUseridAndTime", data);
	}

	public List<RecoveryLife> getLifeInfoBySomeDate(Map<String, Object> data) {
		
		return getSqlSession().selectList(
				"RecoveryLife.getLifeInfoBySomeDate", data);
	}

	public List<RecoveryLife> getLifeInfoListByUserId(Map<String, Object> data) {
		return getSqlSession().selectList(
				"RecoveryLife.getLifeInfoListByUserId", data);
	}

	public List<RecoveryLife> queryLifeInfoListByUserId(Map<String, Object> data) {
		return getSqlSession().selectList(
				"RecoveryLife.queryLifeInfoListByUserId", data);
	}

	public int queryLifeInfoListByUserIdNum(Map<String, Object> data) {
		return getSqlSession().selectOne(
				"RecoveryLife.queryLifeInfoListByUserIdNum", data);
	}

	public List<RecoveryLife> listLifeInfoByUserIdAndTime(
			Map<String, Object> data) {
		return getSqlSession().selectList(
				"RecoveryLife.queryLifeInfoListByUserId", data);
	}

}
