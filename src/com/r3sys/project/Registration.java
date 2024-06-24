package com.r3sys.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String mob = request.getParameter("mob");
		String city = request.getParameter("city");
		String password = request.getParameter("password");
		
		try
		{
			Connection con = ConnectDB.connect();
			PreparedStatement ps1 = con.prepareStatement("insert into user_tbl values(?, ?, ?, ?, ?, ?)");
			ps1.setInt(1, 0);
			ps1.setString(2, username);
			ps1.setString(3, email);
			ps1.setString(4, mob);
			ps1.setString(5, city);
			ps1.setString(6, password);
			int i = ps1.executeUpdate();
			if(i==1)
			{
				response.sendRedirect("index.html");
			}
			else
			{
				response.sendRedirect("failed.html");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
