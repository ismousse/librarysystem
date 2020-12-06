package com.laji.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.laji.domain.Menu;

public interface MenuMapper {
    /**
     * 	根据管理员id查询菜单
     */
    List<Menu> queryMenuByAdminId(@Param("adminId") Integer adminId);

    /**
     * 	根据adminId删除admin_menu表中的数据
     * @param adminId
     */
	void deleteMenuByAdminId(Integer adminId);

	/**
	 * 	查询所有菜单
	 * @param menu
	 * @return
	 */
	List<Menu> queryAllMenu(Menu menu);

}
