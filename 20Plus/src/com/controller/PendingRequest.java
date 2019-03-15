package com.controller;

import java.io.IOException;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conf.DBConnection;
import com.db.template.JDBCAdminTemplate;

/**
 * Servlet implementation class PendingRequest
 */
@WebServlet("/PendingRequest")
public class PendingRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PendingRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long nuserid=Long.parseLong(request.getParameter("new_user_id"));
		
		 Connection requestConn = DBConnection.getDBConnetion();
		 try {
		 Statement stex1 = requestConn.createStatement();
		// ResultSet rsex1 = stex1.executeQuery("update user_information set Status = ACTIVE , Approval = 1 where user_id='"+nuserid+"'");
		 PreparedStatement pst = requestConn.prepareStatement("update user_information set Status = ? where user_id='"+nuserid+"'");
		 pst.setString(1,"ACTIVE");
//		 pst.setInt(2,1);
		
			if(pst.executeUpdate()>0) {
				//JDBCAdminTemplate jdbcTemplate = new JDBCAdminTemplate();
				//jdbcTemplate.sendNewUserId(nuserid);
				request.setAttribute("member_update", "user created successfully with user id : "+nuserid);
				response.sendRedirect("create_new_user_form.jsp?member_update="+request.getAttribute("member_update")+"&new_user_id="+nuserid);
				
			}
			else {
				request.setAttribute("msg","Something went wrong");
				//logger.info("-----add user was not created ----->>>>"+new Date());
				request.getRequestDispatcher("/adminhome.jsp").forward(request, response);
				
			}
			
		 }
		 
		catch (Exception e) {
		System.out.println("exception in"+e );
		}
	}

	
	

}
