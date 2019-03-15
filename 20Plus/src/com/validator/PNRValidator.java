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

/**
 * Servlet implementation class PNRValidator
 */
@WebServlet("/PNRValidator")
public class PNRValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(PNRValidator.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PNRValidator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("-----PNRValidator  ----->>>>"+new Date());
		long pnrNo= Long.parseLong(request.getParameter("pnrNo"));
		Connection con =DBConnection.getDBConnetion();
		String message="";
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from moneyorder_id where order_id='"+pnrNo+"'");
			if(rs.next()) {
				message = "PNR no "+pnrNo+" already exists";
			}
			
		} catch (SQLException e) {
			logger.warn("------>>> getting moneyorder in PNRValidator  <<<----- exception: "+e.getMessage()+new Date());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		response.setContentType("text/plain");
		response.getWriter().write(message);
	}

	
}
