package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.ChurchDao;
import com.huifu.entity.Church;
import com.huifu.service.IChurchService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class ChurchService implements IChurchService {
	private ChurchDao churchDao;

	public ChurchDao getChurchDao() {
		return churchDao;
	}

	public void setChurchDao(ChurchDao churchDao) {
		this.churchDao = churchDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getChurchDao().deleteByPrimaryKey(id);
	}

	public int insert(Church record) {
		return getChurchDao().insert(record);
	}

	public int insertSelective(Church record) {
		return getChurchDao().insertSelective(record);
	}

	public Church selectByPrimaryKey(Integer id) {
		return getChurchDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Church record) {
		return getChurchDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Church record) {
		return getChurchDao().updateByPrimaryKey(record);
	}

	public List<Church> getAllChurch() {
		
		return getChurchDao().getAllChurch();
	}

}
