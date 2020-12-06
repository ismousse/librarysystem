package com.laji.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.laji.domain.Admin;
import com.laji.vo.AdminVo;

public interface AdminMapper {
	/**
	 * 	管理员登录
     * @param admin
     * @return
     */
    Admin login(Admin admin);

    /**
     * 	查询所有管理员
     * @param adminVo
     * @return
     */
	List<Admin> queryAllAdmin(AdminVo adminVo);

	/**
	 * 根据adminId删除管理员
	 * @param adminId
	 */
	void deleteByPrimaryKey(Integer adminId);

	/**
	 * 根据id更新管理员信息
	 * @param adminVo
	 */
	void updateByPrimaryKeySelective(AdminVo adminVo);

	/**
	 * 添加管理员
	 * @param adminVo
	 */
	void insertSelective(AdminVo adminVo);

	/**
	 * 根据adminId在admin_menu中删除菜单
	 * @param adminId
	 */
	void deleteAdminMenuByAdminId(Integer adminId);

	/**
	 * 根据adminId在admin_menu中添加菜单
	 * @param adminId
	 * @param mid
	 */
	void insertAdminMenu(@Param("adminId")Integer adminId, @Param("id") Integer id);
}
