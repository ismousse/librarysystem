package com.laji.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 借书 实体
 * @author lsq
 * @date 2019年12月9日 下午2:17:59
 */
public class Borrow {
	private Integer id;//借阅编号
	private String readerId;//读者编号 barcode
	private Integer bookid;//书籍编号
	private String barcode;//条形码
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date borrowTime;//借阅时间（开始）
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date backTime;//预计最长归还时间（结束）
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date realbackTime;//真实归还时间
	private String giveoperator;//借阅操作员
	private String backoperator;//归还操作员
	private String remark;//记录
	private Integer ifback;//是否归还 借阅是0 
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReaderId() {
		return readerId;
	}
	public void setReaderId(String readerId) {
		this.readerId = readerId;
	}
	public Integer getBookid() {
		return bookid;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public Date getBorrowTime() {
		return borrowTime;
	}
	public void setBorrowTime(Date borrowTime) {
		this.borrowTime = borrowTime;
	}
	public Date getBackTime() {
		return backTime;
	}
	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}
	public Date getRealbackTime() {
		return realbackTime;
	}
	public void setRealbackTime(Date realbackTime) {
		this.realbackTime = realbackTime;
	}
	public String getGiveoperator() {
		return giveoperator;
	}
	public void setGiveoperator(String giveoperator) {
		this.giveoperator = giveoperator;
	}
	public String getBackoperator() {
		return backoperator;
	}
	public void setBackoperator(String backoperator) {
		this.backoperator = backoperator;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getIfback() {
		return ifback;
	}
	public void setIfback(Integer ifback) {
		this.ifback = ifback;
	}
}
