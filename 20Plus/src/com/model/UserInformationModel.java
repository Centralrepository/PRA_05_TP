package com.model;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;

import com.controller.AddUserController;

public class UserInformationModel {
	//static Logger logger = Logger.getLogger(UserInformationModel.class);
	private String userName;
	private String address;
	private long mobileNo;
	private long pincode;
	private String gender;
	private Timestamp startDateTime;
	private Timestamp endDateTime;
	private String parentInfo;
	private String superParentInfo;
	private String grandParent;
	private String firstAdmin;
	
	
	public String getFirstAdmin() {
		return firstAdmin;
	}
	public void setFirstAdmin(String firstAdmin) {
		this.firstAdmin = firstAdmin;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGrandParent() {
		return grandParent;
	}
	public void setGrandParent(String grandParent) {
		this.grandParent = grandParent;
	}
	public String getParentInfo() {
		return parentInfo;
	}
	public void setParentInfo(String parentInfo) {
		this.parentInfo = parentInfo;
	}
	public String getSuperParentInfo() {
		return superParentInfo;
	}
	public void setSuperParentInfo(String superParentInfo) {
		this.superParentInfo = superParentInfo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public Timestamp getStartDateTime() {
		return startDateTime;
	}
	public void setStartDateTime(Timestamp startDateTime) {
		this.startDateTime = startDateTime;
	}
	public Timestamp getEndDateTime() {
		return endDateTime;
	}
	public void setEndDateTime(Timestamp endDateTime) {
		this.endDateTime = endDateTime;
	}
	@Override
	public String toString() {
		//logger.info("-----getting user information in UserInformationModel   ----->>>>"+new Date());
		return "UserInformationModel [userName=" + userName + ", address=" + address + ", mobileNo=" + mobileNo
				+ ", pincode=" + pincode + ", gender=" + gender + ", startDateTime=" + startDateTime + ", endDateTime="
				+ endDateTime + ", parentInfo=" + parentInfo + ", superParentInfo=" + superParentInfo + ", grandParent="
				+ grandParent + "]";
	}
	
	
}
