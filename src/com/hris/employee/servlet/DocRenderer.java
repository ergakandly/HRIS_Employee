package com.hris.employee.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hris.employee.manager.EmployeeManager;

public class DocRenderer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocRenderer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeManager manager = new EmployeeManager();
		String docId = request.getParameter("docId");
		int contentType = manager.getDocumentContentType(docId);
		
		if (contentType == 1) {
			response.setHeader("Content-Disposition", "filename=\"image\"");
			response.setContentType("image/jpg");
		}
		else if (contentType == 2) {
			response.setHeader("Content-Disposition", "attachment; filename=\"word-document\"");
			response.setContentType("application/msword");
		}
		else if (contentType == 3) {
			response.setHeader("Content-Disposition", "filename=\"pdf-document\"");
			response.setContentType("application/pdf");
		}
		
		response.setContentLength(manager.getDocument(docId).length);
		response.getOutputStream().write(manager.getDocument(docId));
		response.getOutputStream().flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}