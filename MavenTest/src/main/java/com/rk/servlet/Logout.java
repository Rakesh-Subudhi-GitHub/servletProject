package com.rk.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rk.entity.Message;

@WebServlet("/logoutPage")
public class Logout extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//read inputs
		PrintWriter pw=null;
						
		//get PrintWriter
		pw=res.getWriter();
						
		//set response content type
		res.setContentType("text/html");
		
		HttpSession ses=req.getSession();
		ses.removeAttribute("CurrentUser");
		
		Message msg = new Message("Logout Successfully","success","alert-success");
		
		ses.setAttribute("msg", msg);
		res.sendRedirect("login.jsp");
		
	}//doGet

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}//doPost

}//class
