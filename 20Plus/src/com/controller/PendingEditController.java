package com.controller;

import java.io.IOException;
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

import com.db.template.JDBCUserTemplate;
import com.model.ParentDetailsModel;


@WebServlet("/pendingedit")
public class PendingEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(PendingEditController.class);
    public PendingEditController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("admin_name");
		if(sessionname==null) {
			response.sendRedirect("admin.jsp");
		}else {
		logger.info("-----pending edit controller ----->>>>"+new Date());

		long userId = Long.parseLong(request.getParameter("userid"));
		Map<Long,ParentDetailsModel> map = new TreeMap<>();
		
		JDBCUserTemplate userTemplate = new JDBCUserTemplate();
		userTemplate.getUserName(userId,map);
		logger.info("-----getting userid details ----->>>>"+new Date());
		request.setAttribute("member_details", map);
		request.setAttribute("currentUSerId", userId);
		request.getRequestDispatcher("adminedituserform.jsp").forward(request, response);
	}

	}
}
