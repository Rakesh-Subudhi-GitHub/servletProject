package com.rk.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rk.dao.UserDAO;
import com.rk.entity.Message;
import com.rk.entity.User;
import com.rk.helper.ConnectionProvider;

@WebServlet("/loginPage")
public class Login extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//read inputs
		PrintWriter pw=null;
				
		//get PrintWriter
		pw=res.getWriter();
				
		//set response content type
		res.setContentType("text/html");
		
		
		String UserEmail=req.getParameter("email");
		String UserPassword=req.getParameter("password");
		
		System.out.println("Email : "+UserEmail);
		System.out.println("password : "+UserPassword);
		
		UserDAO dao=new UserDAO(ConnectionProvider.getConnection());
		
		User user = dao.getUserByEmailAndPassword(UserEmail, UserPassword);
		
		//cond check
		if(user==null)
		{
			//error msg 
			Message msg = new Message("Invalid Details.. !Try with another","error","alert-danger");
			
			HttpSession ses = req.getSession();
			ses.setAttribute("msg", msg);
			
			res.sendRedirect("login.jsp");
		}
		
		else {
			
			//success
			pw.println("success fully");
			
			//session to store the User data
			HttpSession ses=req.getSession();
			
			ses.setAttribute("CurrentUser", user);//user data set
			
			res.sendRedirect("user/profile.jsp");
			
		}//else
		
		
	}//doGet

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}//doPost

}//class
