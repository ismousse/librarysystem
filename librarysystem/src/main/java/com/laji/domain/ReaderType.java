package com.laji.domain;

/**
 * 读者类型实体
 * @author lsq
 * @date 2019年12月8日 上午11:02:07
 */
public class ReaderType {
	private Integer readertypeId;//类型编号
	private String typename;//类型名称
	private Integer number;//可借阅图书数量
	public Integer getReadertypeId() {
		return readertypeId;
	}
	public void setReadertypeId(Integer readertypeId) {
		this.readertypeId = readertypeId;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
}
