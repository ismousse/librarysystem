package com.laji.vo;

import com.laji.domain.Library;

/**
 * 图书馆扩展类
 * @author lsq
 * @date 2019年12月7日 下午8:21:16
 */
public class LibraryVo extends Library {
	//分页参数
	private Integer page;
	private Integer limit;
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
