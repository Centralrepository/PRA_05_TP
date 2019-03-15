package background.jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.StatefulJob;
import org.slf4j.LoggerFactory;

import com.controller.AddChildMemberController;
import com.db.conf.DBConnection;
import com.sms.service.SendMessage;

@SuppressWarnings("deprecation")
public class MyJob implements StatefulJob{
	static Logger logger = Logger.getLogger(AddChildMemberController.class);
	@Override
	  public void execute(JobExecutionContext context) throws JobExecutionException {
	    try {

	    
	      Connection con = DBConnection.getDBConnetion();
			Statement st = con.createStatement();
		
			ResultSet rs=st.executeQuery("select * from user_information where maxlimit = 1 or Approval=1");
			Timestamp current_date = new Timestamp(new Date().getTime());
			
			while(rs.next())
			{
				
				
					Long user_id = Long.parseLong(rs.getString("user_id"));
					long receiverMobileNo = rs.getLong("Mobile_No");
					Long my_income = Long.parseLong(rs.getString("My_Income"));
					 //  Timestamp current_date = new Timestamp(new Date().getTime());
					   Timestamp start_date = rs.getTimestamp("start_date");
					   Calendar cal = Calendar.getInstance();
				       cal.setTimeInMillis(start_date.getTime());
				       cal.setTimeInMillis(start_date.getTime());
				       cal.add(Calendar.DAY_OF_MONTH, 90);
				       Timestamp expire_date = new Timestamp(cal.getTime().getTime());
				     
				       Calendar cale = Calendar.getInstance();
				       cale.setTimeInMillis(start_date.getTime());
				       cale.setTimeInMillis(start_date.getTime());
				       cale.add(Calendar.DAY_OF_MONTH, 89);
				       Timestamp expire_msgsending_date = new Timestamp(cale.getTime().getTime());
				       
				       
				       System.out.println("curr : "+current_date+"    expire : "+expire_msgsending_date);
				      if(current_date.equals(expire_msgsending_date) ||  current_date.after(expire_msgsending_date))
				       {
				    	   long diff=(current_date.getTime()-expire_msgsending_date.getTime())/(60*60 * 1000);
					       System.out.println(diff+1);
				           if((diff+1)<=48&&(diff+1)>=24) {
				        	   String msg = "Dear "+rs.getString("user_name").split(" ")[0]+",%nYour membership will expire on "+expire_date.toString().split(" ")[0]+"%nThe new id and password would be sent to you%nsoon.";
				        	   SendMessage.sendMessageToUser(user_id, msg, receiverMobileNo);
				           }
				    	
				       }
				       
				      System.out.println("User id : "+current_date+"           "+"expire_date  ::"+expire_date);
					if(current_date.equals(expire_date) ||  current_date.after(expire_date) || my_income>=42000)
					{
						   System.out.println("User id : "+current_date+"           "+"expire_date  ::"+expire_date);
						updateWithNewId(user_id);
					} 
				
			}
	    }
	    catch (Exception ex) {
	    	logger.warn("------>>> exception in giving conditions for the user in myjob <<<----- exception: "+ex.getMessage()+new Date());
		      
		    }
			
	}
		private void updateWithNewId(long user_id)
		{	
			try {
				Connection con1 = DBConnection.getDBConnetion();
				Statement st1 = con1.createStatement();
				ResultSet rs1=st1.executeQuery("select user_name,Mobile_No,Address,Pincode,Gender,start_date,expire_date from user_information where user_id='"+user_id+"'");
				if(rs1.next()) {
				String user_name = rs1.getString("user_name");
				Long mobile_no = Long.parseLong(rs1.getString("Mobile_No"));
				String address = rs1.getString("Address");
				Long pincode = Long.parseLong(rs1.getString("Pincode"));
				String gender = rs1.getString("Gender");
				updateUserDetail(user_id,user_name);
					   Timestamp startDate = new Timestamp(new Date().getTime());
					   Calendar cal = Calendar.getInstance();
				       cal.setTimeInMillis(startDate.getTime());
				       cal.setTimeInMillis(startDate.getTime());
				       cal.add(Calendar.DAY_OF_MONTH, 90);
				       Timestamp expireDate = new Timestamp(cal.getTime().getTime());
				       
				        PreparedStatement pst = con1.prepareStatement("insert into user_information(user_name,Gender,Address,Pincode,Mobile_No,password,Approval,start_date,expire_date) value(?,?,?,?,?,?,?,?,?)");
						pst.setString(1, user_name);
						pst.setString(2, gender);
						pst.setString(3, address);
						pst.setLong(4, pincode);
						pst.setLong(5, mobile_no);
						pst.setString(6, user_name+(int )(Math. random() * 50 + 1));
						pst.setInt(7, 3);
						pst.setTimestamp(8, startDate);
						pst.setTimestamp(9, expireDate);
						pst.executeUpdate();
						pst.getGeneratedKeys();
				}
			}
	    catch (Exception ex) {
	   
	      logger.warn("------>>> exception in updating user data with new Id in myjob <<<----- exception: "+ex.getMessage()+new Date());
	   
	    }
	}
		
		
		private void updateUserDetail(long user_id,String user_name) throws SQLException {
			Connection updCon = DBConnection.getDBConnetion();
			Statement updStmt = updCon.createStatement();
			String query1 = "update user_information set Status = '"+null+"', Approval = 2 where user_id='"+user_id+"'";
			updStmt.addBatch(query1);
			updStmt.executeBatch();
		}
}
	

