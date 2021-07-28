package com.rk.helper;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.DriverManager;

//single-ton class
public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			//single ton
			if(con==null)
			{
				//driver class load
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//establish the connection
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techbar","root","root");
				
				
			}//if
			
		}//try
		
		catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		
		return con;
	}
}//class
