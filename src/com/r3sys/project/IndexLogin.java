package com.r3sys.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class IndexLogin
 */
public class IndexLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexLogin() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try
		{
			Connection con = ConnectDB.connect();
			PreparedStatement ps1 = con.prepareStatement("select * from user_tbl where email = ? and password = ?");
			ps1.setString(1, email);
			ps1.setString(2, password);
			ResultSet rs1 = ps1.executeQuery();
			
				if(rs1.next())
				{
					Mail.setEmail(email);
					response.sendRedirect("adminpanel.html");
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
