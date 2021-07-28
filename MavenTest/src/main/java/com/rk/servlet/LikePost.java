package com.rk.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rk.dao.LikeDAO;
import com.rk.helper.ConnectionProvider;

@WebServlet("/like")
public class LikePost extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//read inputs
		PrintWriter pw=null;
								
		//get PrintWriter
		pw=res.getWriter();
								
		//set response content type
		res.setContentType("text/html");
		
		String operation=req.getParameter("operation");
		int pid=Integer.parseInt(req.getParameter("pid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		
		System.out.println("Operation : "+operation);
		System.out.println("pid : "+pid);
		System.out.println("uid : "+uid);
		
		//pw.println(operation);
		//pw.println(uid);
		//pw.println(pid);
		
		LikeDAO dao=new LikeDAO(ConnectionProvider.getConnection()); 
		
		if(operation.trim().equals("like"))
		{
			boolean liked = dao.InsertLike(pid, uid);
			
			pw.println(liked);
			System.out.println(liked);
		}
		
	}//doGet

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}//doPost

}
