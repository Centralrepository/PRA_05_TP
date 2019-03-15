package com.msg.service.config;

import java.util.Date;
import java.util.Properties;
import org.apache.log4j.Logger;


public class MessageServiceConfig {
	static Properties msgServiceObj = null;
	static Logger logger = Logger.getLogger(MessageServiceConfig.class);
	public static void createMsgServiceObject(Properties msgServiceObj) {
			try {
				MessageServiceConfig.msgServiceObj =msgServiceObj;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.warn("------>>> exception in creating connection object in DBconnection <<<----- exception: "+e.getMessage()+new Date());
			}
		}
	
	public static String getValue(String key) {
		return MessageServiceConfig.msgServiceObj.getProperty(key);
	}
}
