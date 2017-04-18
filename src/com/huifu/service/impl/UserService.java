package com.huifu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.UserDao;
import com.huifu.entity.User;
import com.huifu.service.IUserService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class UserService implements IUserService {
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getUserDao().deleteByPrimaryKey(id);
	}

	public int insert(User record) {
		return getUserDao().insert(record);
	}

	public int insertSelective(User record) {
		return getUserDao().insertSelective(record);
	}

	public User selectByPrimaryKey(Integer id) {
		return getUserDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(User record) {
		return getUserDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(User record) {
		return getUserDao().updateByPrimaryKey(record);
	}

	public User checkLogin(User record) {

		return getUserDao().checkLogin(record);
	}

	public List<User> listAllUserId() {

		return getUserDao().listAllUserId();
	}

}
