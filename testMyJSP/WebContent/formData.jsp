<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>    
<%
   // Create cookies for first and last names.      
   Cookie firstNameCk = new Cookie("first_name", request.getParameter("first_name"));
   Cookie lastNameCk = new Cookie("last_name", request.getParameter("last_name"));
		   
   // Set expiry date after 24 Hrs for both the cookies.
   firstNameCk.setMaxAge(60*60*24); 
   lastNameCk.setMaxAge(60*60*24); 
   
   // Add both the cookies in the response header.
   response.addCookie( firstNameCk );
   response.addCookie( lastNameCk );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"formData.jsp"</title>
	</head>
	<body>
		<b>
			<%="At \"formData.jsp\" >> JSP Form Data Processing"%>
			</br>
			</br>			
		</b>	

		<b>
			<%="Cookies \"firstNameCk\" & \"lastNameCk\", are set at top"%>
			</br>
			</br>			
		</b>
		
		<%  
			out.print("<b>jsp: GET & POST method, Reading Data</b> </br>");
			out.print("For GET direct testing > Sample URL: http://localhost:8080/testMyJSP/formData.jsp?first_name=Fname&last_name=Lname </br>");		
		%>		
		<ul>
		   	<li>
			   	<p>
			   		<b>First Name:</b>
			      	<%= request.getParameter("first_name")%>
				</p>
		   	</li>
			<li>
				<p>
					<b>Last  Name:</b>
		      		<%= request.getParameter("last_name")%>
		   		</p>
			</li>
			<li>
				<p>
					<b>CheckBox Value ["Checked"="on", "Unchecked"=null]:</b>
			   		<%= request.getParameter("checkBox1")%>
				</p>
			</li>			
		</ul>

		<%-- Listing all parameters from the request --%>
		<%  
			out.print("<b>Listing all form parameters from the request</b> </br>");	
		%>				
		<center>
			<table width = "15%" border = "1" align = "left">
				<tr bgcolor = "#949494"  align = "left">
					<th>Param Name</th>
					<th>Param Value(s)</th>
				</tr>
			   	<%
			    	Enumeration paramNames = request.getParameterNames();
			      	while(paramNames.hasMoreElements()) {
			        	String paramName = (String)paramNames.nextElement();
			         	out.print("<tr><td>" + paramName + "</td>\n");
			         	String paramValue = request.getParameter(paramName);
			         	out.println("<td> " + paramValue + "</td></tr>\n");
			      	}
			   	%>
			</table>
		</center>	
		</br>
		</br>	
		</br>
		</br>
		</br>
		</br>
		</br>							
		<b>
			<%="At \"cookies.jsp\" continue..... "%>
			<a href="cookies.jsp">Cookie processing</a>
		</b>			
	</body>
</html>