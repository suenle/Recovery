package com.huifu.service.impl;



import org.springframework.stereotype.Service;

import com.huifu.dao.impl.UserInfoDao;
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


}
