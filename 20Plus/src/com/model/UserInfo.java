package com.model;

import java.sql.Timestamp;

public class UserInfo {
	
	private long user_id;
	public String userName;
	private long mobile_No;
	private String password;
	private String parent;
	private String super_parent;
	private Timestamp startDate;
	private Timestamp expireDate;
	
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Timestamp expireDate) {
		this.expireDate = expireDate;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getMobile_No() {
		return mobile_No;
	}
	public void setMobile_No(long mobile_No) {
		this.mobile_No = mobile_No;
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

	
	
}
