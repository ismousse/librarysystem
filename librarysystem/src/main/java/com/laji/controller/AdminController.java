package com.laji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.Admin;
import com.laji.service.AdminService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.utils.WebUtils;
import com.laji.vo.AdminVo;

@RestController
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	/**
	 * 加载管理员列表返回DataGridView
	 */
	@RequestMapping("loadAllAdmin")
	public DataGridView loadAllAdmin(AdminVo adminVo) {
		Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
		adminVo.setLevel(admin.getLevel());
		adminVo.setAdminId(admin.getAdminId());
		return this.adminService.queryAllAdmin(adminVo);
	}
	
	/**
	 * 删除管理员
	 */
	@RequestMapping("deleteAdmin")
	public ResultObj deleteAdmin(AdminVo adminVo) {
		try {
			this.adminService.deleteAdmin(adminVo.getAdminId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
	
	/**
	 * 添加管理员
	 */
	@RequestMapping("addAdmin")
	public ResultObj addAdmin(AdminVo adminVo) {
		try {
			this.adminService.addAdmin(adminVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改管理员
	 */
	@RequestMapping("updateAdmin")
	public ResultObj updateAdmin(AdminVo adminVo) {
		try {
			this.adminService.updateAdmin(adminVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
}
