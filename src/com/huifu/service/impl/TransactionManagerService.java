package com.huifu.service.impl;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.RequestInfoDao;
import com.huifu.dao.impl.UserDao;
import com.huifu.dao.impl.UserInfoDao;
import com.huifu.entity.RequestInfo;
import com.huifu.entity.User;
import com.huifu.entity.UserInfo;

@Service
public class TransactionManagerService {

	private UserDao userDao;

	private UserInfoDao userInfoDao;

	private RequestInfoDao requestInfoDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public RequestInfoDao getRequestInfoDao() {
		return requestInfoDao;
	}

	public void setRequestInfoDao(RequestInfoDao requestInfoDao) {
		this.requestInfoDao = requestInfoDao;
	}

	public Integer addinfoservice(User user, UserInfo userInfo) {

		int iNumStatus = getUserDao().updateByPrimaryKeySelective(user);

		int iNum = getUserInfoDao().insert(userInfo);

		return iNum;
	}

	public Integer becomeCarer(User user, RequestInfo requestInfo) {
		int iNum = getRequestInfoDao().insertSelective(requestInfo);

		int iNumUser = getUserDao().updateByPrimaryKeySelective(user);

		return iNumUser;

	}

}
