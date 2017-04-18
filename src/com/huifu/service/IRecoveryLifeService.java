package com.huifu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huifu.entity.RecoveryLife;

public interface IRecoveryLifeService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(RecoveryLife record);

	public int insertSelective(RecoveryLife record);

	public RecoveryLife selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(RecoveryLife record);

	public int updateByPrimaryKey(RecoveryLife record);

	public RecoveryLife getTodayInfoByUseridAndTime(Map<String, Object> data);

	public RecoveryLife getLastdayInfoByUseridAndTime(Map<String, Object> data);

	public List<RecoveryLife> getLifeInfoBySomeDate(Map<String, Object> data);

	public List<RecoveryLife> getLifeInfoListByUserId(Map<String, Object> data);
	
	public List<RecoveryLife> queryLifeInfoListByUserId(Map<String, Object> data);
	
	public int queryLifeInfoListByUserIdNum(Map<String, Object> data);
	
	public List<RecoveryLife> listLifeInfoByUserIdAndTime(Map<String, Object> data);
}