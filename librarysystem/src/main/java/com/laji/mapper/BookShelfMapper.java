package com.laji.mapper;

import java.util.List;

import com.laji.domain.BookShelf;
import com.laji.vo.BookShelfVo;

public interface BookShelfMapper {

	List<BookShelf> queryAllBookShelf(BookShelfVo bookShelfVo);

	void addBookShelf(BookShelfVo bookShelfVo);

	void updateBookShelf(BookShelfVo bookShelfVo);

	void deleteBookShelf(Integer booktypeId);

	List<BookShelf> loadAllBookShelfName();

}
