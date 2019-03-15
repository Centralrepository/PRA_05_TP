package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.db.conf.DBConnection;

/**
 * Servlet implementation class GetAdminDetail
 */
@WebServlet("/GetAdminDetail")
public class GetAdminDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAdminDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		response.setContentType("application/json");
		Connection con=null;
		
		long adminId = Long.parseLong(request.getParameter("admin_id"));
		
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		try {
			
			
			con=DBConnection.getDBConnetion();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select id,user_name,address,pincode,mobile_no from admin_info where id='"+adminId+"';");
			if(rs.next()) {
				obj.put("adminId", rs.getLong("id"));
				obj.put("adminName", rs.getString("user_name"));
				obj.put("adminAddress", rs.getString("address"));
				obj.put("adminPincode", rs.getLong("pincode"));
				obj.put("adminMobileNo", rs.getLong("mobile_no"));
			}
		}catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
    	
		out.println(obj);
		
		
	}

	
	
}
