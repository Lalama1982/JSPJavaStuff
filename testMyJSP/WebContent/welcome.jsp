<%@ page	language="java" 
			contentType="text/html; charset=ISO-8859-1"
			pageEncoding="ISO-8859-1"
%>

<%@ page import="java.util.Calendar" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%	String title = "\"title\" variable is defined at top. Here it is retrieving";%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"welcome.jsp"</title>
	</head>
		<b>
			<%
				out.print("FILTER is implemented. Definitions & Mappings are at \"web.xml\". \"LogFilter.java\" is at Java Resources");
			%>			 	
		</b>
		</br>		
		</br>	
	<body>
		<b>
			<div> ["forEach" example] for-loop</div>
			<div> >> requires "taglib" for "core" </div>
			<div> >> demo of "System.out.println"</div> 	
		</b>	
		<c:forEach var = "counter" begin = "1" end = "5" step = "1" >      
         	<c:out value = "${counter}"/></br>
         	<% System.out.println( "counter = " + pageContext.findAttribute("counter") ); %>
      	</c:forEach>
		</br>		
		</br>

		<b>
			[Action Tag / Forward Example] value of "paramActionTag": <%= request.getParameter("paramActionTag") %> 	
		</b>
		</br>		
		</br>
		
		<!-- Uses of "JSP scriptlet tag" -->
		<b>
			<%
				out.print("At \"welcome.jsp\" (use of scriptlet tag)");
			%>
		</b>
		</br>
		<%
			// "request" refers the "form action" set-up in "index.html"
			String name = request.getParameter("uname");
			out.print("welcome (from \"index.html\"): " + name);
		%>
		</br>
	
		<!-- Uses of "JSP expression tag" & "JSP implicit object: 'request' -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (use of expression tag & implicit object: 'request')"%>
		</b>
		</br>
		<%="Welcome (from \"index.html\"): "+ request.getParameter("uname")%>
		</br> Current Time:
		<%=java.util.Calendar.getInstance().getTime()%>
	
		<!-- Uses of "JSP declaration tag" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (use of declaration tag)"%>
		</b>
		<%!int data = 50;%>
		</br>
		<%="Value of the variable is (defined variable):" + data%>
		</br>
		<%!
			int cube(int n) {
				return n * n * n;
			}
		%>
		<%="Cube of 3 is (via a method):" + cube(3)%>
		</br>
		
		<!-- Uses of "JSP implicit object: 'out'" -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'out')"%>
		</b>
		</br>
		<%
			out.print("Today is:" + java.util.Calendar.getInstance().getTime());
		%>
	
		<!-- Uses of "JSP implicit object: 'response'" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'response')"%>
			>> Check at "welcome2.jsp"
		</b>
		<!-- This will direct to "google.com" -->
		<a href="welcome2.jsp">response at "welcome2.jsp"</a>
	
		<!-- Uses of "JSP implicit object: 'config'" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'config')"%>
		</b>
		</br>
		
		<%-- "dname" is a defined param value at "web.xml" --%>
		<%
			String driver=config.getInitParameter("dname"); 
			out.print("[config] driver name is=" + driver);
		%>
	
		<!-- Uses of "JSP implicit object: 'application'" with "hitcounter" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'application') with hitcounter"%>
		</b>
		</br>
		<%
			String driver2 = application.getInitParameter("dname"); // "dname" is a defined param value at "web.xml" 
			out.print("[application] driver name is=" + driver2+"</br>");
			
	         Integer hitsCount = (Integer)application.getAttribute("hitCounter");
	         if( hitsCount ==null || hitsCount == 0 ) {
	            /* First visit */
	            out.println("Welcome to my website!</br>");
	            hitsCount = 1;
	         } else {
	            /* return visit */
	            out.println("Welcome back to my website!</br>");
	            hitsCount += 1;
	         }
	         application.setAttribute("hitCounter", hitsCount);	
	         out.println("Total number of visits: "+ hitsCount);
		%>
	
		<!-- Uses of "JSP implicit object: 'session'" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'session')"%>
		</b>
		<%
			session.setAttribute("user1", (name+"-AsSession")); // setting "name" variable to session as "user1" (passed from "index.html")
			session.setAttribute("user2", ("nameWelcomePageSession")); // setting "name" variable to session as "user2"
		%>
		<a href="second.jsp">session at "second.jsp"</a>
		
		<!-- Uses of "JSP implicit object: 'pageContext'" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (implicit object: 'pageContext')"%>
		</b>
		<%
			pageContext.setAttribute("user3",(name+"-viaPageContext"),PageContext.SESSION_SCOPE);  // setting "name" variable to session as "user"
			// can use "getAttribute", "removeAttribute"
			// can use "PAGE_SCOPE", "REQUEST_SCOPE", "APPLICATION_SCOPE"
		%>
		<a href="second.jsp">pageContext at "second.jsp"</a>
		
		<!-- Uses of "HTTP Header Request" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (HTTP Header Request { browser > webserver }) : instance of a javax.servlet.http.HttpServletRequest </br>"%>
			<%="	>>	request.getHeaderNames() & request.getHeader(paramName)"%>
		</b>			
		<left>
			<table width = "100%" border = "1" align = "left">
		    	<tr bgcolor = "#949494">
		        	<th>Header Name</th>
		         	<th>Header Value(s)</th>
		      	</tr>
		      	<%@ page import = "java.io.*,java.util.*" %>
		      	<%
		        	Enumeration headerNames = request.getHeaderNames();
		         	while(headerNames.hasMoreElements()) {
		            	String paramName = (String)headerNames.nextElement();
		            	out.print("<tr><td>" + paramName + "</td>\n");
		            	String paramValue = request.getHeader(paramName);
		            	out.println("<td> " + paramValue + "</td></tr>\n");
		         	}
		      	%>
			</table>
		</left>
		</br>		
		<b>
			<%="	>>	request.getMethod()"%>
			<%
				String vMethod =  request.getMethod();
				out.print(" : \"request.getMethod\" Value = " + vMethod);
			%>
		</b>		
		</br>		
		<b>
			<%="	>>	request.getProtocol()"%>
			<%
				String vProtocol =  request.getProtocol();
				out.print(" : \"request.getProtocol\" Value = " + vProtocol);
			%>
		</b>
		</br>		
		<b>
			<%="	>>	request.getRequestURI()"%>
			<%
				String vRequestURI =  request.getRequestURI();
				out.print(" : \"request.getRequestURI\" Value = " + vRequestURI);
			%>
		</b>
		</br>		
		<b>
			<%="	>>	request.getServerPort()"%>
			<%
				int vServerPort =  request.getServerPort();
				out.print(" : \"request.getServerPort\" Value = " + vServerPort);
			%>
		</b>
		
		<!-- Uses of "HTTP Header Response" -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" (HTTP Header Response { webserver > browser }) : instance of a javax.servlet.http.HttpServletResponse </br>"%>
			<%="	>>	response.setIntHeader(String name, int value)"%>		
			<%="	>>	 : \"response.setIntHeader(\"Refresh\", 60)\" {autoload page for every 60 seconds} : "%>
	        <%
	            response.setIntHeader("Refresh", 60);
		        // Get current time
		        Calendar calendar = new GregorianCalendar();
		        
		        String am_pm;
		        int hour = calendar.get(Calendar.HOUR);
		        int minute = calendar.get(Calendar.MINUTE);
		        int second = calendar.get(Calendar.SECOND);
		        
		        if(calendar.get(Calendar.AM_PM) == 0) 
		           am_pm = "AM";
		        else
		           am_pm = "PM";
		        
	           String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
	           out.println(CT + "\n");        
	         %>
		</b>

		<!-- Date handling.. -->
		</br>
		</br>
		
		<b> <%="At \"welcome.jsp\" Date handling "%> </b> </br>
		<%
		   	Date date = new Date();
		   	out.print( "Current Date & Time: " +date.toString()+"</br>");
		   	
		   	SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
		   	out.print( "Current Date & Time (formatted:\"E yyyy.MM.dd 'at' hh:mm:ss a zzz\" ): " +ft.format(date)+"</br>");
		    
		%>			
		
								      				
		<!-- continue ..... -->
		</br>
		</br>
		<b>
			<%="At \"welcome.jsp\" continue..... "%>
			<a href="welcome3.jsp">if-else, for-loop, while-loop</a>
		</b>
		</br>
		</br>
		<b>
			<%="At \"directive.jsp\" continue..... "%>
			<a href="directive.jsp">JSP directives</a>
		</b>		
		</br>
		</br>
		<b>
			<%="At \"actionTags.jsp\" (useBean) continue..... "%>
			<a href="actionTags.jsp">JSP action tags (useBean)</a>
		</b>				
		</br>
		</br>
		<b>
			<%="At \"customeTags.jsp\" continue.....  </br>"%>
			<%="Need to copy \"custome.tld\" to \"D:\\apache-tomcat-9.0.26\\webapps\\ROOT\\WEB-INF\" (not at project folder) </br>"%>
			<%= "\"custome.tld\" is the mapping file </br>" %>
			<a href="customTags.jsp">Custom tags</a>
		</b>	
		</br>
		</br>
		
		<b>
			<%="At \"formData.jsp\" continue..... "%>
			<!-- <a href="formData.jsp?first_name=Fname&last_name=Lname">JSP Form Data Processing</a> -->
		</b>
		</br>
		
		<%--"GET" example.....  --%>
		<form action="formData.jsp"  method = "GET">
			<b>>> "GET" example.....</b>
			</br>  
			First Name: <input type = "text" name = "first_name" value = "fnameGET">
			Last Name: <input type = "text" name = "last_name"  value = "lnameGET">
			<input type = "submit" value = "FormDataGET" />
		</form>					
		</br>
		
		<%--"POST" example.....  --%>
		<form action="formData.jsp"  method = "POST">
			<b> >> "POST" example..... </b>
			</br>  
			First Name: <input type = "text" name = "first_name" value = "fnamePOST">
			</br>
			Last Name: <input type = "text" name = "last_name"  value = "lnamePOST">
			</br>
			Check Box1: <input type = "checkbox" name = "checkBox1" checked = "checked" />
			</br>
			<input type = "submit" value = "FormDataPOST" />
		</form>	
				
		</br>
		</br> 	
		<%  
			out.print("<b> >>JSP Form Upload Example </b> </br>");
			out.print("Location of the file to be saved is set at \"web.xml\" as an \"<context-param>\" example.</br>");
			out.print("[This will call \"formUpload.jsp\"]</br>");
			out.print("\"commons-fileupload-1.4.jar\" & \"commons-io-2.6.jar\" at \"WebContent\\WEB-INF\\lib\"");
			out.print("Upload will handle via \"FileUploadServlet.java\"</br>");
			out.print("Files will saved to \"fileUploadSaveLocRelative\" folder (will create if not available)</br>");
		%>
		<br/>		
      	<form action = "uploadFileViaServlet" method = "post" enctype = "multipart/form-data">
      		Select a file to upload (via servlet):
      		<br/>
         	<input type = "file" name = "file" size = "50" />
         	</br>
         	<input type = "submit" value = "uploadFile" />
         	</br>
         	<b>Upload Result: </b>${message}
         	</br>
         	<b>Saved Path: </b>${savedPath}
         	</br>
         	<b>File Name: </b>${fileName}         	
      	</form>
      	
		</br>      	
		<%-- Sending Email example.....  --%>
		<form action="sendEmail.jsp"  method = "POST">
			<b> >> Send Email example..... </b>
			</br>  
			To: <input type = "text" name = "to_email" value = "lalamaesp@yahoo.com">
			</br>
			From: <input type = "text" name = "from_email"  value = "lalamaesp@gmail.com">
			</br>
			<input type = "submit" value = "sendEmailPOST" />
         	</br>
         	<b>Mail Sent Result: </b>${mailResult} 						
		</form>	
		
		</br>
		</br>  
		<left>
			<b><% out.print(title); %></b>
		</left>

		<div align = "left">
			<p>
				Capturing "header" detail (user-agent): ${header["user-agent"]}
			</p>
		</div>	
		<div align = "left">
        	<p>
        		Capturing "parameter" detail (uname): ${param["uname"]}
        	</p>
      	</div>
	</body>
</html>