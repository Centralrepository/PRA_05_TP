package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.Stack;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;
import com.db.template.UpdateNewMemeberInfo;
import com.model.UserInformationModel;

/**
 * Servlet implementation class CreateFormController
 */
@WebServlet("/ExpiredUserUpdateController")
public class ExpiredUserUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(ExpiredUserUpdateController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpiredUserUpdateController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
		Stack<UserInformationModel> listOfMemeber = new Stack<>();
		
		long addedUserId = Long.parseLong(request.getParameter("user_id"));
		
		for(int i=0;i<=2;i++) {
			UserInformationModel informationModel = new UserInformationModel();
			informationModel.setUserName(request.getParameter("user_name_row"+i));
			informationModel.setAddress(request.getParameter("user_address_row"+i));
			informationModel.setPincode(Long.parseLong(request.getParameter("user_pincode_row"+i)));
			informationModel.setMobileNo(Long.parseLong(request.getParameter("user_mobile_no_row"+i)));
			listOfMemeber.push(informationModel);
		}
		
		if(!listOfMemeber.isEmpty()) {
			UpdateNewMemeberInfo info = new UpdateNewMemeberInfo();
			try {
				info.addExistingUserParentMember(listOfMemeber,addedUserId);
				sendMessageToExpiredUser(addedUserId);
			} catch (SQLException e) {
				logger.warn("------>>> getting data in ExpiredUserUpdate controller <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("adminhome.jsp?approve_msg=Expired user form updated successfully");
		logger.info("<<<----User form was updated---->>>"+new Date());
		request.getRequestDispatcher("adminhome.jsp").include(request, response);
	}
	}
	private void sendMessageToExpiredUser(long newUserId) {
		JDBCAdminTemplate  sendMsgobj = new JDBCAdminTemplate();
		sendMsgobj.sendNewUserId(newUserId);
	}
}
