package com.bean;

public class ForgotUserPassword {

	private long userId;
	private long mobileNo;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}
	@Override
	public String toString() {
		return "UserForgotPassword [userId=" + userId + ", mobileNo=" + mobileNo + "]";
	}
	
	
}
