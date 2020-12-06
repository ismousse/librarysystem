package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.Admin;
import com.laji.mapper.AdminMapper;
import com.laji.mapper.MenuMapper;
import com.laji.service.AdminService;
import com.laji.utils.DataGridView;
import com.laji.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public Admin login(AdminVo adminVo) {
		return adminMapper.login(adminVo);
	}

	@Override
	public DataGridView queryAllAdmin(AdminVo adminVo) {
		Page<Object> page = PageHelper.startPage(adminVo.getPage(), adminVo.getLimit());
		List<Admin> data = this.adminMapper.queryAllAdmin(adminVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void deleteAdmin(Integer adminId) {
		this.adminMapper.deleteByPrimaryKey(adminId);
		this.menuMapper.deleteMenuByAdminId(adminId);
	}

	@Override
	public void addAdmin(AdminVo adminVo) {
		this.adminMapper.insertSelective(adminVo);
	}

	@Override
	public void updateAdmin(AdminVo adminVo) {
		this.adminMapper.updateByPrimaryKeySelective(adminVo);		
	}

}
