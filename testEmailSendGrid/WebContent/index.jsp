<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>"index.jsp"</title>
</head>
<body>
	<h3>At "index.jsp"</h3>
	<h3>Email Delivery via SendGrid</h3>
	<form action="sendMail.jsp"  method = "POST">
		<b> >> Send Email example..... </b>
		</br>  
		From: <input type = "text" name = "from_email"  value = "lalama@mailsac.com">
		</br>
		To: <input type = "text" name = "to_email" value = "lalamaesp@gmail.com">
		</br>
		<input type = "submit" value = "sendEmailPOST" />
	       	</br>
	       	<b>Mail Sent Result: </b>${mailResult} 						
	</form>		   	     			
</body>
</html>