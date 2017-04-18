package com.huifu.dao;

import java.util.List;
import java.util.Map;

import com.huifu.entity.District;
import com.huifu.entity.Group;
import com.huifu.entity.Home;

public interface IHomeDao {
	
	
	public List<Home> getAllHome();
	
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(Home record);

	public int insertSelective(Home record);

	public Home selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Home record);

	public int updateByPrimaryKey(Home record);
	
	public Home selectByName(Home record);
	
	public Home HomeIsExist(Home record);

	public List<Home> queryHome(Map<String, Object> data);

	public int getHomeNum(Map<String, Object> data);

	
	
}