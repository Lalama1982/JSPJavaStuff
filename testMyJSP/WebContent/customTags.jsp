<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "ex" uri = "WEB-INF/custom.tld"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>"customTags.jsp"</title>
	</head>
	<body>
		<%="Refers to \"com.testMyJSP.classes.StudentsBean\" using bean id \"students\""%></br>
		</br>		
		<ex:CustomTag1/>
		<ex:CustomTag2 attrCustomTag2 = "Attribute value of custom tag2" />
	</body>
</html>