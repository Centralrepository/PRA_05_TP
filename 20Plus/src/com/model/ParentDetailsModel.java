package com.model;

import java.util.Date;

import org.apache.log4j.Logger;

import com.controller.AddUserController;

public class ParentDetailsModel {
	static Logger logger = Logger.getLogger(ParentDetailsModel.class);
	private long parentId;
	private String parentName;
	private String address;
	private long mobileNo;
	private long pincode;
	public long getParentId() {
		return parentId;
	}
	
	public void setParentId(long parentId) {
		this.parentId = parentId;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}
	public long getPincode() {
		return pincode;
	}
	public void setPincode(long pincode) {
		this.pincode = pincode;
	}
	@Override
	public String toString() {
		logger.info("-----getting parent details in ParentDetailsModel ----->>>>"+new Date());
		return "ParentDetailsModel [parentId=" + parentId + ", parentName=" + parentName + ", Address=" + address
				+ ", mobileNo=" + mobileNo + ", pincode=" + pincode + "]";
	}
	
	
}
