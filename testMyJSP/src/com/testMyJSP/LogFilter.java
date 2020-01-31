package com.testMyJSP;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

//import javax.servlet.http.*;
import java.util.*;

public class LogFilter implements Filter {
	public void  init(FilterConfig config) throws ServletException {
		// Get init parameter 
		String testParam = config.getInitParameter("test-param"); 
	 
		//Print the init parameter 
	    System.out.println("At \"LogFilter\" (test-param): " + testParam); 
	}
	
	public void  doFilter(ServletRequest req, ServletResponse res, FilterChain chain)	throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		
		// Get the IP address of client machine.   
	    String ipAddress = request.getRemoteAddr();
	      
	    // Log the IP address and current timestamp.
	    System.out.println("At \"LogFilter.java\", mapping is done at \"web.xml\": IP "+ ipAddress + ", Time "+ new Date().toString());
	      
	    // Pass request back down the filter chain
	    chain.doFilter(req,res);
	}
	
	public void destroy( ) {
		/* Called before the Filter instance is removed	from service by the web container*/
	}
	
}
