package com.db.template;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Stack;

import org.apache.log4j.Logger;

import com.controller.AddUserController;
import com.db.conf.DBConnection;
import com.model.UserInformationModel;


// Pending Approval for Normal Users
public class UpdateNewMemeberInfo {
	static Logger logger = Logger.getLogger(UpdateNewMemeberInfo.class);
	
	public boolean addParentMember(Stack<UserInformationModel> listOfMemeber,long addedUserId) throws SQLException {
		logger.info("-----  UpdateNewMemeberInfo ----->>>>"+new Date());
		
		Connection connection = DBConnection.getDBConnetion();
		PreparedStatement preparedStatement = connection.prepareStatement("insert into user_information (user_id,user_name,Address,Pincode,Mobile_No) values(?,?,?,?,?)");
		int counter =0 ;
		int count = listOfMemeber.size();
		for(int i=0;i<count;i++) {
			UserInformationModel informationModel = listOfMemeber.pop();
			preparedStatement.setLong(1,getPrimaryKey());
			preparedStatement.setString(2, informationModel.getUserName());
			preparedStatement.setString(3, informationModel.getAddress());
			preparedStatement.setLong(4, informationModel.getPincode());
			preparedStatement.setLong(5, informationModel.getMobileNo());
			
			preparedStatement.executeUpdate();
			ResultSet rs = preparedStatement.getGeneratedKeys();
			if (rs.next()) {
				//rs.getLong(1);
				
				// counter = 0 parent  , counter =1 super_parent , counter=2 = first_admin
				updatingUserParent(addedUserId,rs.getLong(1)+"-"+informationModel.getUserName(),counter);
				}
			
			counter++;
		}
		return true;
	
	}
	public int updateUserApprovalStatus(long addedUserId) {
		try {
			Connection connection = DBConnection.getDBConnetion();
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set Approval=1 where user_id='"+addedUserId+"'");
			return preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
	}
		
	private void updatingUserParent(long addedUserId,String parentUserName,int counter) throws SQLException {
		
		Connection connection = DBConnection.getDBConnetion();
		if(counter==0)
		{
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set parent='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();
		}
		else if(counter==1)
		{
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set super_parent='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();	
		}
		else if(counter==2) {
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set first_admin='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();	
		}
	}
	
	public long getPrimaryKey() throws SQLException {
		Connection connection = DBConnection.getDBConnetion();
		Statement stq = connection.createStatement();
		ResultSet rs = stq.executeQuery("select MIN(user_id) from user_information");
		rs.next();
		return rs.getLong(1)-1;
		
	}
		
	
	// Expired User Details Update
	public boolean addExistingUserParentMember(Stack<UserInformationModel> listOfMemeber,long addedUserId) throws SQLException {
		logger.info("-----  UpdateNewMemeberInfo ----->>>>"+new Date());
				
				Connection connection = DBConnection.getDBConnetion();
				PreparedStatement preparedStatement = connection.prepareStatement("insert into user_information (user_id,user_name,Address,Pincode,Mobile_No) values(?,?,?,?,?)");
				int counter =0 ;
				int count = listOfMemeber.size();
				for(int i=0;i<count;i++) {
					UserInformationModel informationModel = listOfMemeber.pop();
					preparedStatement.setLong(1,getPrimaryKeyExpiredUser());
					preparedStatement.setString(2, informationModel.getUserName());
					preparedStatement.setString(3, informationModel.getAddress());
					preparedStatement.setLong(4, informationModel.getPincode());
					preparedStatement.setLong(5, informationModel.getMobileNo());
					
					preparedStatement.executeUpdate();
					ResultSet rs = preparedStatement.getGeneratedKeys();
					if (rs.next()) {
						//rs.getLong(1);
						
						// counter = 0 parent  , counter =1 super_parent , counter=2 = first_admin
						updatingExpiredUserParent(addedUserId,rs.getLong(1)+"-"+informationModel.getUserName(),counter);
						}
					
					counter++;
				}
				return true;
			
			}
	
	
private void updatingExpiredUserParent(long addedUserId,String parentUserName,int counter) throws SQLException {
		
		Connection connection = DBConnection.getDBConnetion();
		if(counter==0)
		{
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set parent='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();
		}
		else if(counter==1)
		{
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set super_parent='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();	
		}
		else if(counter==2) {
			PreparedStatement preparedStatement = connection.prepareStatement("update user_information set first_admin='"+parentUserName+"' where user_id='"+addedUserId+"'");
			preparedStatement.executeUpdate();	
		}
		PreparedStatement preparedStatement = connection.prepareStatement("update user_information set Approval=1, STATUS='ACTIVE' where user_id='"+addedUserId+"'");
		preparedStatement.executeUpdate();
	}
	
	public long getPrimaryKeyExpiredUser() throws SQLException {
		Connection connection = DBConnection.getDBConnetion();
		Statement stq = connection.createStatement();
		ResultSet rs = stq.executeQuery("select MIN(user_id) from user_information");
		rs.next();
		return rs.getLong(1)-1;
		
	}
	
	
	
}
