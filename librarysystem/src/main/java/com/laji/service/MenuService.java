package com.laji.service;

import java.util.List;

import com.laji.domain.Menu;
import com.laji.utils.DataGridView;
import com.laji.vo.AdminVo;

public interface MenuService {
	
	/**
	 * 根据管理员id查询管理员可用菜单
	 */
	public List<Menu> queryMenuByAdminId(Integer userId);

	/**
	 * 初始化菜单树
	 * @param adminId
	 * @return
	 */
	public DataGridView initMenuTreeJson(Integer adminId);

	/**
	 * 分配菜单
	 * @param adminVo
	 */
	public void saveAdminMenu(AdminVo adminVo);

}
