package com.laji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.service.LibraryService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.vo.LibraryVo;

@RestController
@RequestMapping("library")
public class LibraryController {
	@Autowired
	private LibraryService libraryService;
	
	/**
	 * 加载图书馆列表
	 * @param userVo
	 * @return
	 */
	@RequestMapping("queryAllLibrary")
	public DataGridView queryAllLibrary(LibraryVo libraryVo) {
		return this.libraryService.queryAllLibrary(libraryVo);
	}

	/**
	 * 添加图书馆
	 */
	@RequestMapping("addLibrary")
	public ResultObj addLibrary(LibraryVo libraryVo) {
		try {
			this.libraryService.addLibrary(libraryVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改图书馆
	 */
	@RequestMapping("updateLibrary")
	public ResultObj updateLibrary(LibraryVo libraryVo) {
		try {
			this.libraryService.updateLibrary(libraryVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除图书馆
	 */
	@RequestMapping("deleteLibrary")
	public ResultObj deleteLibrary(LibraryVo libraryVo) {
		try {
			this.libraryService.deleteLibrary(libraryVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
