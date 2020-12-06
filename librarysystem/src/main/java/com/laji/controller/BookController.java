package com.laji.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.domain.Admin;
import com.laji.service.BookService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.utils.WebUtils;
import com.laji.vo.BookVo;

@RestController
@RequestMapping("book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	/**
	 * 加载书籍列表返回DataGridView
	 */
	@RequestMapping("queryAllBook")
	public DataGridView queryAllBook(BookVo bookVo) {
		String ISBN = WebUtils.getHttpServletRequest().getParameter("isbn");
		bookVo.setISBN(ISBN);
		bookVo.setBookcount(0);
		return this.bookService.queryAllBook(bookVo);
	}
	@RequestMapping("querySomeBook")
	public DataGridView querySomeBook(BookVo bookVo) {
		String ISBN = WebUtils.getHttpServletRequest().getParameter("isbn");
		bookVo.setISBN(ISBN);
		bookVo.setBookcount(0);
		return this.bookService.queryAllBook(bookVo);
	}

	/**
	 * 添加书籍
	 */
	@RequestMapping("addBook")
	public ResultObj addRooom(BookVo bookVo) {
		try {
			bookVo.setCreatetime(new Date());
			Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
			bookVo.setOperator(admin.getUsername());
			String ibsn = WebUtils.getHttpServletRequest().getParameter("isbn");
			bookVo.setISBN(ibsn);
			this.bookService.addBook(bookVo);
			return ResultObj.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}

	/**
	 * 修改书籍信息
	 */
	@RequestMapping("updateBook")
	public ResultObj updateBook(BookVo bookVo) {
		try {
			this.bookService.updateBook(bookVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}

	/**
	 * 删除书籍
	 */
	@RequestMapping("deleteBook")
	public ResultObj deleteBook(BookVo bookVo) {
		try {
			this.bookService.deleteBook(bookVo.getBookid());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}

	/**
	 * 批量删除书籍
	 */
	@RequestMapping("deleteBatchBook")
	public ResultObj deleteBatchBook(BookVo bookVo) {
		try {
			this.bookService.deleteBatchBook(bookVo.getIds());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
}
