package com.huifu.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huifu.entity.Menu;

/**
 * 用户信息操作服务(接口)
 */
public interface IMenuService {

	/**
	 * 根据用户id查询对应的权限菜单
	 */
	public List getMenusByGroupId(Integer id);

	/**
	 * 查找全部菜单
	 */
	public List getAllMenus();
	
	/**
	 * 根据menuCode查找菜单
	 */
	public Menu getMenuByMenuCode(String menuCode);
	
	/**
	 * 根据userCode查找权限范围内菜单
	 */
	public Menu getMenusByUserCode(String userCode);
	
	/**
	 * 添加菜单数据
	 */
	public int addMenu(Menu menu);
	
	/**
	 * 更新菜单数据
	 */
	public int updateMenu(Menu menu);


	/**
	 * 根据menuName查找菜单
	 */
	public Menu getMenuByMenuName(String menuName);
	
	
	/**
	 * 根据id号删除菜单数据
	 */
	public int deleteMenu(Integer id);
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
