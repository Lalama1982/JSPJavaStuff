<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.testEmailSendGrid.classes.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>"sendEmail.jsp"</title>
</head>
<body>
	<%
		String result;

		// Recipient's email ID needs to be mentioned.
		String to = request.getParameter("to_email");

		// Sender's email ID needs to be mentioned
		String from = request.getParameter("from_email");

		try {
			EmailSendGrid emailCall = new EmailSendGrid();
			result = emailCall.sendMail(from,	to); 
					//"Sent message successfully....";
			request.setAttribute("mailResult", result);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Error: unable to send message....");

		}

		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	%>
</body>
</html>