<!-- collect the session value -->
<%@page import="com.rk.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rk.helper.ConnectionProvider"%>
<%@page import="com.rk.dao.PostDAO"%>
<%@page import="com.rk.entity.User" %>

<%@ page errorPage="../error.jsp" %><!-- error page to send it -->

<%
User user=(User)session.getAttribute("CurrentUser");
if(user==null)
{
	response.sendRedirect("login.jsp");
}
%>

<%@page import="com.rk.entity.Message"  %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= user.getName() %> - Profile</title>

<!-- Css files -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
					crossorigin="anonymous">
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">

<!-- fort awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
background: url(../image/browser.png);
background-size: cover;
background-attachment: fixed;
}
</style>

</head>
<body>

<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><span class="fa fa-star"></span> TECH BAR</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
     
     	<li class="nav-item">
          <a class="nav-link" href="#"> <span class="fa fa-address-card-o"></span> Contact</a>
        </li>
         
         <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#postModal"> <span class="fa fa-edit"></span> POST</a>
        </li>
         
      </ul>
      
      <ul class="navbar-nav mr-right">
      
        <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%=user.getName() %></a>
        </li>  
      
        <li class="nav-item">
          <a class="nav-link" href="/MavenTest/logoutPage"> <span class="fa fa-logout"></span> Logout</a>
        </li>  
        
      </ul>
    </div>
  </div>
</nav>


<!-- end of nav bar -->

<!-- edit message check -->
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

<!-- main body of the page -->

<main>
	<div class="container">

		<div class="row mt-3">
			
		<!-- firts col -->
		<div class="col-md-4">
		    
			<!-- list of category -->
			<div class="list-group"> 
				
				<!-- this is collect the ref and trasfer to temp -->
  			<a href="#" onclick="getPost(0,this)" class="c-link list-group-item list-group-item-action active">
    			ALL Posts
  			</a>
  			<!-- get all categories -->
  			<%
  				PostDAO dao=new PostDAO(ConnectionProvider.getConnection());
  				ArrayList<Category> list1= dao.getAllCategory();
  				for(Category cc:list1)
  				{
  			%><a href="#" onclick="getPost(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action" ><%= cc.getCname() %></a>
  			<% 		
  				}
  			%>
  			
			</div>
			
		</div>
		
		<!-- second col -->
		<div class="col-md-8">
			<!-- post -->
			<div class="container text-center" id="loader">
				<i class="fa fa-refresh fa-4x fa-spin"></i>
				<h3 class="mt-3"> Loading...</h3>
			</div>
			<div class="container-fluid" id="post-container">
			
			</div>
		</div>
		
		</div>

	</div>

</main>
<!-- End main body of the page -->

<!--################################ profile model ###################################-->

<!-- Profile Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">TECH-BAR</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        	<div>
        	<img class="img-fluid" height="80px" width="80px" style="border-radius: 50%" src="../pic/<%= user.getProfile_img() %> ">
        	</div>
        	
        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>	
        
        <div id="profile-detail">
        <!-- details table -->
        <table class="table">
  
  		<tbody>
    		<tr>
      		<th scope="row">ID :</th>
      		<td><%= user.getId() %></td>   
    		</tr>
    
    		<tr>
      		<th scope="row">email</th>
      		<td><%= user.getEmail() %></td> 
    		</tr>
    
    		<tr>
      		<th scope="row">gender</th>
      		<td ><%= user.getGender().toUpperCase() %></td>
    		</tr>
    		
    		<tr>
      		<th scope="row">status</th>
      		<td ><%= user.getAbout() %></td>
    		</tr>
    		
    		<tr>
      		<th scope="row">Registered on</th>
      		<td ><%= user.getRegDate() %></td>
    		</tr>
    		
  		</tbody>
	</table>
        </div>
        
        </div>
      
      <div id="profile-edit" style="display: none">
      <h3 class="mt-2 text-center">Please Edit Carefully</h3>
      
      <!-- Edit  -->
      <form action="/MavenTest/editPage" method="post" enctype="multipart/form-data">
      
      <table class="table">
      
      <tr>
      	<th scope="row">ID :</th>
      	<td><%= user.getId() %></td>
      </tr>
      
      <tr>
      	<th scope="row">Name :</th>
      	<td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> </td>
      </tr>
      
      <tr>
      	<th scope="row">Email :</th>
      	<td> <input type="email" class="form-control" name="user_email" value= "<%= user.getEmail() %>" > </td>
      </tr>
      
      <tr>
      	<th scope="row">Gender :</th>
      	<td><%= user.getGender().toUpperCase()%> </td>
      </tr>
      
      <tr>
      	<th scope="row">About :</th>
      	<td> <textarea class="form-control" name="user_about" rows="2" ><%= user.getAbout() %></textarea>  </td>
      </tr>
      
      <tr>
      	<th scope="row">New Profile Pic :</th>
      	<td> <input type="file" name="image" class="form-control"> </td>
      </tr>
      
      </table>
      
      <div class="container text-center">
      
      <button type="submit" class="btn btn-primary">Save</button>
      
      </div>
      
      </form>
      
      </div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>


