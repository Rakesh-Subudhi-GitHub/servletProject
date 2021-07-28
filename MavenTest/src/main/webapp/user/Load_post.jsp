<%@page import="com.rk.entity.User"%>
<%@page import="com.rk.dao.LikeDAO"%>
<%@page import="com.rk.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.rk.helper.ConnectionProvider"%>
<%@page import="com.rk.dao.PostDAO"%>
<%@ page errorPage="../error.jsp" %>

<%
User user=(User)session.getAttribute("CurrentUser");
if(user==null)
{
	response.sendRedirect("login.jsp");
}
%>


<div class="row">

	<%
	
	// for testing show the loader
	//Thread.sleep(1000);
	
	PostDAO dao=new PostDAO(ConnectionProvider.getConnection());
	
	int cid=Integer.parseInt(request.getParameter("cid"));
	List<Post> posts=null;
	
	//if cid == 0 means it load all post
	if(cid==0)
	{
		posts=dao.getAllPost();	
	}
		//get catId based print post
	else{
		
		posts=dao.getPostByCatId(cid);
		
	}
	
	//for no post then show blank page
	if(posts.size()==0)
	{
		out.println("<h5 class='display-4 text-center'>No Post in this category..</h5>");
		return;
	}
	
	//some data there
	else{
	
		for(Post p:posts){
	%>
	
<!--html code or col value -->
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" alt="" src="../postPic/<%= p.getPic()%>">
			<div class="card-body">
				<b><%= p.getPtitle() %></b>
				<p><%= p.getPcontent() %></p>
							
			</div>
		
			<div>
				<div class="card-footer text-center bg-primary">
				
				<%
				LikeDAO likedao=new LikeDAO(ConnectionProvider.getConnection());
				%>
				
				<a  onclick="dolike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"> 
					<i class="fa fa-thumbs-o-up"></i>
						<span class="like-counter"><%= likedao.countLikeOnPost(p.getPid()) %></span>
				</a>	
				
				<!-- pass the pid useing url rewriteing and url  -->
				<a href="show_post.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more..</a>
				<a href="#" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i><span>20</span></a>
					
				</div>
			</div>
		</div>
	
	</div>
	
	<%		
	}//for
	}//else
	%>
	
</div>	