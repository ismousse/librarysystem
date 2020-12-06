package com.laji.domain;

/**
 * 书本类型
 * @author lsq
 * @date 2019年12月8日 下午10:55:28
 */
public class BookType {
	private Integer id;//类型编号
	private String typename;//类型名称
	private Integer days;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
}
