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

import com.db.template.JDBCUserTemplate;

@WebServlet(value="/userlogin")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(UserLoginController.class);
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		logger.info("----- user Login controller  ----->>>>"+new Date());
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		
		JDBCUserTemplate userTemplate = new JDBCUserTemplate();
		HttpSession session = request.getSession();
			try {
				if(userTemplate.userAuthentication(userid,password,session)) {
					request.setAttribute("msg", "Logged Successfully");
					logger.info("-----user login was successful  ----->>>>"+new Date());
					session.setAttribute("user_id", userid);
					session.setAttribute("enabled", true);
					response.sendRedirect("user.jsp?msg="+request.getAttribute("msg"));
				}
				else {
					request.setAttribute("msg", "Please enter valid username and password");
					logger.info("-----user login failed  ----->>>>"+new Date());
					//request.getRequestDispatcher("user_login.jsp").include(request,response);
					response.sendRedirect("user_login.jsp?login_msg="+request.getAttribute("msg"));
				}
			} catch (SQLException e) {
				logger.warn("------>>> User login failed in UserLoginController controller <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
