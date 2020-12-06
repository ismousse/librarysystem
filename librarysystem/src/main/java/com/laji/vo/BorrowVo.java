package com.laji.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.laji.domain.Borrow;

/**
 * 借书扩展类
 * @author lsq
 * @date 2019年12月9日 下午2:20:25
 */
public class BorrowVo extends Borrow {
	//分页参数
	private Integer page;
	private Integer limit;
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
