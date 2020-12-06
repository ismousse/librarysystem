package com.laji.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 读者实体
 * @author lsq
 * @date 2019年12月6日 下午5:22:54
 */
public class Reader {
	private Integer readerId;//读者id
	private String name;//读者姓名
	private Integer sex;//读者性别
	private String barcode;//读者条形码号(年月日加上四位数字)
	private String vocation;//职业
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	private Date birthday;//
	private Integer typeid;//读者类型   0:普通读者,1:VIP读者
	private Integer paperType;//有效证件 0:身份证,1:学生卡
	private String paperNO;//证件号码
	private String tel;//读者电话
	private String email;//读者邮箱
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date createtime;//注册时间
	private String remark;//备份
	private String operator;//录入操作员
	
	//级联
	private ReaderType readerType;
	
	public ReaderType getReaderType() {
		return readerType;
	}
	public void setReaderType(ReaderType readerType) {
		this.readerType = readerType;
	}
	public Integer getReaderId() {
		return readerId;
	}
	public void setReaderId(Integer readerId) {
		this.readerId = readerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getVocation() {
		return vocation;
	}
	public void setVocation(String vocation) {
		this.vocation = vocation;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Integer getPaperType() {
		return paperType;
	}
	public void setPaperType(Integer paperType) {
		this.paperType = paperType;
	}
	public String getPaperNO() {
		return paperNO;
	}
	public void setPaperNO(String paperNO) {
		this.paperNO = paperNO;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
}
