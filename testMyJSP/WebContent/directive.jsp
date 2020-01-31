<%@ page	language="java" 
			contentType="text/html; charset=ISO-8859-1"
    		pageEncoding="ISO-8859-1"
    		info="Ex: JSP page directive-info"
    		buffer="16kb"
    		errorPage="error.jsp"
    		isErrorPage="false"
    		isThreadSafe="true"
%>
<%@ page import="java.util.Date" %>
<%-- "isThreadSafe" = Servlet and JSP both are multithreaded. If you make it false, the web container will serialize the multiple requests. FIFO --%>
<%-- "errorPage" = Default, error page --%>
<%-- "isErrorPage" = If "true", current page becomes the error page --%>
<%-- "contentType" = Ex: application/msword --%>

<%@ include file="includeFile.jsp" %>  <%-- Includes contents from "includeFile.jsp" --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"directive.jsp"</title>
	</head>
	<body>
		</br>
		</br>	
		<!-- Uses of "JSP page directives" -->
		<b>
			<%="At \"directive.jsp\": JSP page directive = [contentType,info,buffer,isThreadSafe,errorPage, import]" %>
			</br>
			<%="Defined at top of the JSP file" %>
		</b>
		  
		</br>
		</br>	
		<!-- Uses of "JSP taglib directives" -->
		<b>
			<%="At \"directive.jsp\": JSP taglib directive (check does not work????)" %>
		</b>
		<!-- %@ taglib uri="http://www.javatpoint.com/tags" prefix="mytag" % -->  
		<!-- mytag:currentDate/  --> 		
		
		</br>
		</br>					
		Today is ("new Date()"): <%= new Date() %>
		</br>
		Today is ("new java.util.Date()"): <%= new java.util.Date() %>
		</br>
		Today is ("java.util.Calendar"): <%= java.util.Calendar.getInstance().getTime() %>
					
	</body>
</html>