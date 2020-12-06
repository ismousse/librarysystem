package com.laji.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.constant.SysConstast;
import com.laji.domain.Admin;
import com.laji.domain.Menu;
import com.laji.service.MenuService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.utils.TreeNode;
import com.laji.utils.TreeNodeBuilder;
import com.laji.utils.WebUtils;
import com.laji.vo.AdminVo;
import com.laji.vo.MenuVo;

@RestController
@RequestMapping("menu")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	/**
	 * 记载整个后台页面的左边菜单
	 * @param menuVo
	 * @return
	 */
	@RequestMapping("loadIndexLeftMenuJson")
	public List<TreeNode> loadIndexLeftMenuJson(MenuVo menuVo){
		Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
		List<Menu> list = this.menuService.queryMenuByAdminId(admin.getAdminId());
		List<TreeNode> nodes= new ArrayList<TreeNode>();
		for (Menu menu : list) {
			Integer id = menu.getId();
			Integer pid = menu.getPid();
			String title = menu.getTitle();
			String icon = menu.getIcon();
			String href = menu.getHref();
			Boolean spread = menu.getSpread() == SysConstast.SPREAD_TRUE ? true : false;
			nodes.add(new TreeNode(id, pid, title, icon, href, spread));
		}
		return TreeNodeBuilder.builder(nodes, 0);//根节点的id置为0
	}
	
	/**
	 * 初始化菜单分配时候的菜单
	 * @param adminId
	 * @return
	 */
	@RequestMapping("initMenuTreeJson")
	public DataGridView initMenuTreeJson(Integer adminId) {
		return this.menuService.initMenuTreeJson(adminId);
	}
	
	/**
	 * 分配菜单
	 * @param adminVo
	 * @return
	 */
	@RequestMapping("saveAdminMenu")
	public ResultObj saveAdminMenu(AdminVo adminVo) {
		try {
			this.menuService.saveAdminMenu(adminVo);
			return ResultObj.DISPATCH_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DISPATCH_ERROR;
					
		}
	}
}
