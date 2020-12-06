package com.laji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.BookShelf;
import com.laji.service.BookShelfService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.vo.BookShelfVo;

@RestController
@RequestMapping("bookshelf")
public class BookShelfController {
	@Autowired
	private BookShelfService bookShelfService;

	/**
	 * 加载书籍分类列表返回DataGridView
	 */
	@RequestMapping("loadAllBookShelf")
	public DataGridView loadAllBookShelf(BookShelfVo bookShelfVo) {
		return this.bookShelfService.queryAllBookShelf(bookShelfVo);
	}

	/**
	 * 加载所有分类名称
	 */
	@RequestMapping("loadAllBookShelfName")
	public List<BookShelf> loadAllBookShelfName() {
		return this.bookShelfService.loadAllBookShelfName();
	}
	
	/**
	 * 添加书籍分类
	 */
	@RequestMapping("addBookShelf")
	public ResultObj addBookShelf(BookShelfVo bookShelfVo) {
		try {
			this.bookShelfService.addBookShelf(bookShelfVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改书籍分类
	 */
	@RequestMapping("updateBookShelf")
	public ResultObj updateBookShelf(BookShelfVo bookShelfVo) {
		try {
			this.bookShelfService.updateBookShelf(bookShelfVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除书籍分类
	 */
	@RequestMapping("deleteBookShelf")
	public ResultObj deleteBookShelf(BookShelfVo bookShelfVo) {
		try {
			this.bookShelfService.deleteBookShelf(bookShelfVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
