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
import com.sms.service.SendMessage;

@WebServlet(value="/user")
public class ChangePasswordController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(ChangePasswordController.class);
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionname=(String)session.getAttribute("user_name");
		if(sessionname==null) {
			response.sendRedirect("index.jsp");
		}else {
		
		String userid=(String) session.getAttribute("user_id");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
	
		JDBCUserTemplate userTemplate = new JDBCUserTemplate();
			try {
				if(userTemplate.userChangePassword(userid,oldpassword)) {
					if(userTemplate.userUpdatePassword(userid,newpassword))
					{
						
						request.setAttribute("msg", "Password Updated");
						logger.info("----- password Changed successful ----->>>>"+new Date());
						request.getRequestDispatcher("user.jsp").include(request,response);
					}
					
				}
				else {
					request.setAttribute("msg", "The old password you have entered is incorrect please try again");
					logger.info("-----password entered is not correct ----->>>>"+new Date());
					request.getRequestDispatcher("user.jsp").include(request,response);
				}
			} catch (SQLException e) {
				logger.warn("------>>> Changing password in ChangePasswordController  <<<----- exception: "+e.getMessage()+new Date());
				e.printStackTrace();
			}
	}
}
}