<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
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

<main class="register">
<br>
	<div class="container ">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-header text-center loginheader">
				<span class="fa fa-3x fa-user-circle"></span>
				<h3>Register Here</h3>
				</div>
				<div class="card-body">
				
<form id="regpage" action="/MavenTest/regUser" method="post">

  <div class="form-group">
    <label for="user_name">User Name</label>
    <input type="text"  name="user_name" class="form-control" id="user_name"  placeholder="Enter UserName here..">
  </div>

 <div class="form-group">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" placeholder="Enter Email here..">
 </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Enter password here..">
  </div>
  
  <br>
   <div class="form-group">
    <label for="exampleInputPassword1" class="form-label">Gender</label>
    <input type="radio" id="gender" name="gender" value="male">Male
    <input type="radio" id="gender" name="gender" value="fmale">FeMale
  </div>
  
  <div class="form-group">
  <textarea name="user_about" class="form-control" rows="3" cols="" placeholder="Enter something about your self.."></textarea>  
  </div>
  
  <br>
  <div class="form-check">
    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree term and conditions</label>
  </div>
  <br>
  
  <div class="container text-center" id="loader" style="display: none;">
  <span class="fa fa-refresh fa-spin fa-5x"></span>
  <h5>Please wait...</h5>
  </div>
  
  <div class="container text-center">
  <button id="submitbtn" type="submit" class="btn btn-primary">Register</button> 
	<button type="reset" class="btn btn-danger">Reset</button>
  </div>
</form>
		
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

 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 
<script src="js/myjs.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		console.log("loaded...");
		
		$('#regpage').on('submit',function (event){
		
			event.preventDefault();
			let form=new FormData(this);
			
			//loader show
			$("#submitbtn").hide();
			$("#loader").show();
			
			//send register servlet
			$.ajax({
				url: "/MavenTest/regUser",
				type:'POST',
				data:form,
				
			success: function (data,textStatus, jqXHR){
					console.log(data);
					
					//reverse it when it save it
					$("#submitbtn").show();
					$("#loader").hide();
					
				if(data.trim()=='Done')
					{	
						//show the alert box
						swal("Register Sueessfully Completed.. we redirecting to Login page")
							.then((value) => {
					  		window.location="login.jsp"
						});
					}
				else
					{
						swal(data);				
					}
					
				},
				
			error: function(jqXHR,textStatus,errorThrown){
					consle.log(jqXHR);
					$("#submitbtn").show();
					$("#loader").hide();
					swal(jqXHR +"Try Again !!");
					
				},
				
				processData: false,
				contentType: false
			
			});
		});
	});

</script>

</body>
</html>