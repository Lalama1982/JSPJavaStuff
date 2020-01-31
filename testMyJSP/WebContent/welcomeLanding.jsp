<%@	page	language="java" 
			contentType="text/html; charset=ISO-8859-1"
    		pageEncoding="ISO-8859-1"	%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>"welcomeLanding.jsp"</title>
	</head>
	<body>
		<%
			String driver=config.getInitParameter("dname"); 
			out.print("[config] driver name is=" + driver);			
		%>		
		<jsp:forward page="welcome.jsp" >  
		<jsp:param name="paramActionTag" value="value_paramActionTag" />  
		</jsp:forward>		
	</body>
</html>