<!-- end of profile model -->

<!-- ################################### POST Modal ############################## -->
<!-- POST Modal -->
<div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">POST Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
       
       
       <form id="add-postForm" action="/MavenTest/addpost" method="post">
       
       	<div class="container">
       	
       	<div class="form-group">
       	
       	<select class="form-control" name="cid">
       		<option disabled selected="selected">--Select Category--</option>
       		
       		<%
       		PostDAO post=new PostDAO(ConnectionProvider.getConnection());
       		ArrayList<Category> list=post.getAllCategory();
       		
       		for(Category c:list)
       		{
       		
       		%>
       		<option value="<%= c.getCid()%>"><%= c.getCname() %></option>
       		<% 
       			}
       		%>
       	</select>
       	</div>
       	
       	<br>
       	<div class="form-group">
       		<input type="text" name="title" class="form-control" placeholder="Enter PostTitle here..">
       	</div>	
       	
       	<br>
       	<div class="form-group">
  		<textarea name="content" class="form-control" rows="2" cols="" placeholder="Enter Content here.."></textarea>  
  		</div>
       	
       	<br>
       	<div class="form-group">
  		<textarea name="code" class="form-control" rows="2" cols="" placeholder="Enter Code here.."></textarea>  
  		</div>
       	
       	<br>
       	<div class="form-group">
       	<label> Select Your pics..</label>
       	<input type="file" class="form-control" name="pic">
       	</div>
       
       	</div>
       
       
       <div class="container text-center mt-2">
       <button type="submit" class="btn btn-primary">POST</button>
       </div>	
       	
       </form>
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>


<!-- end of Post modal -->
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
<script src="../js/myjs.js" type="text/javascript"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		let editStatus =false;
		
		$('#edit-profile-button').click(function(){
		
		if(editStatus == false)
		{
			$("#profile-detail").hide();
			$("#profile-edit").show();
			editStatus=true;
			$(this).text("Back");
		}
		else
		{
			$("#profile-detail").show();
			$("#profile-edit").hide();		
			editStatus=false;
			$(this).text("Edit");
			
		}


		});
		
	});
	
</script>

	<!-- now add-post js  -->
<script >

$(document).ready(function(){
	
	console.log("loaded...");
	
	$('#add-postForm').on('submit',function (event){
	
		event.preventDefault();
		let form=new FormData(this);
			
			
			//now requsting to server
			$.ajax({
				url: "/MavenTest/addpost",
				type:'POST',
				data:form,
				
				success: function (data,textStatus, jqXHR){
					console.log(data);
					
					if(data.trim()=='done'){
					swal("Good job!", "Your Post Successfully..", "success");
					}
					else{
						swal("Good job!", "Something went wrong ..", "error");
					}
				},
				error: function(jqXHR,textStatus,errorThrown){
					consle.log(jqXHR);
					swal("Good job!", "Something went problem Try! again", "success");
				},
				
				processData: false,
				contentType: false
				
			});
		});
		
	});

</script>


<!-- Loading post useing ajax -->

<script>
	
	//if you call then all post load it
	function getPost(catId,temp){ //temp is collect the ref value
		
		$("#loader").show();
		$("#post-container").hide();
		
		//remove the all active click
		$(".c-link").removeClass('active');
		
		$.ajax({
			url: "Load_post.jsp",
			data: {cid: catId},
			
			success: function(data,textStatus,jqXHR){
			//console.log(data);
				
			$("#loader").hide();//hid the loading screen and show the data
			$("#post-container").show();
			$("#post-container").html(data);  //load the new page that can direct it
			
			//only those to take active link set
			$(temp).addClass('active');//only those elemetc is click that to active only 
			
			}//success

		});
	}//func
	
	$(document).ready(function(event){
		console.log("load post page..");
		
		
		//inistial load the all elemets then it active 1st one so
		let allPostRef=$('.c-link')[0]  //put fast elemet is active
		
		getPost(0,allPostRef);
		
	});
	
</script>
</body>
</html>