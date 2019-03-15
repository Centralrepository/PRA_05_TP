package com.datetime;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;

import com.controller.AddUserController;

public class GetAfter_30_Days_DateTime {
	static Logger logger = Logger.getLogger(GetAfter_30_Days_DateTime.class);

	public static Timestamp getAfter30DaysTimeStams(Timestamp timestamp) {
		logger.info("-----GetAfter_30_Days_DateTime ----->>>>"+new Date());
		Calendar cal = Calendar.getInstance();
	       cal.setTimeInMillis(timestamp.getTime());
	       cal.setTimeInMillis(timestamp.getTime());
	       cal.add(Calendar.DAY_OF_MONTH, 90);
	       timestamp = new Timestamp(cal.getTime().getTime());
		return timestamp;
		
	}
}
