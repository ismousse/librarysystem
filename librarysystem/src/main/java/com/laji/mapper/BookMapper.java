package com.laji.mapper;

import java.util.List;

import com.laji.domain.Book;
import com.laji.vo.BookVo;

public interface BookMapper {

	List<Book> queryAllBook(BookVo bookVo);

	void insertSelective(BookVo bookVo);

	void updateByPrimaryKeySelective(BookVo bookVo);

	void deleteByPrimaryKey(Integer booknumber);

	void updateAddBookById(Integer bookid);

	void updateDelBookById(int bookid);

}
