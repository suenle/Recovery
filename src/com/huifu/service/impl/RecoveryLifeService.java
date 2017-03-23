package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.huifu.dao.impl.RecoveryLifeDao;
import com.huifu.entity.RecoveryLife;
import com.huifu.service.IRecoveryLifeService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class RecoveryLifeService implements IRecoveryLifeService {
	private RecoveryLifeDao recoveryLifeDao;

	public RecoveryLifeDao getRecoveryLifeDao() {
		return recoveryLifeDao;
	}

	public void setRecoveryLifeDao(RecoveryLifeDao recoveryLifeDao) {
		this.recoveryLifeDao = recoveryLifeDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getRecoveryLifeDao().deleteByPrimaryKey(id);
	}

	public int insert(RecoveryLife record) {
		return getRecoveryLifeDao().insert(record);
	}

	public int insertSelective(RecoveryLife record) {
		return getRecoveryLifeDao().insertSelective(record);
	}

	public RecoveryLife selectByPrimaryKey(Integer id) {
		return getRecoveryLifeDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(RecoveryLife record) {
		return getRecoveryLifeDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(RecoveryLife record) {
		return getRecoveryLifeDao().updateByPrimaryKey(record);
	}

	public RecoveryLife checkLogin(RecoveryLife record) {

		return getRecoveryLifeDao().checkLogin(record);
	}

}
