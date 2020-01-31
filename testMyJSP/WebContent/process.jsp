<%@	page	language="java" 
			contentType="text/html; charset=ISO-8859-1"
    		pageEncoding="ISO-8859-1"
%>
<%--
	In "web.xml", under tag "<error-page>", error file is defined. Hence below is not needed 
	<%@ page errorPage="error.jsp" %>	
--%>	 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"process.jsp"</title>
		
	</head>
	<body>
		<%  		  
			String num1=request.getParameter("n1");  
			String num2=request.getParameter("n2");  
		  
			int a=Integer.parseInt(num1);  
			int b=Integer.parseInt(num2);  

 			int c=a/b;  
			out.print("division of numbers is: "+c);
			
			/*
	         if (b == 0) {
	             throw new RuntimeException("Error condition!!!");
	         } else{
	 			int c=a/b;  
				out.print("division of numbers is: "+c);  	        	 
	         }
			*/
		%>	
	</body>

</html>