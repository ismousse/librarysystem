package com.laji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.BookType;
import com.laji.service.BookTypeService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.vo.BookTypeVo;

@RestController
@RequestMapping("booktype")
public class BookTypeController {
	@Autowired
	private BookTypeService bookTypeService;

	/**
	 * 加载书籍分类列表返回DataGridView
	 */
	@RequestMapping("loadAllBookType")
	public DataGridView loadAllBookType(BookTypeVo bookTypeVo) {
		return this.bookTypeService.queryAllBookType(bookTypeVo);
	}

	/**
	 * 加载所有分类名称
	 */
	@RequestMapping("loadAllBookTypeName")
	public List<BookType> loadAllBookTypeName() {
		return this.bookTypeService.loadAllBookTypeName();
	}
	
	/**
	 * 添加书籍分类
	 */
	@RequestMapping("addBookType")
	public ResultObj addBookType(BookTypeVo bookTypeVo) {
		try {
			this.bookTypeService.addBookType(bookTypeVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改书籍分类
	 */
	@RequestMapping("updateBookType")
	public ResultObj updateBookType(BookTypeVo bookTypeVo) {
		try {
			this.bookTypeService.updateBookType(bookTypeVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除书籍分类
	 */
	@RequestMapping("deleteBookType")
	public ResultObj deleteBookType(BookTypeVo bookTypeVo) {
		try {
			this.bookTypeService.deleteBookType(bookTypeVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
