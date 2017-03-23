package com.huifu.dao;

import java.util.List;

import com.huifu.entity.Church;

public interface IChurchDao {
	public int deleteByPrimaryKey(Integer id);

	public int insert(Church record);

	public int insertSelective(Church record);

	public Church selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Church record);

	public int updateByPrimaryKey(Church record);
	
	public List<Church> getAllChurch();
}