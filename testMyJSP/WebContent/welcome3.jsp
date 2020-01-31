<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>"welcome3.jsp"</title>
	</head>
	<body>
		<!-- Uses of "(if...else)" -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (if...else)"%>
		</b>		
		<%! int day = 3;	%> 
		<%	out.print("day: " + day);
			if (day == 1 || day == 7) { %>
		   	<p> Today is weekend</p>
		<% 	} else { %>
		   <p> Today is not weekend</p>
		<% } %>		

		<!-- Uses of "(switch...case)" -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (switch...case)"%>
		</b>
		<%	
			day++;
			out.print("</br>" + "day: " + day + "</br>");
			switch(day) {
			   case 0:
			      out.println("It\'s Sunday.");
			      break;
			   case 1:
			      out.println("It\'s Monday.");
			      break;
			   case 2:
			      out.println("It\'s Tuesday.");
			      break;
			   case 3:
			      out.println("It\'s Wednesday.");
			      break;
			   case 4:
			      out.println("It\'s Thursday.");
			      break;
			   case 5:
			      out.println("It\'s Friday.");
			      break;
			   default:
			      out.println("It's Saturday.");
			}			
		%>
		</br>
		
		<!-- Uses of "(for...loop)" -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (for...loop)"%>
		</b>
		</br>
		<%! int fontSize; %>
		<%for ( fontSize = 1; fontSize <= 3; fontSize++){ %>
			<font color = "green" size = "<%= fontSize %>">
		    	fontSize: <%out.print(fontSize);%>
			</font>
			</br>
		<%}%>

		<!-- Uses of "(while...loop)" -->
		</br>
		<b>
			<%="At \"welcome.jsp\" (while...loop)"%>
		</b>
		</br>
      	<%	
      		fontSize = 1;	
      		out.print("fontSize: " + fontSize); 
      	%>
      	</br>
      	<%	while ( fontSize <= 5){ %>
	        	<font color = "red" size = "<%= fontSize %>">
	            	fontSize: <%out.print(fontSize);%>
	         	</font>
	         	</br>
	         	<%fontSize++;%>
      	<%}%>
      	
	</body>
</html>