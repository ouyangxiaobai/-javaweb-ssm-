package com.szs.po;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 用户持久化类
 * @author ZS
 *
 */
public class User implements Serializable{
	private static final long serialVersionUID=1L;
	private Integer user_id;//用户id
	private String user_name;//用户账号
	private String user_password;//用户密码
	private String user_access;//用户状态
	private String user_phone;//用户电话
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_access() {
		return user_access;
	}
	public void setUser_access(String user_access) {
		this.user_access = user_access;
	}
	
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
