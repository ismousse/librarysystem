package com.laji.vo;

import com.laji.domain.Book;

/**
 * 书扩展类
 * @author lsq
 * @date 2019年12月8日 下午9:07:25
 */
public class BookVo extends Book {
	//分页参数
	private Integer page;
	private Integer limit;
	//批量删除
	private Integer[] ids;
	
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
}
