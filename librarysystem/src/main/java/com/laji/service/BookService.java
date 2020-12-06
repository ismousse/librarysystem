package com.laji.service;

import com.laji.utils.DataGridView;
import com.laji.vo.BookVo;

public interface BookService {

	DataGridView queryAllBook(BookVo bookVo);

	void addBook(BookVo bookVo);

	void updateBook(BookVo bookVo);

	void deleteBook(Integer bookid);

	void deleteBatchBook(Integer[] ids);

	void updateAddBookById(Integer bookid);

	void updateDelBookById(int parseInt);

}
