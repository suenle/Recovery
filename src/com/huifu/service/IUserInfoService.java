package com.huifu.service;

import com.huifu.entity.UserInfo;

public interface IUserInfoService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(UserInfo record);

	public int insertSelective(UserInfo record);

	public UserInfo selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(UserInfo record);

	public int updateByPrimaryKey(UserInfo record);
}