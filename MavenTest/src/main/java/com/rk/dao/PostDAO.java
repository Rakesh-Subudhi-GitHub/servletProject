package com.rk.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.rk.entity.Category;
import com.rk.entity.Post;

public class PostDAO {

	Connection con;

	//constructor
	public PostDAO(Connection con) {
		this.con = con;
	}
	
	//sql query
	private static final String getCategory="SELECT * FROM CATEGORIES";
	private static final String InsetPost="INSERT INTO POST(ptitle,pcontent,pcode,pic,catid,userid) VALUES(?,?,?,?,?,?)"; 
	private static final String GetAllPost="SELECT * FROM POST ORDER BY PID DESC";
	private static final String GetPostByCatId="SELECT * FROM POST WHERE catid=?";
	private static final String getPostByPid="SELECT * FROM POST WHERE pid=?";
	
	
	public ArrayList<Category> getAllCategory()
	{
		ArrayList<Category> list=new ArrayList<Category>();
		
		try {
			
			Statement st= con.createStatement();
			ResultSet rs=st.executeQuery(getCategory);
			
			while(rs.next())
			{
				//collect the o/p
				int cid=rs.getInt("cid");
				String cname=rs.getString("name");
				String description=rs.getString("description");
				
				//set the category obj
				Category cat=new Category(cid, cname, description);
				
				//finaly add the arraylist
				list.add(cat);
				
			}//while
			
			}//try
		
			catch (Exception e) {
				e.printStackTrace();
			}
		

		return list;

	}//method
	
	public boolean savePost(Post post) {
		boolean flag=false;
		
		try {
			
			PreparedStatement pstm=con.prepareStatement(InsetPost);
			//set value
			pstm.setString(1, post.getPtitle());
			pstm.setString(2, post.getPcontent());
			pstm.setString(3, post.getPcode());
			pstm.setString(4, post.getPic());
			pstm.setInt(5, post.getCatid());
			pstm.setInt(6, post.getUid());
			
			//execute query
			pstm.executeUpdate();
			
			flag=true;
			
		}//try
		catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}//method
	
	public List<Post> getAllPost(){
		
		ArrayList<Post> list=new ArrayList();
		
		try {
			PreparedStatement ps=con.prepareStatement(GetAllPost);
			
			//execute query
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode =rs.getString("pcode");
				String pic=rs.getString("pic");
				Date pdate=rs.getDate("pdate");
				int catid=rs.getInt("catid");
				int uid=rs.getInt("userid");
				
				//set the post 	
				Post post=new Post(pid, ptitle, pcontent, pcode, pic,pdate, catid, uid);
				
				//add the list
				list.add(post);
				
			}//while
			
		}//try
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}//method
	
	
	public List<Post> getPostByCatId(int catId)
	{
	  List<Post> list=new ArrayList();
	  
	  try {
		  PreparedStatement ps= con.prepareStatement(GetPostByCatId);
		  
		  //set value
		  ps.setInt(1, catId);
		  
		  //execute query
		  ResultSet rs = ps.executeQuery();
		  
		  while(rs.next())
			{
				int pid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode =rs.getString("pcode");
				String pic=rs.getString("pic");
				Date pdate=rs.getDate("pdate");
				int catid=rs.getInt("catid");
				int uid=rs.getInt("userid");
				
				//set the post 	
				Post post=new Post(pid, ptitle, pcontent, pcode, pic,pdate, catid, uid);
				
				//add the list
				list.add(post);
				
			}//while
			
		  
	  }//try
	  catch (Exception e) {
		e.printStackTrace();
	}
	  
	  return list;
	}//method

	
	public Post getPostByPid(int postId)
	{
		 Post post=null;
		 
		  try {
			  PreparedStatement ps= con.prepareStatement(getPostByPid);
			  
			  //set value
			  ps.setInt(1, postId);
			  
			  //execute query
			  ResultSet rs = ps.executeQuery();
			  
			  while(rs.next())
				{
					int pid=rs.getInt("pid");
					String ptitle=rs.getString("ptitle");
					String pcontent=rs.getString("pcontent");
					String pcode =rs.getString("pcode");
					String pic=rs.getString("pic");
					Date pdate=rs.getDate("pdate");
					int catid=rs.getInt("catid");
					int uid=rs.getInt("userid");
					
					//set the post 	
					post=new Post(pid, ptitle, pcontent, pcode, pic,pdate, catid, uid);
					
					
				}//while
				
			  
		  }//try
		  catch (Exception e) {
			e.printStackTrace();
		}
		  
		  return post;
		
	}//method
	
}//class
