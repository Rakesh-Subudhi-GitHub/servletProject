package com.rk.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.rk.dao.PostDAO;
import com.rk.entity.Post;
import com.rk.entity.User;
import com.rk.helper.ConnectionProvider;
import com.rk.helper.Helper;

@WebServlet("/addpost")
@MultipartConfig
public class AddPost extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//read inputs
		PrintWriter pw=null;
								
		//get PrintWriter
		pw=res.getWriter();
								
		//set response content type
		res.setContentType("text/html");
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String code=req.getParameter("code");
		Integer cid=Integer.parseInt(req.getParameter("cid"));
		
		Part part=req.getPart("pic");
		
		String pic=part.getSubmittedFileName();
		
		//getting User details for which user it post it
		//so use session to collect the user details
		HttpSession ses=req.getSession();
		User user=(User)ses.getAttribute("CurrentUser");
		
		Integer id=user.getId();
		System.out.println("user id : "+id);
		
		//transfer all value to the post entity
		Post post=new Post(title, content, code, pic, cid, id);
		
		//save the post data in database help of DAO
		PostDAO dao=new PostDAO(ConnectionProvider.getConnection());
		boolean savePost = dao.savePost(post);
		
		if(savePost) {
		
			//save the photo                  //foldername to take it
			String path=req.getRealPath("/")+"postPic"+File.separator+pic;//file name is set to (pic)
			Helper.saveFile(part.getInputStream(), path);
			
			
			pw.println("done");
			
		}//if
		else {
			pw.print("some problem here..");
		}
		
	}//doGet
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}//doPost

}//class
