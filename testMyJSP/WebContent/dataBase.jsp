<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>"dataBase.jsp"</title>
	</head>
	<body>
		<sql:setDataSource 	var = "snapshot" driver = "oracle.jdbc.driver.OracleDriver"
         					url = "jdbc:oracle:thin:@localhost:1521:xe"
							user = "test_user"  password = "testPassword"	/>
 
		<!-- INSERT -->
		<sql:update dataSource = "${snapshot}" var = "result">
        	INSERT INTO emp VALUES (9999, 'JSP-Guy', 'JSP-Job', NULL, TO_DATE('12-JUL-2009','DD-MON-YYYY'), 5400, NULL, 10)
      	</sql:update>
      	
		<!-- SELECT -->      
      	<sql:query dataSource = "${snapshot}" var = "result">
			SELECT empno,ename FROM emp
      	</sql:query>
 
		<!-- SELECT -->
       	<c:set var = "empId" value = "9999"/>
       	<sql:update dataSource = "${snapshot}" var = "count">
        	DELETE FROM emp WHERE empno = ?
         	<sql:param value = "${empId}" />
      	</sql:update>
 
      	<table border = "1" width = "50%" align = "left">
        	<tr  align = "left" width = "50%">
            	<th>Emp No</th>
            	<th>Emp Name</th>
         	</tr>
         
         	<c:forEach var = "row" items = "${result.rows}">
            	<tr>
               		<td><c:out value = "${row.empno}"/></td>
               		<td><c:out value = "${row.ename}"/></td>
            	</tr>
         	</c:forEach>
      	</table>	
	</body>
</html>