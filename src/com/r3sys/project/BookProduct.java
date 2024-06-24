package com.r3sys.project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookProduct
 */
public class BookProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookProduct() {
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
		String prodname = request.getParameter("prodname");
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        String mob = request.getParameter("mob");
        String email = request.getParameter("email");
        try
        {
         Connection con = ConnectDB.connect();
         PreparedStatement ps1 = con.prepareStatement("insert into book_tbl values(?, ?, ?, ?, ?)");
         ps1.setString(1, prodname);
         ps1.setString(2, name);
         ps1.setString(3, mob);
         ps1.setString(4, city);
         ps1.setString(5, email);
         int i = ps1.executeUpdate();
         if(i==1)
         {
        	 response.sendRedirect("adminpanel.html");
        	 
         }
         else
         {
        	 response.sendRedirect("bookProducts.html");
         }
        }
         catch (Exception e) 
         {
             e.printStackTrace();
             
         }
     

}

}