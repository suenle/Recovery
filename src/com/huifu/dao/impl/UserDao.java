package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IUserDao;
import com.huifu.entity.User;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class UserDao extends BaseIbatis3Dao<User, Integer> implements IUserDao {

	public Class getEntityClass() {
		return User.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("User.deleteByPrimaryKey", id);
	}

	public int insert(User record) {
		
		return getSqlSession().insert("User.insert", record);
	}

	public int insertSelective(User record) {
		
		return getSqlSession().insert("User.insertSelective", record);
	}

	public User selectByPrimaryKey(Integer id) {
		
		return getSqlSession().selectOne("User.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(User record) {
		return getSqlSession().update("User.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(User record) {
		
		return getSqlSession().update("User.updateByPrimaryKey", record);
	}

	public User checkLogin(User record) {
		
		return getSqlSession().selectOne("User.checkLogin", record);
	}

	public List<User> listAllUserId() {
		
		return getSqlSession().selectList("User.listAllUserId");
	}









}
