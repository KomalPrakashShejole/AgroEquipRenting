package com.r3sys.project;
import java.sql.*;
public class ConnectDB 
{
	static Connection con = null;
	public static Connection connect()
	{
		if(con==null)
	  {
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/f", "root", "");
		} 
		catch (Exception e) 
		{
			System.err.println("Something went wrong!!!");
			e.printStackTrace();
		}
	  }
		return con;
	}
}
