package com.huifu.service;

import java.util.List;
import java.util.Map;

import com.huifu.entity.User;

/**
 * 货物类型(大类)服务接口类
 */

public interface IUserService {
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(User record);

	public int insertSelective(User record);

	public User selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(User record);

	public int updateByPrimaryKey(User record);
	
	public User checkLogin(User record);



}
