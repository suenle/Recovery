package com.huifu.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.huifu.base.BaseIbatis3Dao;
import com.huifu.dao.IMenuDao;
import com.huifu.entity.Menu;

/**
 * 菜单表数据库操作
 */
@Component
@SuppressWarnings({ "rawtypes", "unchecked" })
public class MenuDao extends BaseIbatis3Dao<Menu, Integer> implements IMenuDao
{
	public Class getEntityClass() {
		return Menu.class;
	}

	/**
	 * 根据用户id查询对应的权限菜单
	 */
	public List getMenusByGroupId(Integer id)
	{
		return getSqlSession().selectList("Menu.getMenusByGroupId", id);
	}
	
	/**
	 * 查询所有权限菜单
	 */
	public List getAllMenus()
	{
		return getSqlSession().selectList("Menu.getAllMenus");
	}
	
	/**
	 * 根据menuCode查找菜单
	 */
	public Menu getMenuByMenuCode(String menuCode)
	{
		return getSqlSession().selectOne("Menu.getMenuByMenuCode", menuCode);
	}
	
	/**
	 * 以下为最基本的增删改查(通用)
	 */
	public int deleteByPrimaryKey(Integer id)
	{
		
		return getSqlSession().delete("deleteByPrimaryKey", id);
	}

    public int insert(Menu record)
    {
    	return getSqlSession().insert("insert", record);
    }

    public int insertSelective(Menu record)
    {
    	return getSqlSession().insert("insertSelective", record);
    }

    public Menu selectByPrimaryKey(Integer id)
    {
    	return getSqlSession().selectOne("selectByPrimaryKey", id);
    }

    public int updateByPrimaryKeySelective(Menu record)
    {
    	return getSqlSession().update("updateByPrimaryKeySelective", record);
    }

    public int updateByPrimaryKey(Menu record)
    {
    	return getSqlSession().update("updateByPrimaryKey", record);
    }	
	/**
	 * 根据menuName查找菜单
	 */
	public Menu getMenuByMenuName(String menuName){
		return getSqlSession().selectOne("Menu.getMenuByMenuName", menuName);
	}
	
	
	/**
	 * 更新menu操作
	 */
	public int updateMenu(Menu menu){
		return getSqlSession().update("Menu.updateMenu", menu);
	}
	
	/**
	 * 添加menu操作
	 */
	public int addMenu(Menu menu){
		return getSqlSession().insert("Menu.addMenu", menu);
	}
	
	/**
	 * 删除menu操作
	 */
	public int deleteMenuById(Integer id){
		return getSqlSession().delete("Menu.deleteMenuById", id);
	}
	/*
	 *  根据menuId获得该级菜单下是否有子菜单
	 *  id 返回子菜单的个数
	 */
	public Integer getMenuNumById(Integer id){
		return getSqlSession().selectOne("Menu.getMenuNumById", id);
	}
	
	/*
	 *  根据menuId获得该级菜单在t_role中被配置的个数
	 */
	public Integer getRoleNumByMenuId(Integer id){
		return getSqlSession().selectOne("Menu.getRoleNumByMenuId", id);
	}
	
}
