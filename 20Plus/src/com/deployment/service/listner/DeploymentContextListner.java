package com.deployment.service.listner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.db.conf.DBConnection;
import com.msg.service.config.MessageServiceConfig;

/**
 * Application Lifecycle Listener implementation class DeploymentContextListner
 *
 */
@WebListener("application context listener")
public class DeploymentContextListner implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DeploymentContextListner() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
         // TODO Auto-generated method stub
    	Connection con =null;
    	FileInputStream dbFis=null;
    	FileInputStream msgServiceFis=null;
    	Properties dbprops = null;
    	Properties msgprops = null;
    	ServletContext context = event.getServletContext();
    	try {
    		String msgServiceFile = context.getRealPath("") + File.separator+context.getInitParameter("msgservice-config-location");
    		
    		System.out.println("message service file path "+msgServiceFile);
    		msgServiceFis = new FileInputStream(msgServiceFile);
    		msgprops  = new Properties();
    		msgprops.load(msgServiceFis);
    		MessageServiceConfig.createMsgServiceObject(msgprops);
    	}
    	catch (Exception e) {
			// TODO: handle exception
		}
    	
    	try {
    		String dbConfigFile= context.getRealPath("") + File.separator+context.getInitParameter("db-config-location");
    		System.out.println("dbConfiguration file path "+dbConfigFile);
    		dbFis = new FileInputStream(dbConfigFile);
			dbprops = new Properties();
			dbprops.load(dbFis);
			DBConnection.createConnectionObject(dbprops);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    
    	try {
	    	Class.forName(dbprops.getProperty("db.driverClass"));
	    	con=DriverManager.getConnection(dbprops.getProperty("db.url"),dbprops.getProperty("db.user_name"),dbprops.getProperty("db.password"));
	    	if(!userTableExist(con)) {
	    		createUserTable(con);
	    	}
	    	if(!adminTableExist(con)) {
	    		createAdminTable(con);
	    	
	    		insertAdminRecord(con,dbprops);
	    	}
	    	if(!moneyOrderTableExist(con)) {
	    		createMoneyOrderTable(con);
	    	}
	    	
    	}
    	catch (Exception e) {
			// TODO: handle exception
		}
    	
    }
    public void createUserTable(Connection con) {
    	try {
    		String userTableQuery = "CREATE TABLE IF NOT EXISTS user_information(user_id BIGINT NOT NULL AUTO_INCREMENT," + 
					"user_name VARCHAR(100),Mobile_No BIGINT(10),Address VARCHAR(255)," + 
					"Pincode BIGINT(6),Gender VARCHAR(6),admin_added INT(2),nosuper INT(2)," + 
					"LAST INT(2),start_date TIMESTAMP DEFAULT '0000-00-00 00:00:00',"
					+ "expire_date TIMESTAMP DEFAULT '0000-00-00 00:00:00',user_form LONGBLOB,"
					+ "PASSWORD VARCHAR(30),parent VARCHAR(100),super_parent VARCHAR(100),grand_parent VARCHAR(100),"
					+ "No_of_Children INT(2) DEFAULT 84,My_Income BIGINT(20) DEFAULT 0,Approval INT(2) DEFAULT 0,STATUS VARCHAR(30),"
					+ "maxlimit INT(1) DEFAULT 0,moneyorder1 LONGBLOB,moneyorder2 LONGBLOB,moneyorder3 LONGBLOB,first_admin varchar(100),PRIMARY KEY(user_id))";
    		
    		String seqQuery = "ALTER TABLE user_information AUTO_INCREMENT = 10000";
			Statement st=con.createStatement();
			st.addBatch(userTableQuery);
			st.addBatch(seqQuery);
			int[] count=st.executeBatch();
			if(count.length>0) {
				
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
    	
    }
    public boolean userTableExist(Connection con) throws SQLException {
    	DatabaseMetaData dbm = con.getMetaData();
    	ResultSet tables = dbm.getTables(null, null, "user_information", null);
    	return tables.next();
    	
    }
    
    private void createAdminTable(Connection con) {
    	try {
    		String adminTableQuery = "CREATE TABLE admin_info(id BIGINT NOT NULL AUTO_INCREMENT,adminId VARCHAR(35),user_name VARCHAR(100),address VARCHAR(255),pincode BIGINT(10),mobile_no BIGINT(14),PRIMARY KEY(id))";
    		String seqQuery = "ALTER TABLE admin_info AUTO_INCREMENT = 10000";
    		Statement st=con.createStatement();
    		st.addBatch(adminTableQuery);
    		st.addBatch(seqQuery);
    		int[] count=st.executeBatch();
			if(count.length>0) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    private boolean adminTableExist(Connection con) throws SQLException {
    	DatabaseMetaData dbm = con.getMetaData();
    	ResultSet tables = dbm.getTables(null, null, "admin_info", null);
    	return tables.next();
    }
    
    
    private void createMoneyOrderTable(Connection con) {
    	try {
    		String adminTableQuery = "CREATE TABLE moneyorder_id(order_id BIGINT(18))";
			Statement st=con.createStatement();
			if(st.execute(adminTableQuery)) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    private boolean moneyOrderTableExist(Connection con) throws SQLException {
    	DatabaseMetaData dbm = con.getMetaData();
    	ResultSet tables = dbm.getTables(null, null, "moneyorder_id", null);
    	return tables.next();
    }
	
    
    private void insertAdminRecord(Connection con,Properties props) {
    	String admindetails1 = "INSERT INTO admin_info(adminId,user_name,address,pincode,mobile_no) VALUES('sujoy123','Sujoy Kumar Bose','Uphar II, flat no. 201,fisheries lane, seven bungalows, J.P.Rd, Versova, Andheri West, Mumbai',400061,9769622010)";
    	String admindetails2 = "INSERT INTO admin_info(adminId,user_name,address,pincode,mobile_no) VALUES('vikash123','Vikash Tiwari','701-G-2. Bhimashankar CHS. Sector 19. Nerul East. Navi Mumbai',400706,9820213768)";
    	String admindetails3 = "INSERT INTO admin_info(adminId,user_name,address,pincode,mobile_no) VALUES('rachna123','Rachna Tiwari','701-G-2. Bhimashankar CHS. Sector 19. Nerul East. Navi Mumbai',400706,9820213768)";
    	
		try {
			Statement adminBatchQuery = con.createStatement();
			adminBatchQuery.addBatch(admindetails1);
			adminBatchQuery.addBatch(admindetails2);
			adminBatchQuery.addBatch(admindetails3);
			int []counts=adminBatchQuery.executeBatch();
			for(int count : counts) {
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
	
}
