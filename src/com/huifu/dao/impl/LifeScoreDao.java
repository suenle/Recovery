package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.ILifeScoreDao;
import com.huifu.entity.LifeScore;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class LifeScoreDao extends BaseIbatis3Dao<LifeScore, Integer> implements
		ILifeScoreDao {

	public Class getEntityClass() {
		return LifeScore.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("LifeScore.deleteByPrimaryKey", id);
	}

	public int insert(LifeScore record) {

		return getSqlSession().insert("LifeScore.insert", record);
	}

	public int insertSelective(LifeScore record) {

		return getSqlSession().insert("LifeScore.insertSelective", record);
	}

	public LifeScore selectByPrimaryKey(Integer id) {

		return getSqlSession().selectOne("LifeScore.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(LifeScore record) {
		return getSqlSession().update("LifeScore.updateByPrimaryKeySelective",
				record);
	}

	public int updateByPrimaryKey(LifeScore record) {

		return getSqlSession().update("LifeScore.updateByPrimaryKey", record);
	}

	public LifeScore checkLogin(LifeScore record) {

		return getSqlSession().selectOne("LifeScore.checkLogin", record);
	}

	public List<LifeScore> getAllLifeScore() {

		return getSqlSession().selectList("LifeScore.getAllLifeScore");
	}

	public List<LifeScore> listWeekScoreByTimeAndType(Map<String, Object> data) {

		return getSqlSession().selectList("LifeScore.listWeekScoreByTimeAndType", data);
	}

	public List<LifeScore> listLifeScoreByTime(Map<String, Object> data) {
		
		return getSqlSession().selectList("LifeScore.listLifeScoreByTime", data);
	}

	public int LifeScoreByTimeNum(Map<String, Object> data) {
		return getSqlSession().selectOne("LifeScore.LifeScoreByTimeNum", data);
	}

	public List<LifeScore> listLifeScoreByTimePrint(Map<String, Object> data) {
		return getSqlSession().selectList("LifeScore.listLifeScoreByTimePrint", data);
	}

	public int LifeScoreByTimeNumPrint(Map<String, Object> data) {
		return getSqlSession().selectOne("LifeScore.LifeScoreByTimeNumPrint", data);
	}

	public List<LifeScore> ListFourWeekIndex() {
		return getSqlSession().selectList("LifeScore.ListFourWeekIndex");
	}

}
