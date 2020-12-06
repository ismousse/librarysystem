package com.laji.service;

import java.util.List;

import com.laji.domain.BookType;
import com.laji.utils.DataGridView;
import com.laji.vo.BookTypeVo;

public interface BookTypeService {

	DataGridView queryAllBookType(BookTypeVo bookTypeVo);

	List<BookType> loadAllBookTypeName();

	void addBookType(BookTypeVo bookTypeVo);

	void updateBookType(BookTypeVo bookTypeVo);

	void deleteBookType(Integer id);

	Integer queryById(Integer parseInt);

}
