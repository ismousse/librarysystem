package com.laji.service;

import com.laji.domain.Admin;
import com.laji.utils.DataGridView;
import com.laji.vo.AdminVo;

public interface AdminService {
	/**
	 * 管理员登录
	 * @param adminVo
	 * @return
	 */
	Admin login(AdminVo adminVo);

	/**
	 * 加载管理员列表返回DataGridView
	 * @param adminVo
	 * @return
	 */
	DataGridView queryAllAdmin(AdminVo adminVo);

	/**
	 * 根据adminId删除管理员
	 * @param adminId
	 */
	void deleteAdmin(Integer adminId);

	/**
	 * 新增管理员
	 * @param adminVo
	 */
	void addAdmin(AdminVo adminVo);

	/**
	 * 修改管理员
	 * @param adminVo
	 */
	void updateAdmin(AdminVo adminVo);
}
