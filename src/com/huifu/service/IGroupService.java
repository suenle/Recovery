package com.huifu.service;

import java.util.List;

import com.huifu.entity.Group;

public interface IGroupService {
	public int deleteByPrimaryKey(Integer id);

	public int insert(Group record);

	public int insertSelective(Group record);

	public Group selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Group record);

	public int updateByPrimaryKey(Group record);
	
	public List<Group> getAllGroup();
}