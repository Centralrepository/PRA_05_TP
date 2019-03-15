package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;

@WebServlet(value="/verifyOrder")
public class VerifyMoneyorderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(VerifyMoneyorderController.class);
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		logger.info("-----Verify Money order  ----->>>>"+new Date());
		String moneyorder = request.getParameter("moneyorder");
		JDBCAdminTemplate verifymoneyorder = new JDBCAdminTemplate();
		if(verifymoneyorder.saveMoneyOrderId(moneyorder))
		{
			request.setAttribute("msg", "Verified");
			logger.info("-----moneyorder verified ----->>>>"+new Date());
			request.getRequestDispatcher("adminhome.jsp").include(request,response);	
		}
		else
		{
			request.setAttribute("msg", "Not Verified");
			logger.info("-----moneyorder is not verified ----->>>>"+new Date());
			request.getRequestDispatcher("adminhome.jsp").include(request,response);	
		}
		
	}

}
