package com.bean;

public class ForgotAdminPassword {

	private long adminId;
	private long mobileNo;
	public long getadminId() {
		return adminId;
	}
	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}
	public long getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}
	@Override
	public String toString() {
		return "AdminForgotPassword [adminId=" + adminId + ", mobileNo=" + mobileNo + "]";
	}

	
}
