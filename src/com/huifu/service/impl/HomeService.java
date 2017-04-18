package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.HomeDao;
import com.huifu.entity.Home;
import com.huifu.service.IHomeService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class HomeService implements IHomeService {
	private HomeDao homeDao;

	public HomeDao getHomeDao() {
		return homeDao;
	}

	public void setHomeDao(HomeDao homeDao) {
		this.homeDao = homeDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getHomeDao().deleteByPrimaryKey(id);
	}

	public int insert(Home record) {
		return getHomeDao().insert(record);
	}

	public int insertSelective(Home record) {
		return getHomeDao().insertSelective(record);
	}

	public Home selectByPrimaryKey(Integer id) {
		return getHomeDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Home record) {
		return getHomeDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Home record) {
		return getHomeDao().updateByPrimaryKey(record);
	}

	public List<Home> getAllHome() {

		return getHomeDao().getAllHome();
	}

	public Home selectByName(Home record) {
		return getHomeDao().selectByName(record);
	}

	public Home HomeIsExist(Home record) {

		return getHomeDao().HomeIsExist(record);
	}

	public List<Home> queryHome(Map<String, Object> data) {
		return getHomeDao().queryHome(data);
	}

	public int getHomeNum(Map<String, Object> data) {
		return getHomeDao().getHomeNum(data);
	}

}
