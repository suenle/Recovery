package com.huifu.service;

import com.huifu.entity.RecoveryLife;

public interface IRecoveryLifeService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(RecoveryLife record);

	public int insertSelective(RecoveryLife record);

	public RecoveryLife selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(RecoveryLife record);

	public int updateByPrimaryKey(RecoveryLife record);
}