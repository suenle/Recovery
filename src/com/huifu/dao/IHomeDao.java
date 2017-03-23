package com.huifu.dao;

import java.util.List;

import com.huifu.entity.District;
import com.huifu.entity.Home;

public interface IHomeDao {
	
	
	public List<Home> getAllHome();
	
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(Home record);

	public int insertSelective(Home record);

	public Home selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Home record);

	public int updateByPrimaryKey(Home record);
}