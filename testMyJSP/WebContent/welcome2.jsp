<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"welcome2.jsp"</title>
	</head>
	<body>
		<!-- Uses of "JSP implicit object: 'response'" -->
		<h3>
			<%="At \"welcome.jsp\" (implicit object: 'response')"%>
		</h3>	
		<%   
		response.sendRedirect("http://www.google.com");  
		%>	
	</body>
</html>