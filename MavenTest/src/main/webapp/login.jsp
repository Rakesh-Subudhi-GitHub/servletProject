<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.rk.entity.Message"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<!-- Css files -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
					crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">

<!-- fort awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<!-- navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- loginpage -->
	<main class="d-flex align-items-center login" style= "height: 60vh ">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
				
				<!--form -->
				<div class="card">
					<div class="card-header loginheader">
						<h3> <span class="fa fa-user"></span> Login Here..</h3>
						
						<!-- login check -->
						<%
						Message msg=(Message)session.getAttribute("msg");
						
						if(msg!=null)
						{
							
						%>
							<div class="alert <%= msg.getCssClass() %>" role="alert">
  								<%= msg.getContent() %>	
							</div>
						<%
						}
						session.removeAttribute("msg");
						%>
						
					</div>
					<div class="card-body">
					
<form action="/MavenTest/loginPage" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Email here..">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="password">
  </div>
  
  
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  
</form>


					</div>
				</div>
				
				</div>
			</div>
		</div>
	</main>

<!-- ################################################################################################ -->
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.3.2.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" 
			integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" 
						crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" 
			integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" 
						crossorigin="anonymous">
</script>

<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>