package com.laji.vo;

import com.laji.domain.Menu;

/**
 * 菜单扩展
 * @author lsq
 * @date 2019年12月6日 下午11:12:37
 */
public class MenuVo extends Menu {
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
