package com.controller;

import java.io.IOException;
import java.sql.SQLException;
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

import com.db.template.GetUserDetail;
import com.db.template.JDBCUserTemplate;
import com.model.UserInformationModel;
import com.sms.service.SendMessage;

/**
 * Servlet implementation class AddUserController
 */
@WebServlet("/RequestNewUserIdController")
public class RequestNewUserIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(AddUserController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestNewUserIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("user_id");
		if(sessionname==null) {
			response.sendRedirect("index.jsp");
		}else {
		logger.info("-----calling request new id  ----->>>>"+new Date());
		String userid=(String) session.getAttribute("user_id");
		
		JDBCUserTemplate userTemplate = new JDBCUserTemplate();
		
		try {
			if(userTemplate.userRequestNewId(userid)) {
				long requestId= Long.parseLong(userid.trim());
				UserInformationModel informationModel = GetUserDetail.getDetails(requestId);
					
				informationModel.getUserName();
				String msg = "Dear "+informationModel.getUserName()+"%nyour id "+userid+" has expired.%nPlease wait for your request approval.%nThanks";
			SendMessage.sendMessageToUser(requestId, msg, informationModel.getMobileNo());
					logger.info("----- request for new id sent ----->>>>"+new Date());
					/*request.getRequestDispatcher("user.jsp").include(request,response);*/
					response.sendRedirect("logout.jsp");
			}
			
		} catch (SQLException e) {
			logger.warn("------>>> Request new user id in Request new id Controller  <<<----- exception: "+e.getMessage()+new Date());
			e.printStackTrace();
		}
	}

	}
}
