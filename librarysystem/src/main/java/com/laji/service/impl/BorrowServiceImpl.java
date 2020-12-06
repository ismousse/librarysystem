package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.Borrow;
import com.laji.mapper.BorrowMapper;
import com.laji.service.BorrowService;
import com.laji.utils.DataGridView;
import com.laji.vo.BorrowVo;

@Service
public class BorrowServiceImpl implements BorrowService {
	@Autowired
	private BorrowMapper borrowMapper;

	@Override
	public DataGridView queryAllBorrow(BorrowVo borrowVo) {
		Page<Object> page = PageHelper.startPage(borrowVo.getPage(), borrowVo.getLimit());
		List<Borrow> data = this.borrowMapper.queryAllBorrow(borrowVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addBorrow(BorrowVo borrowVo) {
		this.borrowMapper.insertSelective(borrowVo);
	}

	@Override
	public void updateBorrow(BorrowVo borrowVo) {
		this.borrowMapper.updateByPrimaryKeySelective(borrowVo);
	}

	@Override
	public void deleteBorrow(Integer id) {
		this.borrowMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer queryBorrowCount(String readerId) {
		return this.borrowMapper.queryBorrowCount(readerId);
	}

	@Override
	public DataGridView queryBestReader() {
		List<Borrow> data = this.borrowMapper.queryBestReader();
		return new DataGridView(5L, data);
	}

	@Override
	public DataGridView queryBestBook() {
		List<Borrow> data = this.borrowMapper.queryBestBook();
		return new DataGridView(6L, data);
	}

	@Override
	public DataGridView queryAllBorrowByRid(BorrowVo borrowVo) {
		Page<Object> page = PageHelper.startPage(borrowVo.getPage(), borrowVo.getLimit());
		List<Borrow> data = this.borrowMapper.queryAllBorrowByRid(borrowVo);
		return new DataGridView(page.getTotal(), data);
	}
}
