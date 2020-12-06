package com.laji.controller;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laji.constant.SysConstast;
import com.laji.domain.Admin;
import com.laji.service.BookService;
import com.laji.service.BookTypeService;
import com.laji.service.BorrowService;
import com.laji.service.ReaderService;
import com.laji.utils.DataGridView;
import com.laji.utils.ResultObj;
import com.laji.utils.WebUtils;
import com.laji.vo.BorrowVo;

@RestController
@RequestMapping("borrow")
public class BorrowController {
	
	@Autowired
	private BorrowService borrowService;
	@Autowired
	private BookTypeService bookTypeService;
	@Autowired
	private BookService bookService;
	@Autowired
	private ReaderService readerService;
	
	/**
	 * 加载借阅列表(在还书里面列表)
	 * @param userVo
	 * @return
	 */
	@RequestMapping("queryAllBorrow")
	public DataGridView queryAllBorrow(BorrowVo borrowVo) {
		return this.borrowService.queryAllBorrow(borrowVo);
	}
	
	/**
	 * 添加借阅
	 */
	@RequestMapping("addBorrow")
	public ResultObj addBorrow() {
		try {
			String bookid = WebUtils.getHttpServletRequest().getParameter("bookid");
			String isbn = WebUtils.getHttpServletRequest().getParameter("isbn");
			String readerId = WebUtils.getHttpServletRequest().getParameter("readerId");
			String remark = WebUtils.getHttpServletRequest().getParameter("remark");
			String typeid = WebUtils.getHttpServletRequest().getParameter("typeid");
			//判断读者类型 借书数目 是否可再借书
			Integer number = this.readerService.queryNumberByBarcode(readerId);
			Integer number2 = this.borrowService.queryBorrowCount(readerId);
			if(number > number2) {
				//添加借阅
				BorrowVo borrowVo = new BorrowVo();
				Integer days = this.bookTypeService.queryById(Integer.parseInt(typeid));
				borrowVo.setBookid(Integer.parseInt(bookid));
				borrowVo.setReaderId(readerId);
				int random = (int) (Math.random()*10000);
				borrowVo.setBarcode(isbn + random);
				Date date = new Date();
				borrowVo.setBorrowTime(date);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DAY_OF_YEAR, days);
				Date d = calendar.getTime();
				borrowVo.setBackTime(d);
				Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
				borrowVo.setGiveoperator(admin.getUsername());
				borrowVo.setRemark(remark);
				this.borrowService.addBorrow(borrowVo);
				//修改库存
				this.bookService.updateDelBookById(Integer.parseInt(bookid));
				return ResultObj.ADD_SUCCESS;
			}else {
				return ResultObj.ADD_ERROR_MORE;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.ADD_ERROR;
		}
	}
	
	/**
	 * 修改借阅
	 */
	@RequestMapping("updateBorrow")
	public ResultObj updateBorrow(BorrowVo borrowVo) {
		try {
			this.bookService.updateAddBookById(borrowVo.getBookid());
			Date date = new Date();
			borrowVo.setRealbackTime(date);
			borrowVo.setIfback(SysConstast.BE_BACk);
			Admin admin = (Admin) WebUtils.getHttpSession().getAttribute("admin");
			borrowVo.setBackoperator(admin.getUsername());
			this.borrowService.updateBorrow(borrowVo);
			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.UPDATE_ERROR;
		}
	}
	
	/**
	 * 删除借阅
	 */
	@RequestMapping("deleteBorrow")
	public ResultObj deleteBorrow(BorrowVo borrowVo) {
		try {
			this.borrowService.deleteBorrow(borrowVo.getId());
			return ResultObj.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ResultObj.DELETE_ERROR;
		}
	}
	
	
	/**
	 * queryBestReader
	 */
	@RequestMapping("queryBestReader")
	public DataGridView queryBestReader() {
		return this.borrowService.queryBestReader();
	}

	/**
	 * queryBestReader
	 */
	@RequestMapping("queryBestBook")
	public DataGridView queryBestBook() {
		return this.borrowService.queryBestBook();
	}
	
	/**
	 * 根据读者条形码号查询未归还的书
	 * @return
	 */
	@RequestMapping("queryAllBorrowByRid")
	public DataGridView queryAllBorrowByRid(BorrowVo borrowVo) {
		if(borrowVo.getReaderId() == null || "".equals(borrowVo.getReaderId())) {
			return null;
		}
		return this.borrowService.queryAllBorrowByRid(borrowVo);
	}
}
