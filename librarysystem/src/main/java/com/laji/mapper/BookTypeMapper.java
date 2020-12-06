package com.laji.mapper;

import java.util.List;

import com.laji.domain.BookType;
import com.laji.vo.BookTypeVo;

public interface BookTypeMapper {

	List<BookType> queryAllBookType(BookTypeVo bookTypeVo);

	void addBookType(BookTypeVo bookTypeVo);

	void updateBookType(BookTypeVo bookTypeVo);

	void deleteBookType(Integer booktypeId);

	List<BookType> loadAllBookTypeName();

	Integer queryById(Integer parseInt);

}
