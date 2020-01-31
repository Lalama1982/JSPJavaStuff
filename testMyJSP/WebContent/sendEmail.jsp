<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.testMyJSP.classes.*"%>

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
			SendEmailSendgrip emailCall = new SendEmailSendgrip();
			result = emailCall.sendMail(to,	from); 
					//"Sent message successfully....";
			request.setAttribute("mailResult", result);

		} catch (Exception e) {
			e.printStackTrace();
			result = "Error: unable to send message....";
			request.setAttribute("mailResult", result);
		}

		getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
	%>
</body>
</html>