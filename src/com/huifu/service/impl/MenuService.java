package com.huifu.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.huifu.dao.IMenuDao;
import com.huifu.entity.Menu;
import com.huifu.service.IMenuService;

@Service
public class MenuService implements IMenuService {
	private IMenuDao menuDao;
	
	/**
	 * 根据用户id查询对应的权限菜单
	 */
	public List getMenusByGroupId(Integer id)
	{
		return getMenuDao().getMenusByGroupId(id);
	}
	
	/**
	 * 查找全部菜单
	 */
	public List getAllMenus()
	{
		return getMenuDao().getAllMenus();
	}
	
	/**
	 * 根据menuCode查找菜单
	 */
	public Menu getMenuByMenuCode(String menuCode)
	{
		return getMenuDao().getMenuByMenuCode(menuCode);
	}
	/**
	 * 根据menuName查找菜单
	 */
	public Menu getMenuByMenuName(String menuName){
		return getMenuDao().getMenuByMenuName(menuName);
	}
	
	/**
	 * 根据userCode查找权限范围内菜单
	 */
	public Menu getMenusByUserCode(String userCode)
	{
		return null;
	}
	
	/**
	 * 添加菜单数据
	 */
	public int addMenu(Menu menu)
	{
		return getMenuDao().addMenu(menu);
	}
	
	/**
	 * 更新菜单数据
	 */
	public int updateMenu(Menu menu)
	{
		return getMenuDao().updateMenu(menu);
	}
	/**
	 * 根据id号删除菜单数据
	 */
	public int deleteMenu(Integer id)
	{
		return getMenuDao().deleteMenuById(id);
	}
	/*
	 *  根据menuId获得该级菜单下是否有子菜单
	 *  id 返回子菜单的个数
	 */
	public Integer getMenuNumById(Integer id){
		return getMenuDao().getMenuNumById(id);
	}
	/*
	 *  根据menuId获得该级菜单在t_role中被配置的个数
	 */
	public Integer getRoleNumByMenuId(Integer id){
		return getMenuDao().getRoleNumByMenuId(id);
	}
	
	
	public IMenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(IMenuDao menuDao) {
		this.menuDao = menuDao;
	}
}
