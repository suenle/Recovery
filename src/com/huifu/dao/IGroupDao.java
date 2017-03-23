package com.huifu.dao;

import java.util.List;

import com.huifu.entity.District;
import com.huifu.entity.Group;

public interface IGroupDao {

	public List<Group> getAllGroup();

	public int deleteByPrimaryKey(Integer id);

	public int insert(Group record);

	public int insertSelective(Group record);

	public Group selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Group record);

	public int updateByPrimaryKey(Group record);

}