package com.r3sys.project;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import com.r3sys.project.ConnectDB;
import com.r3sys.project.Mail;

/**
 * Servlet implementation class AddProduct
 */
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
        String mob = request.getParameter("mob");
        String city = request.getParameter("city");
        String price = request.getParameter("price");
        String deposit = request.getParameter("deposit");
        String imgurl = request.getParameter("imgurl");
        String email = Mail.getEmail();
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null)
            {
        	    System.out.println("filePart.getName()");
        	    System.out.println("filePart.getSize()");
        	    System.out.println("filePart.getContentType()");
                inputStream = filePart.getInputStream();
            }
              // String email = Mail.getEmail();
       try
           {
            Connection con = ConnectDB.connect();
            PreparedStatement ps1 = con.prepareStatement("insert into product_tbl values(?, ?, ?, ?, ?, ?, ?, ?)");
            ps1.setInt(1, 0);
            ps1.setString(2, prodname);
            ps1.setString(3, mob);
            ps1.setString(4, city);
            ps1.setString(5, price);
            ps1.setString(6, deposit);
            ps1.setString(7, imgurl);
            ps1.setString(8, email);
            if (inputStream != null) 
            {
                ps1.setBinaryStream(7, inputStream, inputStream.available());
            }
            int i = ps1.executeUpdate();
            if(i==1)
            {
            	 email = Mail.getEmail();
            	 response.sendRedirect("adminpanel.html");
            }
            else
            {
            	 response.sendRedirect("failed.html");
            }
           }
        
        catch (Exception e) 
        {
            e.printStackTrace();
            
        }
	}

}
