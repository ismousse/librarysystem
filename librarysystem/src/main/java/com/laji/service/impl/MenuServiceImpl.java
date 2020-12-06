package com.laji.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laji.constant.SysConstast;
import com.laji.domain.Menu;
import com.laji.mapper.AdminMapper;
import com.laji.mapper.MenuMapper;
import com.laji.service.MenuService;
import com.laji.utils.DataGridView;
import com.laji.utils.TreeNode;
import com.laji.vo.AdminVo;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private AdminMapper adminMapper;
	 
	public List<Menu> queryMenuByAdminId(Integer adminId) {
		return menuMapper.queryMenuByAdminId(adminId);
	}

	@Override
	public DataGridView initMenuTreeJson(Integer adminId) {
		//查找所有菜单 根据adminId查admin有的菜单 将admin有的菜单arr->变成1（注意级联）
		Menu menu = new Menu();
		List<Menu> allMenu = menuMapper.queryAllMenu(menu);
		List<Menu> adminMenu = menuMapper.queryMenuByAdminId(adminId);
		List<TreeNode> data = new ArrayList<TreeNode>();
		for (Menu m1 : allMenu) {
			String checkArr = SysConstast.CODE_ZERO;
			for (Menu m2 : adminMenu) {
				if (m1.getId() == m2.getId()) {
					checkArr = SysConstast.CODE_ONE;
					break;
				}
			}
			Integer id = m1.getId();
			Integer pid = m1.getPid();
			String title = m1.getTitle();
			Boolean spread = m1.getSpread() == SysConstast.SPREAD_TRUE ? true : false;
			data.add(new TreeNode(id, pid, title, spread, checkArr));
		}
		return new DataGridView(data);
	}

	@Override
	public void saveAdminMenu(AdminVo adminVo) {
		Integer adminId = adminVo.getAdminId();
		System.out.println(adminId+"...");
		Integer [] mids = adminVo.getIds();
		System.out.println("..."+mids[0]);
		this.adminMapper.deleteAdminMenuByAdminId(adminId);
		for (Integer mid : mids) {
			this.adminMapper.insertAdminMenu(adminId, mid);
		}
	}
	 
}
