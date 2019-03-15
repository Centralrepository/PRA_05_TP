package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.db.template.JDBCAdminTemplate;

@WebServlet("/SubmitMemberDetails")
public class SubmitMemberDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(SubmitMemberDetails.class);
    public SubmitMemberDetails() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("-----Submitting member details  ----->>>>"+new Date());
		String member1=null,member2=null,member3=null,member4=null;
		try {
			member1 = request.getParameter("member1");
		}catch (Exception e) {
			logger.warn("------>>> getting member1 detail in SubmitMemberDetails controller <<<----- exception: "+e.getMessage()+new Date());
		    member1="";
		}
		try {
			member2 = request.getParameter("member2");
		}catch (Exception e) {
			logger.warn("------>>> getting member2 detail in SubmitMemberDetails controller <<<----- exception: "+e.getMessage()+new Date());
			member2="";
		}
		try {
			member3 = request.getParameter("member3");
		}catch (Exception e) {
			logger.warn("------>>> getting member3 detail in SubmitMemberDetails controller <<<----- exception: "+e.getMessage()+new Date());
			member3="";
		}
		
		member4 = request.getParameter("member4");
		
		
		JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
		if(adminTemplate.submitMemberDetails(member1, member2, member3, member4)) {
			request.setAttribute("member_update", "Data saved successfully");
			logger.info("----- member details saved successfully   ----->>>>"+new Date());
			request.getRequestDispatcher("adminhome.jsp").include(request, response);;
		}else {
			request.setAttribute("member_update", "User not added! Ineternal Server Error");
			logger.info("----- member details was not saved   ----->>>>"+new Date());
			request.getRequestDispatcher("adminhome.jsp").include(request, response);
		}
		
	}

}
