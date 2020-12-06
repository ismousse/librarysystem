package com.laji.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.laji.domain.Reader;

/**
 * 读者扩展类
 * @author lsq
 * @date 2019年12月7日 下午10:50:34
 */
public class ReaderVo extends Reader {
	//分页参数
	private Integer page;
	private Integer limit;
	//用来批量删除的
	private Integer [] ids;
	//查询的时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date startTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date endTime;
	
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
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
