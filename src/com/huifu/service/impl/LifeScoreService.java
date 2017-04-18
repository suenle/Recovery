package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.LifeScoreDao;
import com.huifu.entity.LifeScore;
import com.huifu.service.ILifeScoreService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class LifeScoreService implements ILifeScoreService {
	private LifeScoreDao lifeScoreDao;

	public LifeScoreDao getLifeScoreDao() {
		return lifeScoreDao;
	}

	public void setLifeScoreDao(LifeScoreDao lifeScoreDao) {
		this.lifeScoreDao = lifeScoreDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getLifeScoreDao().deleteByPrimaryKey(id);
	}

	public int insert(LifeScore record) {
		return getLifeScoreDao().insert(record);
	}

	public int insertSelective(LifeScore record) {
		return getLifeScoreDao().insertSelective(record);
	}

	public LifeScore selectByPrimaryKey(Integer id) {
		return getLifeScoreDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(LifeScore record) {
		return getLifeScoreDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(LifeScore record) {
		return getLifeScoreDao().updateByPrimaryKey(record);
	}

	public List<LifeScore> getAllLifeScore() {
		
		return getLifeScoreDao().getAllLifeScore();
	}

}
