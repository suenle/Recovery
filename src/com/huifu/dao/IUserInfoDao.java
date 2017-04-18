package com.huifu.dao;

import java.util.List;
import java.util.Map;

import com.huifu.entity.RecoveryLife;
import com.huifu.entity.UserInfo;

public interface IUserInfoDao {
	public int deleteByPrimaryKey(Integer id);

	public int insert(UserInfo record);

	public int insertSelective(UserInfo record);

	public UserInfo selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(UserInfo record);

	public int updateByPrimaryKey(UserInfo record);
	
	public int updateByPrimaryKeySelectiveByUserID(UserInfo record);
	
	public List<UserInfo> getLifeInfoBySomeDate(Map<String, Object> data);
	
	public UserInfo getInfoByUserId(Map<String, Object> data);
	
	public List<UserInfo> queryLifeInfoBySomeDate(Map<String, Object> data);
	
	public int queryLifeInfoBySomeDateNum(Map<String, Object> data);
}