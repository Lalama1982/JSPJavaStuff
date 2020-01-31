<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
	<head>
			<meta charset="ISO-8859-1">
			<title>"xmlProcessing.jsp"</title>
	</head>
	<body>
		<b>Books Info:</b></br>
		<c:import var = "bookInfo" url="http://localhost:8082/testMyJSP/resourceFiles/books.xml"/>
		
		<x:parse xml = "${bookInfo}" var = "output"/>
		<!-- b>First Book Name: </b-->
		<x:out select = "$output/books/book[1]/name" />
		<br>
		<!-- b>First Book Author: </b--> 
		<x:out select = "$output/books/book[1]/author" />
		<br>
		<b>First Book Price: </b> 
		<x:out select = "$output/books/book[1]/price" />
		<br>
						
		<b>Second Book Name: </b> 
		<x:out select = "$output/books/book[2]/name" />
		<br>
		<b>Second Book Author: </b> 
		<x:out select = "$output/books/book[2]/author" />
		<br>
		<b>Second Book Price: </b> 
		<x:out select = "$output/books/book[2]/price" />	
	</body>
</html>