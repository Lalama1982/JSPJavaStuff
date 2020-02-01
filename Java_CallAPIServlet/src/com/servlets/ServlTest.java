package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServlTest
 */

@WebServlet("/ServlTest")
public class ServlTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServlTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter printWriter  = response.getWriter();
		printWriter.println("<h1>From 'ServlTest.java'!</h1>");
		String param1 = request.getParameter("param1");
		printWriter.println("<p>Passed 'param1' >> "+ param1+"</p>");
		
		String callingURL = "https://jsonplaceholder.typicode.com/posts";
		CallAPI objCallAPI = new CallAPI(callingURL,param1); 	
		String responseCallAPI = objCallAPI.MyGETRequest();
		printWriter.println("<p>Received response from 'CallAPI.java' >> "+ responseCallAPI+"</p>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
