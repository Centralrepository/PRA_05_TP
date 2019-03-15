package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;

@WebServlet(value="/adminLogin")
public class AdminLoginController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(AdminLoginController.class);
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("adminName");
		long password=Long.parseLong(request.getParameter("password"));
		
		JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
		
			if(adminTemplate.adminAuthentication(userName,password)) {
				HttpSession session = request.getSession();
				
				try {
					adminTemplate.getAdminName(password);
					session.setAttribute("admin_name",adminTemplate.getAdminName(password));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				session.setAttribute("isEnabled", true);
				request.setAttribute("msg", "Logged Successfully");
				logger.info("-----admin login successful----->>>>"+new Date());
				response.sendRedirect("adminhome.jsp?approve_msg="+request.getAttribute("msg"));
			}
			else {
				request.setAttribute("msg", "Wrong Credential ! Please try again");
				logger.info("-----admin login failed----->>>>"+new Date());
				response.sendRedirect("admin_login.jsp?login_msg="+request.getAttribute("msg"));
			}
		
	}

}
