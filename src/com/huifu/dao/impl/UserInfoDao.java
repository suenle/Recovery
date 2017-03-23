package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IUserInfoDao;
import com.huifu.entity.UserInfo;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class UserInfoDao extends BaseIbatis3Dao<UserInfo, Integer> implements IUserInfoDao {

	public Class getEntityClass() {
		return UserInfo.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("UserInfo.deleteByPrimaryKey", id);
	}

	public int insert(UserInfo record) {
		
		return getSqlSession().insert("UserInfo.insert", record);
	}

	public int insertSelective(UserInfo record) {
		
		return getSqlSession().insert("UserInfo.insertSelective", record);
	}

	public UserInfo selectByPrimaryKey(Integer id) {
		
		return getSqlSession().selectOne("UserInfo.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(UserInfo record) {
		return getSqlSession().update("UserInfo.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(UserInfo record) {
		
		return getSqlSession().update("UserInfo.updateByPrimaryKey", record);
	}

	public UserInfo checkLogin(UserInfo record) {
		
		return getSqlSession().selectOne("UserInfo.checkLogin", record);
	}









}
