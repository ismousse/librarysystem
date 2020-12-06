package com.laji.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 图书馆实体类
 * @author lsq
 * @date 2019年12月7日 下午8:21:31
 */
public class Library {
	private Integer id;
	private String libraryname;
	private String curator;
	private String tel;
	private String address;
	private String email;
	private String url;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date createDate;
	private String introduce;
	  
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLibraryname() {
		return libraryname;
	}
	public void setLibraryname(String libraryname) {
		this.libraryname = libraryname;
	}
	public String getCurator() {
		return curator;
	}
	public void setCurator(String curator) {
		this.curator = curator;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
}
