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

/**
 * Servlet implementation class DownloadBlankForm
 */
@WebServlet("/DownloadBlankForm")
public class DownloadBlankForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(DownloadBlankForm.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadBlankForm() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String sessionname=(String)session.getAttribute("user_name");
		if(sessionname==null) {
			response.sendRedirect("index.jsp");
		}else {
		logger.info("-----Download blank form ----->>>>"+new Date());
		    long userId = Long.parseLong(request.getParameter("user_id"));
		    Map<Long,ParentDetailsModel> map = new TreeMap<>();
			
			JDBCUserTemplate userTemplate = new JDBCUserTemplate();
			userTemplate.getMemberDetails(userId,map);
			request.setAttribute("member_details", map);
			logger.info("-----getting member details ----->>>>"+new Date());
			request.getRequestDispatcher("download.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
}
}