package com.laji.domain;

/**
 * 菜单实体(用来关联管理员是否有此菜单)
 * @author lsq
 * @date 2019年12月6日 下午10:53:35
 */
public class Menu {
	private Integer id;//当前菜单id
	private Integer pid;//当前菜单的父菜单id
	private String title;//菜单名称
	private String href;//链接
	private Integer spread;//是否展开
	private String icon;//图标
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public Integer getSpread() {
		return spread;
	}
	public void setSpread(Integer spread) {
		this.spread = spread;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
