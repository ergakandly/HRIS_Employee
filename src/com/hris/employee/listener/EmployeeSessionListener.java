package com.hris.employee.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.hris.employee.manager.EmployeeManager;

/**
 * Application Lifecycle Listener implementation class EmployeeSessionListener
 *
 */
public class EmployeeSessionListener implements HttpSessionListener {

	private static int totalActiveSession = 0;

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event)  { 
    	System.out.println("===============================");
    	System.out.println("sessionCreated - EMPLOYEE");
    	totalActiveSession++;
    	System.out.println("EMPLOYEE - active session: " + totalActiveSession);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event)  { 
    	HttpSession session = event.getSession();
    	
    	System.out.println("===============================");
    	System.out.println("sessionDestroyed - EMPLOYEE | "+session.getAttribute("username"));
    	if (totalActiveSession > 0)
    		totalActiveSession--;
    	System.out.println("EMPLOYEE - active session: " + totalActiveSession);
    	
    	
    	EmployeeManager eManager = new EmployeeManager();
    	eManager.updateStatusLogin(session.getAttribute("username").toString(), 0);
    }
	
}
