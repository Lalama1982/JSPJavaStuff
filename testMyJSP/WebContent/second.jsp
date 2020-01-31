<%@ page 	language="java" 
			contentType="text/html; charset=ISO-8859-1"
			pageEncoding="ISO-8859-1"
			import = "java.io.*,java.util.*"
%>
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"second.jsp"</title>
	</head>
	<body>
		<!-- Uses of "JSP implicit object: 'session'" -->
		<b>
			<%="At \"second.jsp\" (implicit object: 'session')"%>
			<%="This get called from \"welcome.jsp\" "%>
			<%="</br> session time-out is set at \"web.xml\" </br>"%>
		</b>
		<%
			String name = (String) session.getAttribute("user1");
			out.print("Via Session (set from \"index.htl\"): " + name + "</br>");
			String name2 = (String) session.getAttribute("user2");
			out.print("Via Session (set from \"welcome.jsp\"): " + name2 + "</br>");
			
			// Get session creation time.
			Date createTime = new Date(session.getCreationTime());
			out.print("</br> session creation time [session.getCreationTime()]: " + createTime);
			
			// Get last access time of this Webpage.
			Date lastAccessTime = new Date(session.getLastAccessedTime());
			out.print("</br> session last access time [session.getLastAccessedTime()]: " + lastAccessTime);
		%>
		
		<!-- Uses of "JSP implicit object: 'pageContext'" -->
		</br>
		</br>
		<b>
			<%="At \"second.jsp\" (implicit object: 'pageContext')"%>
			<%="This get called from \"welcome.jsp\" "%>
		</b>	
		<%
			String name3 = (String)pageContext.getAttribute("user3",PageContext.SESSION_SCOPE);  
			// can use "getAttribute", "removeAttribute"
			// can use "PAGE_SCOPE", "REQUEST_SCOPE", "APPLICATION_SCOPE"		
			out.print("</br> Via pageContext: " + name3); 	
		%>
		
	</body>
</html>