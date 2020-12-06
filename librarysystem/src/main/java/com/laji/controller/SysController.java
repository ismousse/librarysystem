package com.laji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转
 * @author lsq
 * @date 2019年12月6日 下午11:29:02
 */
@Controller
@RequestMapping("sys")
public class SysController {

	/**
	 * 首页的右边
	 * @return
	 */
	@RequestMapping("toDeskManager")
	public String toDeskManager() {
		return "backstage/main/deskManager";
	}
	
	/**
	 * 跳转管理员管理页面
	 */
	@RequestMapping("toAdminManager")
	public String toAdminManager() {
		return "backstage/admin/adminManager";
	}
	
	/**
	 * 跳转到图书馆信息页面
	 */
	@RequestMapping("toLibraryManager")
	public String toLibraryManager() {
		return "backstage/library/libraryManager";
	}
	
	/**
	 * 跳转到读者信息管理页面
	 */
	@RequestMapping("toReaderManager")
	public String toReaderManager() {
		return "backstage/reader/readerManager";
	}
	
	/**
	 * 跳转到读者类型管理
	 */
	@RequestMapping("toReaderTypeManager")
	public String toReaderTypeManager() {
		return "backstage/reader/readerTypeManager";
	}
	
	/**
	 * 跳转到图书信息管理
	 */
	@RequestMapping("toBookManager")
	public String toBookManager() {
		return "backstage/book/bookManager";
	}
	
	/**
	 * 跳转到图书类型管理
	 */
	@RequestMapping("toBookTypeManager")
	public String toBookTypeManager() {
		return "backstage/book/bookTypeManager";
	}
	
	/**
	 * 跳转到图书类型管理
	 */
	@RequestMapping("toBookShelfManager")
	public String toBookShelfManager() {
		return "backstage/book/bookShelfManager";
	}
	
	/**
	 * 跳转到借书管理
	 */
	@RequestMapping("toBorrowManager")
	public String toBorrowManager() {
		return "backstage/rent/borrowManager";
	}
	
	/**
	 * 跳转到还书管理
	 */
	@RequestMapping("toReturnManager")
	public String toReturnManager() {
		return "backstage/rent/returnManager";
	}
	
	/**
	 * 跳转到借阅查询
	 * @return
	 */
	@RequestMapping("toSearchManager")
	public String toSearchManager() {
		return "backstage/rent/searchManager";
	}
	
	/**
	 * 跳转到参数查询
	 * @return
	 */
	@RequestMapping("toCanshuManager")
	public String toCanshuManager() {
		return "backstage/admin/canshuManager";
	}
}
