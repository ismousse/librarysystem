package com.laji.domain;

/**
 * 书架实体
 * @author lsq
 * @date 2019年12月8日 下午10:52:33
 */
public class BookShelf {
	private Integer id;//书架编号
	private String name;//书架名称
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
