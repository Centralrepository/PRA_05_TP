package com.db.template;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.apache.log4j.Logger;

import com.controller.AddUserController;
import com.db.conf.DBConnection;
import com.model.UserInformationModel;

public class GetUserDetail {
	static Logger logger = Logger.getLogger(GetUserDetail.class);
	public static  UserInformationModel getDetails(long user_id) throws SQLException{
		logger.info("-----Getting User Details  ----->>>>"+new Date());
		Connection con = DBConnection.getDBConnetion();
		Statement st = con.createStatement();
		ResultSet dataCursor=st.executeQuery("select user_id,user_name,Address,Pincode,Mobile_No from user_information where user_id='"+user_id+"';");
		UserInformationModel informationModel = new UserInformationModel();
		if(dataCursor.next()){
			
			informationModel.setUserName(dataCursor.getString("user_name"));
			informationModel.setAddress(dataCursor.getString("Address"));
			informationModel.setPincode(dataCursor.getLong("Pincode"));
			informationModel.setMobileNo(dataCursor.getLong("Mobile_No"));
			return informationModel;
		}
		
		return null;

	}

}
