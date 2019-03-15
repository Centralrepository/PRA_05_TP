package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;
import com.sms.service.SendMessage;

/**
 * Servlet implementation class AddUserController
 */
@WebServlet("/addnewAdmin")
public class AddNewAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(AddUserController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
		logger.info("-----calling add user  ----->>>>"+new Date());
		
		String userName= request.getParameter("userName");
		String address = request.getParameter("userAddress");
		
		
		long pincode =Long.parseLong(request.getParameter("pinCode"));
	
		long mobileNo = Long.parseLong(request.getParameter("phoneNo"));
		
		JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
		String adminPassword = userName.split(" ")[0]+"123";
		long creationId =adminTemplate.addnewadmin(userName,address,pincode,mobileNo,adminPassword);
		if(creationId != 1 && creationId != 0) {
			
			String message = "Hi "+userName+"\n"+"Your Id : "+creationId+" \n "+" Password : "+adminPassword+"\n"
			+"Please click here "+request.getScheme()+"://"+request.getServerName()+"/admin_login.jsp";
			SendMessage.sendMessageToadmin("",userName, mobileNo, message);
			request.setAttribute("member_update", "Admin added successfully");
			response.sendRedirect("adminhome.jsp?member_update="+request.getAttribute("member_update")+"&new_user_id="+creationId);
			
		}
		else {
			request.setAttribute("msg","Something went wrong");
			request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
			
		}
		
	}

	}
}
