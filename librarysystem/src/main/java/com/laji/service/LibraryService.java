package com.laji.service;

import com.laji.utils.DataGridView;
import com.laji.vo.LibraryVo;

public interface LibraryService {

	/**
	 * 查询所有图书馆
	 * @param libraryVo
	 * @return
	 */
	DataGridView queryAllLibrary(LibraryVo libraryVo);

	/**
	 * 添加图书馆
	 * @param libraryVo
	 */
	void addLibrary(LibraryVo libraryVo);

	/**
	 * 更新图书馆信息
	 * @param libraryVo
	 */
	void updateLibrary(LibraryVo libraryVo);

	/**
	 * 删除图书馆
	 * @param id
	 */
	void deleteLibrary(Integer id);

}
