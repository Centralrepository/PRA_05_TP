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
@WebServlet("/addMember")
public class AddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(AddUserController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserController() {
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
		String gender= request.getParameter("gender");
		String address = request.getParameter("userAddress");
		
		
		long pincode =Long.parseLong(request.getParameter("pinCode"));
		
		long mobileNo = Long.parseLong(request.getParameter("phoneNo"));
		
		JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
		long creationId =adminTemplate.addMember(userName,gender,address,pincode,mobileNo);
		if(creationId != 1 && creationId != 0) {
			//request.setAttribute("msg", "User added successfully and User Id = "+creationId);
			Map<Long,String> memberData = new TreeMap<>();
			
			memberData.put(creationId,userName);
			String user= userName.split(" ")[0];
			/*String msg="Hi "+user+",%nUser Id : "+creationId+"%nPassword : 123456%nPlease login www.twentyplus.in%nThanks";
			//SendMessage.sendMessageToUser(creationId, msg, mobileNo);
*/			
			request.setAttribute("member_update", "user created successfully with user id : "+creationId);
			logger.info("-----add user created successfully----->>>>"+new Date());
			response.sendRedirect("create_new_user_form.jsp?member_update="+request.getAttribute("member_update")+"&new_user_id="+creationId);
		}
		else {
			request.setAttribute("msg","Something went wrong");
			logger.info("-----add user was not created ----->>>>"+new Date());
			request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	}

}
