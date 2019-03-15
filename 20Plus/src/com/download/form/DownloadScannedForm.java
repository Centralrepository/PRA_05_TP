package com.download.form;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.db.conf.DBConnection;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicException;
import net.sf.jmimemagic.MagicMatchNotFoundException;
import net.sf.jmimemagic.MagicParseException;

/**
 * Servlet implementation class DownloadScannedForm
 */
@WebServlet("/DownloadScannedForm")
public class DownloadScannedForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   static Logger logger = Logger.getLogger(DownloadScannedForm.class);
	private static final int BUFFER_SIZE = 4000;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadScannedForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				long formUserId = Long.parseLong(request.getParameter("form_id").trim());
				
				
				
				String formName = "Form"+"_"+formUserId;
				
				// for download the forms
				Connection conn = null;
				try {
					// connects to the database
					
					conn = DBConnection.getDBConnetion();

					// queries the database
					String sql = "SELECT * FROM user_information WHERE user_id = ?";
					PreparedStatement statement = conn.prepareStatement(sql);
					statement.setLong(1, formUserId);

					ResultSet result = statement.executeQuery();
					if (result.next()) {
						// gets file name and file blob data
						String fileName = result.getString("user_name");
				
						Blob blob = result.getBlob("user_form");
					
						/*  File extension in java   */
						String fileExtension=null;
						byte[] bdata = blob.getBytes(1, (int) blob.length());
						try {
							fileExtension = Magic.getMagicMatch(bdata).getExtension();
							
						} catch (MagicParseException e) {
							logger.warn("------>>> getting data in DownloadScannedForm  <<<----- exception: "+e.getMessage()+new Date());
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (MagicMatchNotFoundException e) {
							logger.warn("------>>> getting data in DownloadScannedForm  <<<----- exception: "+e.getMessage()+new Date());
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (MagicException e) {
							logger.warn("------>>> getting data in DownloadScannedForm  <<<----- exception: "+e.getMessage()+new Date());
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						/* end of File extension in java   */
						InputStream inputStream = blob.getBinaryStream();
						
						int fileLength = inputStream.available();
						
					

						ServletContext context = getServletContext();

						// sets MIME type for the file download
						String mimeType = context.getMimeType(fileName);
						if (mimeType == null) {			
							mimeType = "application/octet-stream";
						}				
						
						// set content properties and header attributes for the response
						response.setContentType(mimeType);
						response.setContentLength(fileLength);
						String headerKey = "Content-Disposition";
						String headerValue = String.format("attachment; filename=\"%s\"", formName+"."+fileExtension);
						response.setHeader(headerKey, headerValue);

						// writes the file to the client
						OutputStream outStream = response.getOutputStream();
						/*PrintWriter pr=response.getWriter();*/
						byte[] buffer = new byte[BUFFER_SIZE];
						int bytesRead = -1;
						
						while ((bytesRead = inputStream.read(buffer)) != -1) {
							outStream.write(buffer, 0, bytesRead);
						
							
						}
						
						inputStream.close();
						outStream.close();				
					} else {
						// no file found
						response.getWriter().print("File not found for the id: " + formUserId);	
					}
				} catch (SQLException ex) {
					logger.warn("------>>> getting data in DownloadScannedForm  <<<----- exception: "+ex.getMessage()+new Date());
					ex.printStackTrace();
					response.getWriter().print("SQL Error: " + ex.getMessage());
				} catch (IOException ex) {
					logger.warn("------>>> getting data in DownloadScannedForm  <<<----- exception: "+ex.getMessage()+new Date());
					ex.printStackTrace();
					response.getWriter().print("IO Error: " + ex.getMessage());
				} finally {
					if (conn != null) {
						// closes the database connection
						/*try {
						//	conn.close();
						} catch (SQLException ex) {
							ex.printStackTrace();
						}*/
					}			
				}
	}

	
}
