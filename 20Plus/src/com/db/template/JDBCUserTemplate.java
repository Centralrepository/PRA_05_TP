package com.db.template;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;

import com.bean.ForgotUserPassword;
import com.db.conf.DBConnection;
import com.model.ParentDetailsModel;
import com.model.UserInformationModel;

public class JDBCUserTemplate {
	static Logger logger = Logger.getLogger(JDBCUserTemplate.class);
	
	
	public boolean userLogin(String userid,String password) throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from user_information where user_id='"+userid+"' AND password='"+password+"'");
		if(rs.next()) {
			return true;
		}
	return false;
	}
	
	public boolean userAuthentication(String userId,String password,HttpSession session) throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		Statement st = con.createStatement();
	
		ResultSet rs = null;
		try {
			rs = st.executeQuery("select user_name from user_information where user_id='"+userId+"' AND password='"+password+"' AND Approval =1");
		} catch (SQLException e) {
			logger.warn("------>>> getting data in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs.next()) {
			session.setAttribute("user_name", rs.getString("user_name"));
			return true;
		}
	return false;
	}
	
	public boolean userdetailsshow(String userId) throws SQLException {
		Connection con = DBConnection.getDBConnetion();
		Statement st = con.createStatement();
	
		ResultSet rs = null;
		try {
			rs = st.executeQuery("select * from user_information where user_id='"+userId+"'");
		} catch (SQLException e) {
			logger.warn("------>>> getting user info in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs.next()) {
			return true;
		}
	return false;
	}
	
	
	
	//Change Password for USER
		public boolean userChangePassword(String userid,String oldpassword) throws SQLException {
		
			Connection con = DBConnection.getDBConnetion();
			Statement st = con.createStatement();
			ResultSet rs = null;
			try {
				rs = st.executeQuery("select password from user_information where user_id='"+userid+"' AND password='"+oldpassword+"'");
				
			
			} catch (SQLException e) {
				logger.warn("------>>> getting password in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				
			}
			if(rs.next()) {
			
				return true;
			}
		return false;
		}
		
		
		
		
	public boolean userUpdatePassword(String userid,String newpassword) throws SQLException {
		
			Connection con = DBConnection.getDBConnetion();
			Statement st = con.createStatement();
			
			try {
				int cond=st.executeUpdate("update user_information set password = '"+newpassword+"' where user_id='"+userid+"'");
				if(cond==1)
					return true;
				else
					return false;
				
			} catch (SQLException e) {
				logger.warn("------>>> upadting password in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
			finally {
				
			}
			return false;
	}
	
	//Display the member details to users not is use more
	public Map<Long, String> getUserSuperMemeberDetails(long userId,Map<Long,String> map) {
		
		Connection con = DBConnection.getDBConnetion();
				
		try {
			PreparedStatement pst = con.prepareStatement("select parent,super_parent from user_information where user_id= ?");
			pst.setLong(1, userId);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				long parentId = Long.parseLong(rs.getString("parent").split("-")[1]);
				String parentName = rs.getString("parent").split("-")[0];
				map.put(parentId, parentName);
				
				if(!rs.getString("super_parent").isEmpty()) {
					long superParentId = Long.parseLong(rs.getString("super_parent").split("-")[1]);
					String superParentName = rs.getString("super_parent").split("-")[0];
					map.put(superParentId, superParentName);
				}
				
			}
			
			
		}
		catch (Exception e) {
			logger.warn("------>>> getting member details in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			// TODO: handle exception
		}
		return map;
	}

	public String getMemberDetails(long userId,Map<Long,ParentDetailsModel> map) {
		Connection con = DBConnection.getDBConnetion();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select user_name,Mobile_No,Address,Pincode,parent,super_parent,grand_parent from user_information where user_id = '"+userId+"'");
			ParentDetailsModel parentDetails = new ParentDetailsModel();
		if(rs.next()) {
			parentDetails.setParentId(userId);
			parentDetails.setParentName(rs.getString("user_name"));
			parentDetails.setAddress(rs.getString("Address"));
			parentDetails.setMobileNo(rs.getLong("Mobile_No"));
			parentDetails.setPincode(rs.getLong("Pincode"));
			map.put(userId, parentDetails);
		
			if(rs.getString("parent")!=null && !rs.getString("parent").isEmpty()) {
				getParentDetails(rs.getString("parent"), map);
			
			}
			if(rs.getString("super_parent")!=null && !rs.getString("super_parent").isEmpty()) {
				getParentDetails(rs.getString("super_parent"), map);
			}
			
		}
		return rs.getString("user_name");
			
		} catch (SQLException e) {
			logger.warn("------>>> getting data in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	public String getUserName(long userId,Map<Long,ParentDetailsModel> map) {
		Connection con = DBConnection.getDBConnetion();
	
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select user_name,Mobile_No,Address,Pincode,parent,super_parent,grand_parent from user_information where user_id = '"+userId+"'");
			ParentDetailsModel parentDetails = new ParentDetailsModel();
		if(rs.next()) {
			parentDetails.setParentId(userId);
			parentDetails.setParentName(rs.getString("user_name"));
			parentDetails.setAddress(rs.getString("Address"));
			parentDetails.setMobileNo(rs.getLong("Mobile_No"));
			parentDetails.setPincode(rs.getLong("Pincode"));
			map.put(userId, parentDetails);
		
			if(rs.getString("parent")!=null&& !rs.getString("parent").isEmpty()) {
				
				getParentDetails(rs.getString("parent"), map);
				
			}
			if(rs.getString("super_parent")!=null&& !rs.getString("super_parent").isEmpty()) {
				
				getParentDetails(rs.getString("super_parent"), map);
			}
		}
		return rs.getString("user_name");
			
		} catch (SQLException e) {
			logger.warn("------>>> getting data in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			e.printStackTrace();
		}
		return "";
	}
	// Get parent details
	public void getParentDetails(String parent,Map<Long,ParentDetailsModel> map) {

		long parentId = Long.parseLong(parent.split("-")[0]);
		Connection con = DBConnection.getDBConnetion();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select user_name,Mobile_No,Address,Pincode from user_information where user_id = '"+parentId+"'");
			ParentDetailsModel parentDetails = new ParentDetailsModel();
			if(rs.next()) {
				parentDetails.setParentId(parentId);
				parentDetails.setParentName(rs.getString("user_name"));
				parentDetails.setAddress(rs.getString("Address"));
				parentDetails.setMobileNo(rs.getLong("Mobile_No"));
				parentDetails.setPincode(rs.getLong("Pincode"));
				map.put(parentId, parentDetails);
			
			}
		}catch (Exception e) {
			logger.warn("------>>> getting parent details in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			
		}
	}
	
	
	//  For adding 4 new users
	
	public List<Long> addUsersService(List<UserInformationModel> lists) {
		List<Long> primaryIds = new ArrayList<>();
		for(UserInformationModel userDetails : lists) {
			Timestamp startDate = new Timestamp(new Date().getTime());
			   Calendar cal = Calendar.getInstance();
		       cal.setTimeInMillis(startDate.getTime());
		       cal.setTimeInMillis(startDate.getTime());
		       cal.add(Calendar.DAY_OF_MONTH, 90);
		       Timestamp expireDate = new Timestamp(cal.getTime().getTime());
			   userDetails.setStartDateTime(startDate);
			   userDetails.setEndDateTime(expireDate);
			  addUsersDb(userDetails,primaryIds);
		}
		return primaryIds;
	} 
	
	public List<Long> addUsersDb(UserInformationModel informationModel,List<Long> primaryIds) {
		//informationModel.setStartDateTime(startDateTime);
		Connection con = DBConnection.getDBConnetion();
		try {
			PreparedStatement preparedStatement = con.prepareStatement("insert into user_information(user_name,Mobile_No,Address,Pincode,Gender,start_date,expire_date,parent,super_parent,grand_parent,password,first_admin) value(?,?,?,?,?,?,?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, informationModel.getUserName());
			preparedStatement.setLong(2, informationModel.getMobileNo());
			preparedStatement.setString(3, informationModel.getAddress());
			preparedStatement.setLong(4, informationModel.getPincode());
			preparedStatement.setString(5,informationModel.getGender());
			preparedStatement.setTimestamp(6,informationModel.getStartDateTime());
			preparedStatement.setTimestamp(7,informationModel.getEndDateTime());
			preparedStatement.setString(8, informationModel.getParentInfo());
			preparedStatement.setString(9, informationModel.getSuperParentInfo());
			preparedStatement.setString(10, informationModel.getGrandParent());
			preparedStatement.setString(11, "123456");
			preparedStatement.setString(12, informationModel.getFirstAdmin());
			preparedStatement.executeUpdate();
			ResultSet rs = preparedStatement.getGeneratedKeys();
			if (rs.next()) {
			primaryIds.add(rs.getLong(1));
			}
			
		}
		catch (Exception e) {
			logger.warn("------>>> adding users  in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
			e.printStackTrace();
		}
		return primaryIds;
		
	}
	
	//Get Member Details to show the user
		public  void getUserDetails(long userId) {
			Connection con = DBConnection.getDBConnetion();
			
			try {
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select user_name,Address,Pincode,Mobile_No,Parent_id from user_information where user_id = '"+userId+"'");
				rs.next();
					String username = rs.getString("user_name");
					String address = rs.getString("Address");
					String pincode = rs.getString("Pincode");
					String mobileno = rs.getString("Mobile_No");
					Long parentid = rs.getLong("Parent_id");
			
			JDBCUserTemplate usertemplate=new JDBCUserTemplate();
			usertemplate.getUserDetails(parentid);
			} catch (SQLException e) {
				logger.warn("------>>> getting member data in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		public void fileUploadToUser(InputStream inputStream,InputStream moneyOrder1,InputStream moneyOrder2,InputStream moneyOrder3,long userId) {
			
			Connection conn = DBConnection.getDBConnetion();
			 try {
            // constructs SQL statement
            String sql = "update user_information set maxlimit=?,user_form=?,moneyorder1=?,moneyorder2=?,moneyorder3=? where user_id='"+userId+"'";
            PreparedStatement statement = conn.prepareStatement(sql);
           
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
            	statement.setInt(1,1);
                statement.setBlob(2, inputStream);
                statement.setBlob(3, moneyOrder1);
                statement.setBlob(4, moneyOrder2);
                statement.setBlob(5, moneyOrder3);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
               
            }
		}
		catch (SQLException ex) {
			logger.warn("------>>> updating data in JDBCUserTemplate  <<<----- exception: "+ex.getMessage()+new Date());
          //  message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            
		}
		
	}
		
		
		//My Network creation JSON array for current user
				public String getChildrenAsJsonString(long userId, String userName)
				{
					JSONArray response = new JSONArray();
					int level = 0;
					JSONArray childJsonArray = new JSONArray();
					childJsonArray.put(userName+" ("+userId+")");
					childJsonArray.put("");
					response.put(childJsonArray);
					JSONArray children = this.getChildrenRecursive(userId, userName, level);
					
					if(children.length() > 0)
					{
						response = this.mergeJsonArray(response, children);
					}
						
					
					return response.toString();
				}
				//My Network creation JSON array for Childrens
				private JSONArray getChildrenRecursive(long userId, String userName, int level)
				{
					JSONArray response = new JSONArray();
					if(level > 2)
					{
						return response;
					}
					Connection con = DBConnection.getDBConnetion();
					try {
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select user_id,user_name from user_information where parent = '"+userId+"-"+userName+"'");
						while(rs.next())
						{
							String childUserName = rs.getString("user_name");
							long childUserId = rs.getLong("user_id");
							JSONArray childJsonArray = new JSONArray();
							childJsonArray.put(childUserName+" ("+childUserId+")");
							childJsonArray.put(userName+" ("+userId+")");
							response.put(childJsonArray);
							JSONArray children = this.getChildrenRecursive(childUserId, childUserName, level+1);
							if(children.length() > 0)
							{
								response = this.mergeJsonArray(response, children);
							}
						}
						
					}
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					return response;
				}
				//My Network - Copy the Children array content to main array
				protected JSONArray mergeJsonArray(JSONArray array1, JSONArray array2)
				{
					for(int i = 0; i < array2.length(); i++)
					{
						try {
							array1.put(array2.getJSONArray(i));
						} catch (JSONException e) {
							e.printStackTrace();
						}
					}
					return array1;
				}
				
				
				public String getExpiredUserName(long userId,Map<Long,ParentDetailsModel> map) {
					Connection con = DBConnection.getDBConnetion();
		
					try {
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select user_name,Mobile_No,Address,Pincode,parent,super_parent,grand_parent from user_information where user_id = '"+userId+"'");
						ParentDetailsModel parentDetails = new ParentDetailsModel();
					if(rs.next()) {
						parentDetails.setParentId(userId);
						parentDetails.setParentName(rs.getString("user_name"));
						parentDetails.setAddress(rs.getString("Address"));
						parentDetails.setMobileNo(rs.getLong("Mobile_No"));
						parentDetails.setPincode(rs.getLong("Pincode"));
						map.put(userId, parentDetails);
					
						if(rs.getString("parent")!=null&& !rs.getString("parent").isEmpty()) {
							
							getParentDetails(rs.getString("parent"), map);
							
						}
						if(rs.getString("super_parent")!=null&& !rs.getString("super_parent").isEmpty()) {
							
							getParentDetails(rs.getString("super_parent"), map);
						}
					}
					return rs.getString("user_name");
						
					} catch (SQLException e) {
						logger.warn("------>>> getting data in JDBCUserTemplate  <<<----- exception: "+e.getMessage()+new Date());
						e.printStackTrace();
					}
					return "";
				}
			
				public boolean validateUserPassword(ForgotUserPassword userPass) throws SQLException{
				    Connection con = DBConnection.getDBConnetion();
					Statement st = con.createStatement();
					ResultSet rs=st.executeQuery("select * from user_information where user_id='"+userPass.getUserId()+"' AND Mobile_No='"+userPass.getMobileNo()+"'");
					if(rs.next()) {
						return true;
					}
				return false;
				}
				
				public String getUserPassword(ForgotUserPassword userPass) throws SQLException {
					Connection con = DBConnection.getDBConnetion();
					Statement st = con.createStatement();
					ResultSet rs=st.executeQuery("select password from user_information where user_id='"+userPass.getUserId()+"' AND Mobile_No='"+userPass.getMobileNo()+"'");
					rs.next();
					return rs.getString("password");
					
				}
				public String getUserName(long userId) {
					Connection connection = DBConnection.getDBConnetion();
					Statement stq;
					try {
						stq = connection.createStatement();
					
					ResultSet rs = stq.executeQuery("select user_name from user_information where user_id='"+userId+"'");
					rs.next();
					return rs.getString("user_name");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					return "";
				}
					
					
			}
				
				public boolean userRequestNewId(String userid) throws SQLException {
					Connection con = DBConnection.getDBConnetion();
					Statement st = con.createStatement();
					ResultSet rs1=st.executeQuery("select * from user_information where user_id='"+userid+"'");
					
					if(rs1.next()) {
						Long user_id = Long.parseLong(rs1.getString("user_id"));
						String user_name = rs1.getString("user_name");
						Long mobile_no = Long.parseLong(rs1.getString("Mobile_No"));
						String address = rs1.getString("Address");
						Long pincode = Long.parseLong(rs1.getString("Pincode"));
						String gender = rs1.getString("Gender");
						
						Timestamp startDate = new Timestamp(new Date().getTime());
							   Calendar cal = Calendar.getInstance();
						       cal.setTimeInMillis(startDate.getTime());
						       cal.setTimeInMillis(startDate.getTime());
						       cal.add(Calendar.DAY_OF_MONTH, 90);
						       Timestamp expireDate = new Timestamp(cal.getTime().getTime());
						       
						        PreparedStatement pst = con.prepareStatement("insert into user_information(user_name,Gender,Address,Pincode,Mobile_No,password,Approval,start_date,expire_date) value(?,?,?,?,?,?,?,?,?)");
								pst.setString(1, user_name);
								pst.setString(2, gender);
								pst.setString(3, address);
								pst.setLong(4, pincode);
								pst.setLong(5, mobile_no);
								pst.setString(6, user_name+(int )(Math. random() * 50 + 1));
								pst.setInt(7, 4);
								pst.setTimestamp(8, startDate);
								pst.setTimestamp(9, expireDate);
								pst.executeUpdate();
								if(pst.getGeneratedKeys().next()) {
								updateUserPreviousDetails(user_id);
									
								}
						
						return true;
				}
				return false;
          }
				private void updateUserPreviousDetails(long user_id) throws SQLException {
					Connection updCon = DBConnection.getDBConnetion();
					Statement updStmt = updCon.createStatement();
					String query1 = "update user_information set Status = '"+null+"', Approval = 2 where user_id='"+user_id+"'";
					updStmt.addBatch(query1);
					updStmt.executeBatch();
				}
				
		}

