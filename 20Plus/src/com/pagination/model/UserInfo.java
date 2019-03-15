package com.pagination.model;

public class UserInfo {
	private long user_id;
	private String user_name;
	private long Mobile_No;
	private String password;
	private String parent;
	private String super_parent;
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public long getMobile_No() {
		return Mobile_No;
	}
	public void setMobile_No(long mobile_No) {
		Mobile_No = mobile_No;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getSuper_parent() {
		return super_parent;
	}
	public void setSuper_parent(String super_parent) {
		this.super_parent = super_parent;
	}
	@Override
	public String toString() {
		return "UserInfo [user_id=" + user_id + ", user_name=" + user_name + ", Mobile_No=" + Mobile_No + ", password="
				+ password + ", parent=" + parent + ", super_parent=" + super_parent + "]";
	}
	
	
}
