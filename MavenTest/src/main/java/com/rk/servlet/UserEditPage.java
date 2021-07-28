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

import com.rk.dao.UserDAO;
import com.rk.entity.Message;
import com.rk.entity.User;
import com.rk.helper.ConnectionProvider;
import com.rk.helper.Helper;

@WebServlet("/editPage")
@MultipartConfig
public class UserEditPage extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//read inputs
		PrintWriter pw=null;
						
		//get PrintWriter
		pw=res.getWriter();
						
		//set response content type
		res.setContentType("text/html");
				
		String newName=req.getParameter("user_name");
		String newEmail=req.getParameter("user_email");
		String newAbout=req.getParameter("user_about");
		
		System.out.println("Name : "+newName);
		System.out.println("email : "+newEmail);
		System.out.println("about : "+newAbout);
		
		//image uploading
		Part part=req.getPart("image");
		String imgName=part.getSubmittedFileName();
		
		//get the user form the session
		HttpSession ses= req.getSession();
		
		//"CurrentUser" key to collect the user details 
		User user=(User)ses.getAttribute("CurrentUser");
		
		user.setName(newName);
		user.setEmail(newEmail);
		user.setAbout(newAbout);
		
		//collect old file data
		String oldFile=user.getProfile_img();
				
		//new file data set
		user.setProfile_img(imgName);
		
		
		
		//System.out.println("user"+user.toString());
		
		//update the user details
		UserDAO dao=new UserDAO(ConnectionProvider.getConnection());
		boolean updateUser = dao.updateUser(user);
		
		if(updateUser) {
			
		//pw.println("successfully updated");
		
		
			
		//save the profile_pic "/ = current path"
		String path=req.getRealPath("/")+"pic"+File.separator+user.getProfile_img();
		
		
		
		//delete the previous pic 
		String pathOldFile=req.getRealPath("/")+"pic"+File.separator+oldFile;
		
		//protect defalut file bcz it set the default one so check cond
		if(!oldFile.equals("default.png"))
		{
		Helper.deleteFile(pathOldFile);
			//this to use bcz its delete new file data so take oldfile data location then delete old pics
		}
		
		
		//save the new pic
		if(Helper.saveFile(part.getInputStream(), path))
		{
			//success msg 
			Message msg = new Message("Profile Details Update Seccessfully..","success","alert-success");
			
			ses.setAttribute("msg", msg);
		}//if
		else {
			//error image msg 
			Message msg = new Message("Profile Details update but pic not Update Seccessfully..","error","alert-danger");
			
			ses.setAttribute("msg", msg);
		}
		
		}//if
		else
		{
			//error msg 
			Message msg = new Message("Profile Details Not Update Seccessfully..","error","alert-danger");
			
			ses.setAttribute("msg", msg);
		}
		
		res.sendRedirect("user/profile.jsp");
		
	}//doGet
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}//doPost

}//class
