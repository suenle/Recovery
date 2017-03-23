package com.huifu.dao;

import com.huifu.entity.RecoveryLife;

public interface IRecoveryLifeDao {
	public int deleteByPrimaryKey(Integer id);

	public int insert(RecoveryLife record);

	public int insertSelective(RecoveryLife record);

	public RecoveryLife selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(RecoveryLife record);

	public int updateByPrimaryKey(RecoveryLife record);
}