package com.huifu.dao;

import java.util.Map;

import com.huifu.entity.RequestInfo;

public interface IRequestInfoDao {
	public int deleteByPrimaryKey(Integer id);

	public int insert(RequestInfo record);

	public int insertSelective(RequestInfo record);

	public RequestInfo selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(RequestInfo record);

	public int updateByPrimaryKey(RequestInfo record);
	
	public RequestInfo selectByUserid(Map<String, Object> data);
}