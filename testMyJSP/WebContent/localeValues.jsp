<%@ page import = "java.io.*,java.util.Locale" %>
<%@ page import = "javax.servlet.*,javax.servlet.http.* "%>
<%@ page import = "java.text.DateFormat,java.util.Date, java.text.NumberFormat" %>

<%
   //Get the client's Locale
   Locale locale = request.getLocale();
   String language = locale.getLanguage();
   String country = locale.getCountry();

   // Set response content type
   response.setContentType("text/html");
   
   // Set spanish language code. e.x. "es" - spanish
   response.setHeader("Content-Language", "en");  

   String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale).format(new Date( ));
   
   NumberFormat nftc = NumberFormat.getCurrencyInstance(locale);
   String formattedCurr = nftc.format(1000000);
   
   NumberFormat nftp = NumberFormat.getPercentInstance(locale);
   String formattedPerc = nftp.format(0.51);   
   
%>

<html>
   	<head>
    	<title>"localeValues.jsp"</title>
   	</head>

	<body>
		<h2>Detecting Locale values & Displaying</h2>
      
      	<p align = "left">
         	<% 
            	out.println("Language : " + language  + "<br />");
            	out.println("Country  : " + country   + "<br />");
         	%>
      	</p>
      	<div align = "left">
         	<p>Local Date: <%  out.print(date); %></p>
      	</div>
      	<div align = "left">
         	<p>Formatted Currency: <%  out.print(formattedCurr); %></p>
      	</div>
      	<div align = "left">
        	<p>Formatted Percentage: <%  out.print(formattedPerc); %></p>
      	</div>
	</body>
</html>