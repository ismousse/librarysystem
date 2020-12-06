package com.laji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.laji.domain.Book;
import com.laji.mapper.BookMapper;
import com.laji.service.BookService;
import com.laji.utils.DataGridView;
import com.laji.vo.BookVo;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	public DataGridView queryAllBook(BookVo bookVo) {
		Page<Object> page=PageHelper.startPage(bookVo.getPage(), bookVo.getLimit());
		List<Book> data = this.bookMapper.queryAllBook(bookVo);
		return new DataGridView(page.getTotal(), data);
	}

	public void addBook(BookVo bookVo) {
		this.bookMapper.insertSelective(bookVo);
	}

	public void updateBook(BookVo bookVo) {
		this.bookMapper.updateByPrimaryKeySelective(bookVo);
	}

	public void deleteBook(Integer booknumber) {
		this.bookMapper.deleteByPrimaryKey(booknumber);
	}

	public void deleteBatchBook(Integer[] booknumbers) {
		for (Integer booknumber : booknumbers) {
			deleteBook(booknumber);
		}
	}

	@Override
	public void updateAddBookById(Integer bookid) {
		this.bookMapper.updateAddBookById(bookid);
	}

	@Override
	public void updateDelBookById(int bookid) {
		this.bookMapper.updateDelBookById(bookid);
	}

}
