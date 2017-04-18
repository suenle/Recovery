package com.huifu.service;

import java.util.List;
import java.util.Map;

import com.huifu.entity.RecoveryLife;
import com.huifu.entity.RequestInfo;

public interface IRequestInfoService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(RequestInfo record);

	public int insertSelective(RequestInfo record);

	public RequestInfo selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(RequestInfo record);

	public int updateByPrimaryKey(RequestInfo record);
	
	public RequestInfo selectByUserid(Map<String, Object> data);
}