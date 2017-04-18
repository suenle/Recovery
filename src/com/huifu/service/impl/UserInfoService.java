package com.huifu.service.impl;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.UserInfoDao;
import com.huifu.entity.RecoveryLife;
import com.huifu.entity.UserInfo;
import com.huifu.service.IUserInfoService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class UserInfoService implements IUserInfoService {
	private UserInfoDao userInfoDao;

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getUserInfoDao().deleteByPrimaryKey(id);
	}

	public int insert(UserInfo record) {
		return getUserInfoDao().insert(record);
	}

	public int insertSelective(UserInfo record) {
		return getUserInfoDao().insertSelective(record);
	}

	public UserInfo selectByPrimaryKey(Integer id) {
		return getUserInfoDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(UserInfo record) {
		return getUserInfoDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UserInfo record) {
		return getUserInfoDao().updateByPrimaryKey(record);
	}

	public int updateByPrimaryKeySelectiveByUserID(UserInfo record) {
		return getUserInfoDao().updateByPrimaryKeySelectiveByUserID(record);
	}

	public List<UserInfo> getLifeInfoBySomeDate(Map<String, Object> data) {
		
		return getUserInfoDao().getLifeInfoBySomeDate(data);
	}

	public UserInfo getInfoByUserId(Map<String, Object> data) {
		return getUserInfoDao().getInfoByUserId(data);
	}

	public List<UserInfo> queryLifeInfoBySomeDate(Map<String, Object> data) {
		return getUserInfoDao().queryLifeInfoBySomeDate(data);
	}

	public int queryLifeInfoBySomeDateNum(Map<String, Object> data) {
		return getUserInfoDao().queryLifeInfoBySomeDateNum(data);
	}


}
