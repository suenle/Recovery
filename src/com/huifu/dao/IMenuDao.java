package com.huifu.dao;

import java.util.List;

import com.huifu.entity.Menu;

public interface IMenuDao {
	/**
	 * 根据用户id查询对应的权限菜单
	 */
	public List getMenusByGroupId(Integer id);
	
	/**
	 * 根据menuCode查找菜单
	 */
	public Menu getMenuByMenuCode(String menuCode);
	
	/**
	 * 查询所有权限菜单
	 */
	public List getAllMenus();
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(Menu record);

	public int insertSelective(Menu record);

	public Menu selectByPrimaryKey(Integer id);

	public int updateByPrimaryKeySelective(Menu record);

	public int updateByPrimaryKey(Menu record);
	
	
	/**
	 * 根据menuName查找菜单
	 */
	public Menu getMenuByMenuName(String menuName);
	
	/**
	 * 更新menu操作
	 */
	public int updateMenu(Menu menu);
	
	/**
	 * 添加menu操作
	 */
	public int addMenu(Menu menu);
	
	/**
	 * 删除menu操作
	 */
	public int deleteMenuById(Integer id);
	/*
	 *  根据menuId获得该级菜单下是否有子菜单
	 *  id 返回子菜单的个数
	 */
	public Integer getMenuNumById(Integer id);
	/*
	 *  根据menuId获得该级菜单在t_role中被配置的个数
	 */
	public Integer getRoleNumByMenuId(Integer id);
}