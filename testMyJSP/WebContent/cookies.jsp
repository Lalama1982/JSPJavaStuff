<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"cookies.jsp"</title>
	</head>
	<body>
		<!-- Uses of "JSP Cookies" -->
		<b>
			<%
				out.print("At \"cookies.jsp\" (Uses of JSP Cookies) </br>");
				out.print("Cookies are set at \"formData.jsp\" </br>");
				out.print("Picks 'first_name' & 'last_name' from \"welcome.jsp\", which were passed into \"formData.jsp\" </br>");
				out.print("Cookies are set at \"formData.jsp\" </br>");				
			%>
		</b>
		</br>
		</br>				
		<center>
			<table width = "15%" border = "1" align = "left">
				<tr bgcolor = "#949494"  align = "left">
					<th>Cookie Name</th>
					<th>Cookie Value</th>
				</tr>
				<%
					Cookie cookie = null;
				   	Cookie[] cookies = null;
				   
				   	// Get an array of Cookies associated with the this domain
				   	cookies = request.getCookies();
				   
				   	if( cookies != null ) {			      
				    	for (int i = 0; i < cookies.length; i++) {
				        	cookie = cookies[i];
				         	out.print("<tr><td>" + cookie.getName() + "</td>\n");
				         	out.println("<td> " + cookie.getValue() + "</td>\n");
				      	}

			         	out.print("<tr><td><b>" + "After deleting the cookie \"first_name\"" + "</b></td>\n");
			         	out.println("<td> " + "" + "</td>\n");
			         				         	
				      	for (int i = 0; i < cookies.length; i++) {
							cookie = cookies[i];
							if((cookie.getName( )).compareTo("first_name") == 0 ) {
							    cookie.setMaxAge(0);
							    response.addCookie(cookie);					    
							 }							

					  	}
				      	
			         	cookies = request.getCookies(); // refresh cookies		
				    	for (int i = 0; i < cookies.length; i++) {
				        	cookie = cookies[i];
				         	out.print("<tr><td>" + cookie.getName() + "</td>\n");
				         	out.println("<td> " + cookie.getValue() + "</td>\n");
				      	}			         	
				      
				   	}	else	{
				      	out.print("<tr><td>" + "No cookies founds" + "</td>\n");
				      	out.print("<tr><td>" + "No cookies founds" + "</td>\n");
				   	}
				%>	
			</table>
		</center>				
	</body>
</html>