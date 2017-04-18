package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.RequestInfoDao;
import com.huifu.entity.RequestInfo;
import com.huifu.entity.RequestInfo;
import com.huifu.service.IRequestInfoService;


@Service
public class RequestInfoService implements IRequestInfoService {
	private RequestInfoDao requestInfoDao;

	public RequestInfoDao getRequestInfoDao() {
		return requestInfoDao;
	}

	public void setRequestInfoDao(RequestInfoDao requestInfoDao) {
		this.requestInfoDao = requestInfoDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getRequestInfoDao().deleteByPrimaryKey(id);
	}

	public int insert(RequestInfo record) {
		return getRequestInfoDao().insert(record);
	}

	public int insertSelective(RequestInfo record) {
		return getRequestInfoDao().insertSelective(record);
	}

	public RequestInfo selectByPrimaryKey(Integer id) {
		return getRequestInfoDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(RequestInfo record) {
		return getRequestInfoDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(RequestInfo record) {
		return getRequestInfoDao().updateByPrimaryKey(record);
	}

	public RequestInfo selectByUserid(Map<String, Object> data) {
		return getRequestInfoDao().selectByUserid(data);
	}

}
