package com.validator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.controller.AddUserController;
import com.db.conf.DBConnection;
import com.db.template.JDBCUserTemplate;

/**
 * Servlet implementation class MobileNoValidator
 */
@WebServlet("/MobileNoValidator")
public class MobileNoValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(MobileNoValidator.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MobileNoValidator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long userMobileNo = Long.parseLong(request.getParameter("userMobileNo").trim());
		
		String message="";
		Connection con =DBConnection.getDBConnetion();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from user_information where Mobile_No='"+userMobileNo+"'");
			if(rs.next()) {
				message = "Mobile no "+userMobileNo+" already exists";
			}
			
		} catch (SQLException e) {
			logger.warn("------>>>  mobileno validation in MobileNoValidator  <<<----- exception: "+e.getMessage()+new Date());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("text/plain");
		response.getWriter().write(message);
		
	}



}
