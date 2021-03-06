package com.hris.employee.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hris.employee.manager.EmployeeManager;

/**
 * Servlet Filter implementation class EmployeeFilter
 */
public class EmployeeFilter implements Filter {

	private ServletContext context;
	
    /**
     * Default constructor. 
     */
    public EmployeeFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		this.context.log("Requested Resource::EMPLOYEE");
		HttpSession session = req.getSession(false);
		
		if (null != session && (null != session.getAttribute("username")) || null != req.getParameter("zx"))
			chain.doFilter(request, response);
		else {
			this.context.log("Unauthorized access request - EMPLOYEE");
			
			EmployeeManager manager = new EmployeeManager();
			res.sendRedirect(manager.getPortalUrl());
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized - EMPLOYEE");
	}

}
