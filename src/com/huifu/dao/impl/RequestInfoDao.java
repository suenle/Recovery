package com.huifu.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IRequestInfoDao;
import com.huifu.entity.Home;
import com.huifu.entity.RequestInfo;

/**
 * 货物类型(大类)数据库实现类
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class RequestInfoDao extends BaseIbatis3Dao<RequestInfo, Integer>
		implements IRequestInfoDao {

	public Class getEntityClass() {
		return RequestInfo.class;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getSqlSession().delete("RequestInfo.deleteByPrimaryKey", id);
	}

	public int insert(RequestInfo record) {

		return getSqlSession().insert("RequestInfo.insert", record);
	}

	public int insertSelective(RequestInfo record) {

		return getSqlSession().insert("RequestInfo.insertSelective", record);
	}

	public RequestInfo selectByPrimaryKey(Integer id) {

		return getSqlSession().selectOne("RequestInfo.selectByPrimaryKey", id);
	}

	public int updateByPrimaryKeySelective(RequestInfo record) {
		return getSqlSession().update(
				"RequestInfo.updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(RequestInfo record) {

		return getSqlSession().update("RequestInfo.updateByPrimaryKey", record);
	}

	public RequestInfo selectByUserid(Map<String, Object> data) {
		return getSqlSession().selectOne("RequestInfo.selectByUserid", data);
	}
	
	public List<RequestInfo> queryRequestInfo(Map<String, Object> data) {
		
		return getSqlSession().selectList("RequestInfo.queryRequestInfo", data);
	}

	public int queryRequestInfoNum(Map<String, Object> data) {
		
		return getSqlSession().selectOne("RequestInfo.queryRequestInfoNum", data);
	}

}
