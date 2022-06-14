package com.szs.po;

import java.util.List;

/**
 * 公寓实体类
 * @author ZS
 *
 */
public class Build {

	private Integer build_id;//公寓ID
	private String build_name;//公寓名称
	private Integer user_id;//管理员ID
	private User user;//管理员列表
	private List<Dorm> dormlist;
	public Integer getBuild_id() {
		return build_id;
	}
	public void setBuild_id(Integer build_id) {
		this.build_id = build_id;
	}
	public String getBuild_name() {
		return build_name;
	}
	public void setBuild_name(String build_name) {
		this.build_name = build_name;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public List<Dorm> getDormlist() {
		return dormlist;
	}
	public void setDormlist(List<Dorm> dormlist) {
		this.dormlist = dormlist;
	}
	
}
