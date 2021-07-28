package com.rk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rk.entity.User;

public class UserDAO {

	private Connection con;

	//constructor
	public UserDAO(Connection con) {
		this.con = con;
	}
	
	//sql query
	private static final String InsertQuey="INSERT INTO USER(name,email,password,gender,about) VALUES(?,?,?,?,?)";
	private static final String LoginQuery="SELECT * FROM USER WHERE EMAIL =? AND PASSWORD =?";
	private static final String UpdateQuery="UPDATE USER SET NAME=?, EMAIL=?,GENDER=?,ABOUT=?,PROFILE_IMG=? WHERE ID=?";
	private static final String GetUserByUid="SELECT * FROM USER WHERE id=?";

	//method to insert to database
	public boolean saveUser(User user)
	{

		boolean flag=false;
		
		try {
			System.out.println("User Dao under...");
			//user save
			PreparedStatement pstmt = this.con.prepareStatement(InsertQuey);
			
			//set the value
			pstmt.setString(1,user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5, user.getAbout());
			
			//execute the prepared statement
			pstmt.executeUpdate();
			flag=true;
			
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}
		
		return flag;
	}//method
	
	
	
	//get user by email & password
	public User getUserByEmailAndPassword(String email,String password)
	{
		User user=null;
		
	try {
			
			PreparedStatement pstm=con.prepareStatement(LoginQuery);
			
			//set value
			pstm.setString(1,email);
			pstm.setString(2, password);
			
			//execute query
			ResultSet rs = pstm.executeQuery();
			
			//collect value
			if(rs.next())
			{
				user=new User();
				
				Integer id=rs.getInt("id");
				user.setId(id);
				
				String name=rs.getString("name");
				user.setName(name);
					//combine to one line
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile_img(rs.getString("profile_img"));
				user.setRegDate(rs.getDate("regDate"));
				
			}
			
			
		}//try
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}//method
	
	
	
	//update
	public boolean updateUser(User user) {
		boolean flag=false;
		
		try {
			
			PreparedStatement psts=con.prepareStatement(UpdateQuery);
			
			//set value
			psts.setString(1,user.getName());
			psts.setString(2,user.getEmail());
			//psts.setString(3,user.getPassword());
			psts.setString(3,user.getGender());
			psts.setString(4,user.getAbout());
			psts.setString(5,user.getProfile_img());
			psts.setInt(6,user.getId());
			
			//execute ps
			psts.executeUpdate();
			flag=true;
			
		}//try
		
		catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}//method

	public User getUserByUserId(int userid)
	{
		User user=null;
		
		try {
			PreparedStatement ps=con.prepareStatement(GetUserByUid);
			//set value
			ps.setInt(1, userid);
			
			//execute query
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				user=new User();
				
				Integer id=rs.getInt("id");
				user.setId(id);
				
				String name=rs.getString("name");
				user.setName(name);
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setProfile_img(rs.getString("profile_img"));
				user.setRegDate(rs.getDate("regDate"));
			
			}//if
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}//class
