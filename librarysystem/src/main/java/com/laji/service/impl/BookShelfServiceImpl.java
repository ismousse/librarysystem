package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.BookShelf;
import com.laji.mapper.BookShelfMapper;
import com.laji.service.BookShelfService;
import com.laji.utils.DataGridView;
import com.laji.vo.BookShelfVo;

@Service
public class BookShelfServiceImpl implements BookShelfService {
	@Autowired
	private BookShelfMapper bookShelfMapper;

	@Override
	public DataGridView queryAllBookShelf(BookShelfVo bookShelfVo) {
		Page<Object> page = PageHelper.startPage(bookShelfVo.getPage(), bookShelfVo.getLimit());
		List<BookShelf> data = this.bookShelfMapper.queryAllBookShelf(bookShelfVo);
		return new DataGridView(page.getTotal(), data);
	}

	@Override
	public void addBookShelf(BookShelfVo bookShelfVo) {
		this.bookShelfMapper.addBookShelf(bookShelfVo);
	}

	@Override
	public void updateBookShelf(BookShelfVo bookShelfVo) {
		this.bookShelfMapper.updateBookShelf(bookShelfVo);
	}

	@Override
	public void deleteBookShelf(Integer booktypeId) {
		this.bookShelfMapper.deleteBookShelf(booktypeId);
	}

	@Override
	public List<BookShelf> loadAllBookShelfName() {
		List<BookShelf> data = this.bookShelfMapper.loadAllBookShelfName();
		return data;
	}
}
