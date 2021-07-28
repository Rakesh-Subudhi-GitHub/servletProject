
<%@page import="com.rk.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!-- import package -->    
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TECH BAR</title>

<!-- Css files -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
					crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">

<!-- fort awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.banner-background{
	clip-path: polygon(30% 0%, 70% 0%, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0% 99%, 0 0);
	}
</style>

</head>
<body>

<!-- nav-bar  -->
<%@include file="normal_navbar.jsp" %>

<!-- Banner -->

<div class="container-fluid p-0 m-0 banner-background">

	<div class="jumbotron intro">
		<div class="container">
		<h3 class="display-3">Welcome to Tech Bar</h3>
		<p>Welcome to technical clog,world of technology
		A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
		Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.[1] The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions. 
		</p>
		
		<a href="register_page.jsp" class="btn btn-outline-light "><span class="fa fa-external-link"></span> Start !Its Free</a>
		<a href="login.jsp" class="btn btn-outline-light "><span class="fa fa-user-circle fa-spin"></span> Login</a>
		</div>
	<br>
	</div>

</div>
<!-- card -->
<div class="container">
	<div class="row mt-2">
		
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
	
	</div>
	<div class="row mt-1">
		
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    				<h5 class="card-title">Java Programming</h5>
    				<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    				<a href="#" class="btn btn-primary">Read more..</a>
  				</div>
			</div>
		</div>
	
	</div>
</div>

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