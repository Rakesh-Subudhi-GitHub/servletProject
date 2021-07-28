package com.rk.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rk.dao.UserDAO;
import com.rk.entity.User;
import com.rk.helper.ConnectionProvider;

@WebServlet("/regUser")
@MultipartConfig  //any type of data is can access the servlet
public class Register extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		//read inputs
		PrintWriter pw=null;
		
		 //get PrintWriter
		pw=res.getWriter();
		
		//set response content type
		res.setContentType("text/html");
		
		String name=req.getParameter("user_name");
		String email=req.getParameter("user_email");
		String password=req.getParameter("user_password");
		String gender=req.getParameter("gender");
		String about=req.getParameter("user_about");
		String check=req.getParameter("check");
	
		
		System.out.println("name : "+name);
		System.out.println("email : "+email);
		System.out.println("password : "+password);
		System.out.println("gender : "+gender);
		System.out.println("about : "+about);
		System.out.println("check : "+check);
		
		if(check==null)
		{
			pw.println("Please Agree Term and Condistion ");
		}
		else {
			
			//create User obj
			User user=new User();
		
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setAbout(about);
			user.setGender(gender);
			user.setProfile_img("deafult.png");
			
		//create UserDao obj
		UserDAO dao=new UserDAO(ConnectionProvider.getConnection());
		boolean saveUser = dao.saveUser(user);
		
		if(saveUser) {
			pw.print("Done");
			}
		else {
			pw.println("Something Went Wrong..");
		}
	}//else
}//doGet

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}//doPost

}//class
