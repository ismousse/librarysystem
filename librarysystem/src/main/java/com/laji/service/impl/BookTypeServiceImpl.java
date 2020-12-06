package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.BookType;
import com.laji.mapper.BookTypeMapper;
import com.laji.service.BookTypeService;
import com.laji.utils.DataGridView;
import com.laji.vo.BookTypeVo;

@Service
public class BookTypeServiceImpl implements BookTypeService {
	@Autowired
	private BookTypeMapper bookTypeMapper;

	@Override
	public DataGridView queryAllBookType(BookTypeVo bookTypeVo) {
		Page<Object> page = PageHelper.startPage(bookTypeVo.getPage(), bookTypeVo.getLimit());
		List<BookType> data = this.bookTypeMapper.queryAllBookType(bookTypeVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addBookType(BookTypeVo bookTypeVo) {
		this.bookTypeMapper.addBookType(bookTypeVo);
	}

	@Override
	public void updateBookType(BookTypeVo bookTypeVo) {
		this.bookTypeMapper.updateBookType(bookTypeVo);
	}

	@Override
	public void deleteBookType(Integer booktypeId) {
		this.bookTypeMapper.deleteBookType(booktypeId);
	}

	@Override
	public List<BookType> loadAllBookTypeName() {
		List<BookType> data = this.bookTypeMapper.loadAllBookTypeName();
		return data;
	}

	@Override
	public Integer queryById(Integer parseInt) {
		return this.bookTypeMapper.queryById(parseInt);
	}
}
