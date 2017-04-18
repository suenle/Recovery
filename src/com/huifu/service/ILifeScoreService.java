package com.huifu.service;

import com.huifu.entity.LifeScore;

public interface ILifeScoreService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(LifeScore record);

	public int insertSelective(LifeScore record);

	public LifeScore selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(LifeScore record);

	public int updateByPrimaryKey(LifeScore record);
}