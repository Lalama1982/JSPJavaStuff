<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "ex" uri = "WEB-INF/custom.tld"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>"actionTags.jsp"</title>
	</head>
	<body>
		<h2> Start of "actionTags" </h2>
		<jsp:include page="includeFile2.jsp" />
		<jsp:useBean id="obj" class="com.testMyJSP.Calculator"/>
		</br>
		</br>
		<b>"useBean" Example#1</b>
		<%  
			out.print("\"jsp:useBean\" action tag example. From \"actionTags.jsp\" </br>");
			out.print("Refers to the \"Calulator.java\" bean at Java Resources, hence the method \"cube\" </br>");			
			int m=obj.cube(5);  
			out.print("cube of 5 is "+m);  
		%>  		
		</br>
		</br>
		<b>"useBean" Example#2</b></br>
		<%="Refers to \"com.testMyJSP.classes.StudentsBean\" using bean id \"students\""%></br>
		<jsp:useBean id = "students" class = "com.testMyJSP.classes.StudentsBean"> 
			<jsp:setProperty name = "students" property = "firstName" value = "Zara"/>
		   	<jsp:setProperty name = "students" property = "lastName" value = "Ali"/>
		   	<jsp:setProperty name = "students" property = "age" value = "10"/>
		</jsp:useBean>
		
		Student First Name: 
		   	<jsp:getProperty name = "students" property = "firstName"/>
		</br>
		
		Student Last Name: 
		   	<jsp:getProperty name = "students" property = "lastName"/>
		</br>
		
		Student Age: 
		   	<jsp:getProperty name = "students" property = "age"/>
		</br>		
				
		<h2> End of "actionTags" </h2>
	</body>
</html>