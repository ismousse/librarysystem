package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.Library;
import com.laji.mapper.LibraryMapper;
import com.laji.service.LibraryService;
import com.laji.utils.DataGridView;
import com.laji.vo.LibraryVo;

@Service
public class LibraryServiceImpl implements LibraryService {
	@Autowired
	private LibraryMapper libraryMapper;

	@Override
	public DataGridView queryAllLibrary(LibraryVo libraryVo) {
		Page<Object> page = PageHelper.startPage(libraryVo.getPage(), libraryVo.getLimit());
		List<Library> data = this.libraryMapper.queryAllLibrary(libraryVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addLibrary(LibraryVo libraryVo) {
		this.libraryMapper.insertSelective(libraryVo);
	}

	@Override
	public void updateLibrary(LibraryVo libraryVo) {
		this.libraryMapper.updateByPrimaryKeySelective(libraryVo);
	}

	@Override
	public void deleteLibrary(Integer id) {
		this.libraryMapper.deleteByPrimaryKey(id);
	}
}
