package com.huifu.dao;

import com.huifu.entity.User;

public interface IUserDao {
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(User record);

	public int insertSelective(User record);

	public User selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(User record);

	public int updateByPrimaryKey(User record);
	
	public User checkLogin(User record);
	
	
}