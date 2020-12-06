package com.laji.domain;
/**
 * 管理员实体
 * @author lsq
 * @date 2019年12月6日 下午5:20:55
 */
public class Admin {
	private Integer adminId;//管理员id
	private String username;//用户名
	private String password;//密码
	private Integer level;//管理员级别
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
