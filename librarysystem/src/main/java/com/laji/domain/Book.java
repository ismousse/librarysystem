package com.laji.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * 书实体类
 * @author lsq
 * @date 2019年12月6日 下午5:11:38
 */
public class Book {
	private Integer bookid;//书编号
	private String barcode;//条形码
	private String ISBN;//国际标准书号
	private String bookname;//书名
	private Integer typeid;//类型编号
	private Integer shelfid;//书架编号
	private String author;//作者
	private Integer bookcount;// 书籍数量
	private Double price;//书价
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date createtime;// 发布时间
	private String operator;//录入操作员
	private Integer del;//是否删除 默认是0(未删除)
	
	//级联
	private BookType bookType;
	private BookShelf bookShelf;
	
	public Integer getShelfid() {
		return shelfid;
	}
	public void setShelfid(Integer shelfid) {
		this.shelfid = shelfid;
	}
	public BookType getBookType() {
		return bookType;
	}
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	public BookShelf getBookShelf() {
		return bookShelf;
	}
	public void setBookShelf(BookShelf bookShelf) {
		this.bookShelf = bookShelf;
	}
	public Integer getBookid() {
		return bookid;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getBookcount() {
		return bookcount;
	}
	public void setBookcount(Integer bookcount) {
		this.bookcount = bookcount;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
}
