package com.validator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.conf.DBConnection;
import com.db.template.JDBCUserTemplate;

/**
 * Servlet implementation class AdminMobileNoValidator
 */
@WebServlet("/AdminMobileNoValidator")
public class AdminMobileNoValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMobileNoValidator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		long userMobileNo = Long.parseLong(request.getParameter("userMobileNo").trim());
		
		String message="";
		Connection con =DBConnection.getDBConnetion();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from admin_info where Mobile_No='"+userMobileNo+"'");
			if(rs.next()) {
				
				message = "Mobile no "+userMobileNo+" already exists";
			//	request.setAttribute("message","Mobile no "+userMobileNo+" already exists");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
		
		//request.setAttribute("message","user added successfully");
		
		response.getWriter().write(message);
		
	}



}
