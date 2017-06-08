package com.huifu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.RecoveryLifeDao;
import com.huifu.entity.LifeScore;
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

	public RecoveryLife getTodayInfoByUseridAndTime(Map<String, Object> data) {

		return getRecoveryLifeDao().getTodayInfoByUseridAndTime(data);
	}

	public RecoveryLife getLastdayInfoByUseridAndTime(Map<String, Object> data) {

		return getRecoveryLifeDao().getLastdayInfoByUseridAndTime(data);
	}

	public List<RecoveryLife> getLifeInfoBySomeDate(Map<String, Object> data) {

		return getRecoveryLifeDao().getLifeInfoBySomeDate(data);
	}

	public List<RecoveryLife> getLifeInfoListByUserId(Map<String, Object> data) {
		return getRecoveryLifeDao().getLifeInfoListByUserId(data);
	}

	public List<RecoveryLife> queryLifeInfoListByUserId(Map<String, Object> data) {
		return getRecoveryLifeDao().queryLifeInfoListByUserId(data);
	}

	public int queryLifeInfoListByUserIdNum(Map<String, Object> data) {
		return getRecoveryLifeDao().queryLifeInfoListByUserIdNum(data);
	}

	public List<RecoveryLife> listLifeInfoByUserIdAndTime(
			Map<String, Object> data) {
		return getRecoveryLifeDao().listLifeInfoByUserIdAndTime(data);
	}


}
