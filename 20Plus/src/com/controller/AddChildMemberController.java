package com.controller;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;
import org.apache.log4j.Logger;
import com.db.template.JDBCUserTemplate;
import com.model.UserInformationModel;

/**
 * Servlet implementation class AddChildMemberController
 */
@WebServlet("/AddChildMemberController")
@MultipartConfig(maxFileSize = 16177215)
public class AddChildMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(AddChildMemberController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddChildMemberController() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("user_name");
		if(sessionname==null) {
			response.sendRedirect("index.jsp");
		}else {
		logger.info("-----calling add child member ----->>>>"+new Date());
		String parentInfo = null;
		String superParentInfo = null;
		String grandParentInfo = null;
		Part filePart=null;
		InputStream userFormInputStream=null;
		InputStream moneyOrderInputStream1=null;
		InputStream moneyOrderInputStream2=null;
		InputStream moneyOrderInputStream3=null;

		try {
			parentInfo = request.getParameter("parent_name3");
}catch (NullPointerException e) {
	logger.warn("------>>> getting data in AddChildMemberController controller <<<----- exception: "+e.getMessage()+new Date());
			
		}
		try {
			
			superParentInfo =request.getParameter("parent_name2");
}catch (NullPointerException e) {
	logger.warn("------>>> getting data in AddChildMemberController controller <<<----- exception: "+e.getMessage()+new Date());
		}
		try {
			
			grandParentInfo =request.getParameter("parent_name1");
		}catch (NullPointerException e) {
			logger.warn("------>>> getting data in AddChildMemberController controller <<<----- exception: "+e.getMessage()+new Date());
			}
		try {
			filePart = request.getPart("user_form");
			userFormInputStream = filePart.getInputStream();
			filePart = request.getPart("money_order1");
			moneyOrderInputStream1 = filePart.getInputStream();
			filePart = request.getPart("money_order2");
			moneyOrderInputStream2 = filePart.getInputStream();
			
			filePart = request.getPart("money_order3");
			moneyOrderInputStream3 = filePart.getInputStream();
			
			
		}catch (NullPointerException e) {
			logger.warn("------>>> getting data in AddChildMemberController controller <<<----- exception: "+e.getMessage()+new Date());
		}

		List<UserInformationModel> usersDetailList = new LinkedList<>();
		for(int i=1;i<=4;i++) {
				UserInformationModel userInformationModel = new UserInformationModel();
				userInformationModel.setUserName(request.getParameter("user_name"+i));
				userInformationModel.setAddress(request.getParameter("user_address"+i));
				userInformationModel.setPincode(Long.parseLong(request.getParameter("user_pincode"+i)));
				userInformationModel.setMobileNo(Long.parseLong(request.getParameter("user_mobile_no"+i)));
				userInformationModel.setGender(request.getParameter("gender"+i));
			
			if(parentInfo != null) {
				userInformationModel.setParentInfo(parentInfo);	
			}
			if(superParentInfo !=null) {
				
				userInformationModel.setSuperParentInfo(superParentInfo);
			}
			if(grandParentInfo!=null) {
				userInformationModel.setGrandParent(grandParentInfo);
				long grandParentId = Long.parseLong(grandParentInfo.split("-")[0]);
				if(grandParentId<=9999) {
					userInformationModel.setFirstAdmin(grandParentInfo);
				}
				else {
					userInformationModel.setFirstAdmin(null);
				}
			}
			
			usersDetailList.add(userInformationModel);
		}
		
    	JDBCUserTemplate jdbcUserTemplate = new JDBCUserTemplate();
		List<Long> primaryIds=jdbcUserTemplate.addUsersService(usersDetailList);

		if(!primaryIds.isEmpty()) {
			long userId=Long.parseLong(parentInfo.split("-")[0]);
			jdbcUserTemplate.fileUploadToUser(userFormInputStream,moneyOrderInputStream1,moneyOrderInputStream2,moneyOrderInputStream3, userId);
			request.setAttribute("user_added_info","User Added Successfully");
			logger.info("-----add child member successfully----->>>>"+new Date());
//			request.getRequestDispatcher("user.jsp").forward(request, response);
			response.sendRedirect("user.jsp?msg="+"User Added Successfully");
		}
		
	}

}
}
