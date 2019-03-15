package com.db.conf;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.controller.AddChildMemberController;



public class DBConnection {
	static Logger logger = Logger.getLogger(AddChildMemberController.class);
	static Properties propsObj=null;
	static Connection con=null;
	
	
	public static void createConnectionObject(Properties props) {
		try {
			propsObj = props;
			Class.forName(props.getProperty("db.driverClass"));
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			logger.warn("------>>> creating connection object in DBconnection <<<----- exception: "+e.getMessage()+new Date());	
		}
		try {
			con=DriverManager.getConnection(props.getProperty("db.url"),props.getProperty("db.user_name"),props.getProperty("db.password"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logger.warn("------>>> exception in creating connection object in DBconnection <<<----- exception: "+e.getMessage()+new Date());
		}
	}
	public static Connection getDBConnetion() {
		
			try {
					if(con == null||con.isClosed()) {
						createConnectionObject(propsObj);
						//con=DriverManager.getConnection(propsObj.getProperty("db.url"),propsObj.getProperty("db.user_name"),propsObj.getProperty("db.password"));
					}
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return con;
	}
}
