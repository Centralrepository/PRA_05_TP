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

import com.db.template.GetUserDetail;
import com.db.template.UpdateNewMemeberInfo;
import com.model.UserInformationModel;
import com.sms.service.SendMessage;

/**
 * Servlet implementation class CreateFormController
 */
@WebServlet("/CreateFormController")
public class CreateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(CreateFormController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFormController() {
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
				info.addParentMember(listOfMemeber,addedUserId);
				if(info.updateUserApprovalStatus(addedUserId)>0) {
					UserInformationModel informationModel =GetUserDetail.getDetails(addedUserId);
					String msg="Hi "+informationModel.getUserName().split(" ")[0]+",%nUser Id : "+addedUserId+"%nPassword : 123456%nPlease login www.twentyplus.in%nThanks";
					SendMessage.sendMessageToUser(addedUserId, msg, informationModel.getMobileNo());
				}
			} catch (SQLException e) {
				logger.warn("------>>> getting data in CreateFormController controller <<<----- exception: "+e.getMessage()+new Date());
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("<<<----User form was updated---->>>"+new Date());
		response.sendRedirect("adminhome.jsp?approve_msg=User added successfully");
		
		//request.getRequestDispatcher("adminhome.jsp").include(request, response);
	}
	}
}
