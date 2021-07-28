<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Declare Error page     -->
    <%@page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! Something wrong</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
					crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">

<!-- fort awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container text-center">
		<img alt="some.png" height="250" width="250" src="image/browser.png" class="img-fluid img">
		<h3 class="display-3">Sorry ! Something went wrong ...</h3>
		
		<!-- error show -->
		<%= exception%>
		
		<a href="index.jsp" class="btn btn-primary btn-lg mt-3">Home</a>
	</div>

</body>
</html>