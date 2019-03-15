package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.Stack;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCUserTemplate;
import com.db.template.UpdateNewMemeberInfo;
import com.model.ParentDetailsModel;
import com.model.UserInformationModel;


@WebServlet("/expireduserapproval")
public class ExpiredUserApprovalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(ExpiredUserApprovalController.class);
    public ExpiredUserApprovalController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
    	logger.info("-----existing user approval controller ----->>>>"+new Date());

		long userId = Long.parseLong(request.getParameter("userid"));
		logger.info("-----getting userid details ----->>>>"+new Date());
		response.sendRedirect("expireduserapproval.jsp?new_user_id="+userId);
	}
}
}