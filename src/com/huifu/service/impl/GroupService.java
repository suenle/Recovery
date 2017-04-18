package com.huifu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.huifu.dao.impl.GroupDao;
import com.huifu.entity.District;
import com.huifu.entity.Group;
import com.huifu.service.IGroupService;

/**
 * 货物类型(大类)服务接口类
 */
@Service
public class GroupService implements IGroupService {
	private GroupDao groupDao;

	public GroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		return getGroupDao().deleteByPrimaryKey(id);
	}

	public int insert(Group record) {
		return getGroupDao().insert(record);
	}

	public int insertSelective(Group record) {
		return getGroupDao().insertSelective(record);
	}

	public Group selectByPrimaryKey(Integer id) {
		return getGroupDao().selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Group record) {
		return getGroupDao().updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Group record) {
		return getGroupDao().updateByPrimaryKey(record);
	}

	public List<Group> getAllGroup() {

		return getGroupDao().getAllGroup();
	}

	public Group selectByName(Group record) {

		return getGroupDao().selectByName(record);
	}

	public Group GroupIsExist(Group record) {
		return getGroupDao().GroupIsExist(record);
	}

	public List<Group> queryGroup(Map<String, Object> data) {
		return getGroupDao().queryGroup(data);
	}

	public int getGroupNum(Map<String, Object> data) {
		return getGroupDao().getGroupNum(data);
	}

}
