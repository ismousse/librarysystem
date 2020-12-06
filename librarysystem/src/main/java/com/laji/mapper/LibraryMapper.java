package com.laji.mapper;

import java.util.List;

import com.laji.domain.Library;
import com.laji.vo.LibraryVo;

public interface LibraryMapper {

	List<Library> queryAllLibrary(LibraryVo libraryVo);

	void insertSelective(LibraryVo libraryVo);

	void updateByPrimaryKeySelective(LibraryVo libraryVo);

	void deleteByPrimaryKey(Integer id);
	
}
