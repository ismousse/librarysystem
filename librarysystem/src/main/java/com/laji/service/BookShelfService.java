package com.laji.service;

import java.util.List;

import com.laji.domain.BookShelf;
import com.laji.utils.DataGridView;
import com.laji.vo.BookShelfVo;

public interface BookShelfService {

	DataGridView queryAllBookShelf(BookShelfVo bookShelfVo);

	List<BookShelf> loadAllBookShelfName();

	void addBookShelf(BookShelfVo bookShelfVo);

	void updateBookShelf(BookShelfVo bookShelfVo);

	void deleteBookShelf(Integer id);

}
