package com.rk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDAO {

	Connection con;	
	
	//constructor
	public LikeDAO(Connection con) {
		this.con = con;
	}

	//sql
	private static final String InsertLike="INSERT INTO LIKETABLE(pid,uid) VALUES(?,?)"; 
	private static final String CountLikeInPost="SELECT COUNT(*) FROM LIKETABLE WHERE pid=?";
	private static final String ISLikedByUser="SELECT * FROM LIKETABLE WHERE pid=? AND uid=?";
	private static final String deleteLike="DELETE FROM LIKETABLE WHERE pid=? AND uid=?";
	
	public boolean InsertLike(int pid,int uid)
	{
	
		boolean flag=false;
		System.out.println("like dao enterd...");
		
		try {
			PreparedStatement ps= con.prepareStatement(InsertLike);
			
			//set value
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			//execute query
			ps.executeUpdate();
			flag=true;
			
		}//try
		catch (Exception e) {
			
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}//method
	
	public int countLikeOnPost(int pid)
	{
		int count=0;
		
		try {
			
			PreparedStatement ps=con.prepareStatement(CountLikeInPost);
			
			//set value
			ps.setInt(1, pid);
			
			//execute query
			ResultSet rs = ps.executeQuery();
			
			//collect
			if(rs.next())
			{
				//count=rs.getInt(0);
				count=rs.getInt("COUNT(*)");
			}
			
		}//try
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}//method
	
	public boolean isLikedByUser(int pid, int uid)
	{
		boolean flag=false;
		try {
			PreparedStatement ps=con.prepareStatement(ISLikedByUser);
			
			//set value
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			//execute Query
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				flag=true;
			}
			else
			{
				flag=false;
			}
			
		}//try
		catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public boolean deleteLike(int pid, int uid)
	{
		boolean flag=false;
		try {
			PreparedStatement ps=con.prepareStatement(deleteLike);
			//set value
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			//execute query
			ps.executeUpdate();
			flag =true;
			
		}//try
		catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}//method
	
}//class
