package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;

@WebServlet("/approved")
public class UserApprovalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(UserApprovalController.class);
 
    public UserApprovalController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
		logger.info("-----calling UserApprovalController  ----->>>>"+new Date());
		JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
		long usid = Long.parseLong(request.getParameter("userid"));
			
			if(adminTemplate.ApproveMember(usid)){
				request.setAttribute("approve_msg", "User approved successfully");
				logger.info("-----User  approved successfully by admin----->>>>"+new Date());
			}
			else {
				request.setAttribute("approve_msg", "User not confirmed");
				logger.info("-----User  was not confirmed ----->>>>"+new Date());
			}
			response.sendRedirect("adminhome.jsp?member_update="+request.getAttribute("approve_msg"));
		}

	
	}
}
