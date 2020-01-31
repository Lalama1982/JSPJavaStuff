<%@ page	language="java" 
			contentType="text/html; charset=ISO-8859-1"
    		pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"error.jsp"</title>
		
	</head>
	
	<body>
		<h3>An exception occured!</h3>   
		<h5>Exception details below;</h5>
		<%= exception %>
		</br></br>
		<b>
		<%="At \"error.jsp\" (HTTP Header Response { webserver > browser }) : instance of a javax.servlet.http.HttpServletResponse </br>"%>
		<%="	>>	response.sendError(int code, String message): response.sendError(400, \"Exception!!!\" ) </br>"%>			
		<%="	Note: not implemented, exception is not shown"%>		
      	<%--
         	response.sendError(400, "Exception!!!" );
      	--%>
      	</b>
      	</br>
      	</br>
		<div><b>Error Table</b></div>
		<table width = "50%" border = "1">
			<tr valign = "top">
		    	<td width = "40%"><b>Error:</b></td>
		      	<td>${pageContext.exception}</td>
		   	</tr>
		      
		   	<tr valign = "top">
		      	<td><b>URI:</b></td>
		      	<td>${pageContext.errorData.requestURI}</td>
		   	</tr>
		      
		   	<tr valign = "top">
		     	 <td><b>Status code:</b></td>
		      	<td>${pageContext.errorData.statusCode}</td>
		   	</tr>
		      
		   	<tr valign = "top">
		      	<td><b>Stack trace:</b></td>
		      	<td>
		        	<c:forEach var = "trace" items = "${pageContext.exception.stackTrace}">
		            	<p>${trace}</p>
		         	</c:forEach>
		      	</td>
		   	</tr>
		</table>      			 	
	</body>
	
</html>