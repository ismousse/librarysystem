package com.laji.vo;

import com.laji.domain.Admin;

/**
 * 管理员扩展类
 * @author lsq
 * @date 2019年12月6日 下午7:50:21
 */
public class AdminVo extends Admin {
	//分页参数
	private Integer page;
	private Integer limit;
	//用来分配菜单的
	private Integer [] ids;
	
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
