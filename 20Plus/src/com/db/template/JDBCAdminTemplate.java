package com.db.template;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.bean.ForgotAdminPassword;
import com.bean.ForgotUserPassword;
import com.controller.AddUserController;
import com.db.conf.DBConnection;
import com.model.AdminDetail;
import com.model.UserInformationModel;
import com.sms.service.SendMessage;

public class JDBCAdminTemplate {
	static Logger logger = Logger.getLogger(JDBCAdminTemplate.class);
	public boolean adminAuthentication(String userName,long adminId) {
		try {
		Connection con = DBConnection.getDBConnetion();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from admin_info where adminId='"+userName+"' AND id= '"+adminId+"'");
		if(rs.next()) {
			return true;
		}
	return false;
		}catch (Exception e) {
			logger.warn("------>>> getting data in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
			return false;
		}
	}
	
	public String getAdminName(long id) throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		String userName="";
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select user_name from admin_info where id= '"+id+"'");
		if(rs.next()) {
			userName= rs.getString("user_name");
		}
	return userName;
	}
	
	
	public long addMember(String userName,String gender,String address,long pincode,long mobileNo) {
		
	try {
		Connection con = DBConnection.getDBConnetion();
		/*if(!verifyParentAvailability(parentId)) {
			return 1;
		}*/
		Timestamp startDate = new Timestamp(new Date().getTime());
		Calendar cal = Calendar.getInstance();
	    cal.setTimeInMillis(startDate.getTime());
	    cal.setTimeInMillis(startDate.getTime());
	    cal.add(Calendar.DAY_OF_MONTH, 90);
	    Timestamp expireDate = new Timestamp(cal.getTime().getTime());
		PreparedStatement pst = con.prepareStatement("insert into user_information(user_name,Gender,Address,Pincode,Mobile_No,password,Approval,Status,start_date,expire_date,admin_added) value(?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, userName);
		pst.setString(2, gender);
		pst.setString(3, address);
		pst.setLong(4, pincode);
		pst.setLong(5, mobileNo);
		pst.setString(6,"123456");
		pst.setInt(7, 5);
		pst.setString(8,"ACTIVE");
		pst.setTimestamp(9, startDate);
		pst.setTimestamp(10, expireDate);
		pst.setInt(11, 1);
//		pst.setLong(12, getUpdatedPrimaryKey());
		pst.executeUpdate();
		ResultSet rs = pst.getGeneratedKeys();
		if(rs != null && rs.next()){
            return rs.getLong(1);
        }
		else {
			return 0;
		}
	}
	catch (Exception e) {
		logger.warn("------>>> inserting user info in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
		// TODO: handle exception
	
		return 0;
	}
		
		
	}
	public long getUpdatedPrimaryKey() throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		Statement primaryKeyStatement = con.createStatement();
		ResultSet keySet = primaryKeyStatement.executeQuery("SELECT MAX(user_id) FROM user_information;");
		long primaryKey = 10000;
		try {
			if(keySet.next()) {
				primaryKey = keySet.getLong(1);
				return primaryKey;
			}
		}
		catch (NullPointerException e) {
			logger.warn("------>>> getting data in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
		}
		
		return primaryKey;
	}
	
	public boolean saveMoneyOrderId(String moneyOrder) {
			Connection con = DBConnection.getDBConnetion();
			try {
				PreparedStatement pst = con.prepareStatement("insert into moneyorder_id(order_id) value(?)");
				pst.setString(1,moneyOrder);
				if(pst.executeUpdate()==1) {
					return true;
				}
				return false;
			} 
			catch (SQLException e) {
				logger.warn("------>>> inserting monetorder  in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
				return false;
		}	
	}
	
	public boolean verifyParentAvailability(long parentId) throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		Statement  st  = con.createStatement();
		return st.executeQuery("select * from user_information where user_id='"+parentId+"'").next();
	}
	
	
	public Map<Long,String> getSuperMemeberDetails(long parentId,Map<Long,String> map) {
		Connection con = DBConnection.getDBConnetion();
		try {
			PreparedStatement pst = con.prepareStatement("select Parent_id,Parent_Name from user_information where user_id= ?");
			pst.setLong(1, parentId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				if(rs.getLong("Parent_id") !=0) {
					map.put(rs.getLong("Parent_id"), rs.getString("Parent_Name"));
				}
				
				
			}
			return map;
		} 
		catch (SQLException e) {
			logger.warn("------>>> getting parent name in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			return map;
	}	
	}
	
	public boolean submitMemberDetails(String member1,String member2,String member3,String member4) {
		Connection con = DBConnection.getDBConnetion();
		try {
			PreparedStatement pst = con.prepareStatement("update user_information SET parent = ?,super_parent = ? where user_id='"+member4.split("-")[1]+"'");
			pst.setString(1,member3);
			pst.setString(2,member2);
			if(pst.executeUpdate()>0) {
				return true;
			}
		} 
		catch (SQLException e) {
			logger.warn("------>>> updating data in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			return false;
	}	
		
		return false;
	}
	
//  updating approval status
	
	public boolean ApproveMember(Long usid) {
		Connection con = DBConnection.getDBConnetion();
		try {
			PreparedStatement pst = con.prepareStatement("update user_information SET Approval = ? , Status = ? where user_id='"+usid+"'");
			pst.setInt(1,1);
			pst.setString(2,"ACTIVE");
			if(pst.executeUpdate()>0) {
				updateNoOfChildren(usid);
				sendSmsToUser(usid);
				return true;
			}
		} 
		catch (SQLException e) {
			logger.warn("------>>> setting Approval in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
			return false;
	}	
		
		return false;
	}
	
	public void updateNoOfChildren(long userId) {
		Connection con = DBConnection.getDBConnetion();
		try {
			Statement stmtParentId = con.createStatement();
			ResultSet getParentId = stmtParentId.executeQuery("select parent from user_information where user_id='"+userId+"'");
			if(getParentId.next()) {
				long parentId = Long.parseLong(getParentId.getString("parent").split("-")[0]);
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery("select No_of_Children from user_information where user_id='"+parentId+"'");
				if(rs.next()) {
					int no_of_children = rs.getInt("No_of_Children");
					Connection childrenUpdateCon = DBConnection.getDBConnetion();
					try {
						PreparedStatement pst = childrenUpdateCon.prepareStatement("update user_information SET No_of_Children = ? where user_id='"+parentId+"'");
						no_of_children = no_of_children-1;
						pst.setInt(1,no_of_children);
						pst.executeUpdate();
						
					} 
					catch (SQLException e) {
						logger.warn("------>>> setting Approval in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
					
				}	
					catch (Exception e) {
						// TODO: handle exception
					}
				}
			}
		} 
		catch (SQLException e) {
			logger.warn("------>>> setting Approval in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
		}	
	}
	
	//
	private void sendSmsToUser(long usid) {
		Connection con = DBConnection.getDBConnetion();
		try {
			Statement getUserDetailsQuery = con.createStatement();
			ResultSet userDetails = getUserDetailsQuery.executeQuery("select user_name,Mobile_No,password from user_information where user_id='"+usid+"'");
				if(userDetails.next()) {
					
					String msg="Hi "+userDetails.getString("user_name").split(" ")[0]+",%nUser Id : "+usid+"%nPassword : "+userDetails.getString("password")+"%nPlease login www.twentyplus.in%nThanks";
					try {
						SendMessage.sendMessageToUser(usid, msg, userDetails.getLong("Mobile_No"));
					}
					catch (Exception e) {
						logger.warn("------>>> sending sms in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
					}
				}
		} 
		catch (SQLException e) {
			logger.warn("------>>> sending sms in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
		}	
	}
	
	
	
	// for creting new form after approval
	public void createNewUserService(List<UserInformationModel> usersDetailList,long currentUserId) {
		int count =1;
		for(UserInformationModel informationModel : usersDetailList) {
			try {
				if(!mobileNoValidation(informationModel)) {
					//  write the code for creating and updating
					
					createAndUpdateNewUserInfo(informationModel,count,currentUserId);
					
				}
				count++;
			} catch (SQLException e) {
				logger.warn("------>>> New form in JDBCAdminTemplate  <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private boolean mobileNoValidation(UserInformationModel mobileNo) throws SQLException {
		Connection mobileConn = DBConnection.getDBConnetion();
		Statement getMobileDetails = mobileConn.createStatement();
		ResultSet rs = getMobileDetails.executeQuery("select * from user_information where Mobile_no='"+mobileNo.getMobileNo()+"'");
		return rs.next();
	}
	
	
	
	private void createAndUpdateNewUserInfo(UserInformationModel informationModel,int count,long currentUserId) throws SQLException {
		Connection connection = DBConnection.getDBConnetion();
		long lowestId=getPrimaryKey();
		if(count ==1 ) {
			PreparedStatement pst = connection.prepareStatement("insert into user_information(user_id,user_name,Mobile_No,Address,Pincode) values(?,?,?,?,?)");
			pst.setLong(1,lowestId-2 );
			pst.setString(2,informationModel.getUserName());
			pst.setLong(3,informationModel.getMobileNo());
			pst.setString(4, informationModel.getAddress());
			pst.setLong(5, informationModel.getPincode());
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			rs.next();
			updateUser(rs.getLong(1),informationModel.getUserName(),count,currentUserId);
		}
		else if (count ==2) {
			PreparedStatement pst = connection.prepareStatement("insert into user_information(user_id,user_name,Mobile_No,Address,Pincode) values(?,?,?,?,?)");
			pst.setLong(1, lowestId-1);
			pst.setString(2,informationModel.getUserName());
			pst.setLong(3,informationModel.getMobileNo());
			pst.setString(4, informationModel.getAddress());
			pst.setLong(5, informationModel.getPincode());
			pst.executeUpdate();
			ResultSet rs = pst.getGeneratedKeys();
			rs.next();
			updateUser(rs.getLong(1),informationModel.getUserName(),count,currentUserId);
		}
		
		
		
	}
	private void updateUser(long newUserId ,String userNAme,int count,long currentUserId) throws SQLException{
		Connection updateQueryConn = DBConnection.getDBConnetion();
		Statement st = updateQueryConn.createStatement();
		if(count==1) {
			st.execute("update user_information set super_parent ='"+newUserId+"-"+userNAme+"' where user_id='"+currentUserId+"'" );
		}
		else if (count==2) {
			
			st.execute("update user_information set parent ='"+newUserId+"-"+userNAme+"' where user_id='"+currentUserId+"'" );
		}
		st=null;
	}
	
	public long getPrimaryKey() throws SQLException {
		Connection connection = DBConnection.getDBConnetion();
		Statement stq = connection.createStatement();
		ResultSet rs = stq.executeQuery("select MIN(user_id) from user_information");
		rs.next();
		return rs.getLong(1);
		
	}

	
	
//Adding New Admin to DB
public long addnewadmin(String userName,String address,long pincode,long mobileNo,String adminPassword) {
	
try {
	Connection con = DBConnection.getDBConnetion();
	/*if(!verifyParentAvailability(parentId)) {
		return 1;
	}*/

	PreparedStatement pst = con.prepareStatement("insert into admin_info(adminId,user_name,address,pincode,mobile_no) value(?,?,?,?,?)");
	pst.setString(1,adminPassword );
	pst.setString(2, userName);
	pst.setString(3, address);
	pst.setLong(4, pincode);
	pst.setLong(5, mobileNo);
	
//	pst.setLong(12, getUpdatedPrimaryKey());
	pst.executeUpdate();
	ResultSet rs = pst.getGeneratedKeys();
	if(rs != null && rs.next()){
    return rs.getLong(1);
}
	else {
		return 0;
	}
}
catch (Exception e) {
	// TODO: handle exception

	return 0;
}
	
	
}

//creating first admin

public long createFirstAdmin(AdminDetail firstAdminDetails) throws SQLException {
	Connection connection = DBConnection.getDBConnetion();
	PreparedStatement pst = connection.prepareStatement("insert into user_information(user_id,user_name,Mobile_No,Address,Pincode) values(?,?,?,?,?)");
	pst.setLong(1,getPrimaryKey()-3);
	pst.setString(2,firstAdminDetails.getAdminName());
	pst.setLong(3,firstAdminDetails.getMobileNo());
	pst.setString(4, firstAdminDetails.getAddress());
	pst.setLong(5,firstAdminDetails.getPincode());
	pst.executeUpdate();
	ResultSet rs = pst.getGeneratedKeys();
	rs.next();
	return rs.getLong(1);
}


public void updateFirstAdminColumn(long currentUserId,AdminDetail firstAdmin) throws SQLException {
	Connection updateQueryConn = DBConnection.getDBConnetion();
	Statement st = updateQueryConn.createStatement();
	
		st.execute("update user_information set first_admin ='"+firstAdmin.getId()+"-"+firstAdmin.getAdminName()+"' where user_id='"+currentUserId+"'" );
	
}
public boolean validateAdminPassword(ForgotAdminPassword adminPass) throws SQLException{
    Connection con = DBConnection.getDBConnetion();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from admin_info where id='"+adminPass.getadminId()+"' AND mobile_no='"+adminPass.getMobileNo()+"'");
	if(rs.next()) {
		return true;
	}
return false;
}

public String getAdminPassword(ForgotAdminPassword adminPass) throws SQLException {
	Connection con = DBConnection.getDBConnetion();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select adminId from admin_info where id='"+adminPass.getadminId()+"' AND mobile_no='"+adminPass.getMobileNo()+"'");
	rs.next();
	return rs.getString("adminId");
	
}

public void sendNewUserId(long newUserId) {
	try {
	Connection con = DBConnection.getDBConnetion();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select user_name,Mobile_No,password from user_information where user_id='"+newUserId+"'");
	if(rs.next()) {
		//String msg1 = "Hi "+rs.getString("user_name").toString().split(" ")[0]+"%nYour Id : "+newUserId+"\n"+"Password : "+rs.getString("password");
		String msg= "Dear "+rs.getString("user_name").toString().split(" ")[0]+",%nYour new login details%nUser Id : "+newUserId+"%nPassword : "+rs.getString("password")+"%nPlease login www.twentyplus.in%nThanks";
		//System.out.println("msg :: "+msg);
		SendMessage.sendMessageToUser(newUserId, msg, rs.getLong("Mobile_No"));
	}
	}
	catch (Exception e) {
		// TODO: handle exception
	}
}




}	


