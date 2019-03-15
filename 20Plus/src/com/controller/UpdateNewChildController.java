package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;
import com.model.AdminDetail;

import com.model.UserInformationModel;

/**
 * Servlet implementation class AddChildMemberController
 */
@WebServlet("/UpdateNewChildController")
@MultipartConfig(maxFileSize = 16177215)
public class UpdateNewChildController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(UpdateNewChildController.class);
    
    public UpdateNewChildController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
			logger.info("-----Update new Child  ----->>>>"+new Date());
			
			long currentUserId = Long.parseLong(request.getParameter("parent_name3").split("-")[0]);
			int existence = Integer.parseInt(request.getParameter("exist0"));
			JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
			AdminDetail firstAdminDetails = new AdminDetail();
			
			if(existence==1) {
				firstAdminDetails.setId(Long.parseLong(request.getParameter("parent_id0")));
				firstAdminDetails.setAdminName(request.getParameter("parent_name0"));
				firstAdminDetails.setAddress(request.getParameter("parent_address0"));
				firstAdminDetails.setPincode(Long.parseLong(request.getParameter("parent_pincode0")));
				firstAdminDetails.setMobileNo(Long.parseLong(request.getParameter("parent_mobile_no0")));
			}
			else if (existence==0) {
				firstAdminDetails.setAdminName(request.getParameter("parent_name0"));
				firstAdminDetails.setAddress(request.getParameter("parent_address0"));
				firstAdminDetails.setPincode(Long.parseLong(request.getParameter("parent_pincode0")));
				firstAdminDetails.setMobileNo(Long.parseLong(request.getParameter("parent_mobile_no0")));
				try {
					firstAdminDetails.setId(adminTemplate.createFirstAdmin(firstAdminDetails));
				} catch (SQLException e) {
					
					
				}
			}
			
			
			
			
			// for first_admin
			
			
			
			/*end of first admin*/
			
			List<UserInformationModel> usersDetailList = new LinkedList<>();
			
			
			
			
			
			for(int i=1;i<3;i++) {
					UserInformationModel userInformationModel1 = new UserInformationModel();
					userInformationModel1.setUserName(request.getParameter("parent_name"+i));
					userInformationModel1.setAddress(request.getParameter("parent_address"+i));
					userInformationModel1.setPincode(Long.parseLong(request.getParameter("parent_pincode"+i)));
					userInformationModel1.setMobileNo(Long.parseLong(request.getParameter("parent_mobile_no"+i)));
					usersDetailList.add(userInformationModel1);
			}
			
			
			//adminTemplate.createNewUserService(usersDetailList,currentUserId);
			
			
			if(adminTemplate.ApproveMember(currentUserId)){
			    adminTemplate.createNewUserService(usersDetailList,currentUserId);
			    try {
					adminTemplate.updateFirstAdminColumn(currentUserId,firstAdminDetails);
				} catch (SQLException e) {
				}
			    
			    
				request.setAttribute("approve_msg", "User approved successfully");
				logger.info("-----User  approved successfully----->>>>"+new Date());
			}
			else {
				request.setAttribute("approve_msg", "User not confirmed");
				logger.info("-----User  is not confirmed----->>>>"+new Date());
			} 
			//request.getRequestDispatcher("adminhome.jsp").forward(request, response);
			response.sendRedirect("adminhome.jsp?approve_msg="+request.getAttribute("approve_msg"));
		}
		
		
		

	}
	
	
}
		
		
				
				
				
				
				
				
				
	