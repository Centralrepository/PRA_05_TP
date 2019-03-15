package com.model;

public class AdminDetail {
	private long id;
	private String adminId;
	private String adminName;
	private String address;
	private long pincode;
	private long mobileNo;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPincode() {
		return pincode;
	}
	public void setPincode(long pincode) {
		this.pincode = pincode;
	}
	public long getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}
	@Override
	public String toString() {
		return "AdminDetail [id=" + id + ", adminId=" + adminId + ", adminName=" + adminName + ", address=" + address
				+ ", pincode=" + pincode + ", mobileNo=" + mobileNo + "]";
	}
	
}
