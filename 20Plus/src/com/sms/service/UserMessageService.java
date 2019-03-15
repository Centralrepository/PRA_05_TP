package com.sms.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Date;

import org.apache.log4j.Logger;

import com.bean.ForgotUserPassword;
import com.db.template.JDBCUserTemplate;
import com.msg.service.config.MessageServiceConfig;

public class UserMessageService {
	static Logger logger = Logger.getLogger(SendMessage.class);
	public void sendPasswordToUser(ForgotUserPassword forgotUserPassword,String userpassword) {
		
	     JDBCUserTemplate userTemplate = new JDBCUserTemplate();
		 String userMsg= "Dear "+userTemplate.getUserName(forgotUserPassword.getUserId()).split(" ")[0]+",%n"+"Your login details%nUser Id : "+forgotUserPassword.getUserId()+"%nPassword : "+userpassword+"%nPlease login www.twentyplus.in";
		// Construct data
		try {
				    
					String apiKey = "apikey=" + URLEncoder.encode(MessageServiceConfig.getValue("textlocal_apikey"), "UTF-8");
					String message = "&message=" + URLEncoder.encode(userMsg, "UTF-8");
					String sender = "&sender=" + URLEncoder.encode(MessageServiceConfig.getValue("sender_key"), "UTF-8");
					String numbers = "&numbers=" + URLEncoder.encode("+91"+forgotUserPassword.getMobileNo(), "UTF-8");
					
					// Send data
					String data = "https://api.textlocal.in/send/?" + apiKey + numbers + message + sender;
					URL url = new URL(data);
					URLConnection conn = url.openConnection();
					conn.setDoOutput(true);
					
					// Get the response
					BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					String line;
					String sResult="";
					while ((line = rd.readLine()) != null) {
					// Process line...
						sResult=sResult+line+" ";
					}
					rd.close();
				
				} catch (Exception e) {
					logger.warn("------>>> getting sms data in SendMessage  <<<----- exception: "+e.getMessage()+new Date());
				}
	}
	

}
