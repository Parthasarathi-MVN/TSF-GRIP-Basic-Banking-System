package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SeparatePerson")
public class SeparatePerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SeparatePerson() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String balance = request.getParameter("balance");
			
			
			
			
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("balance", balance);
			request.getRequestDispatcher("transaction.jsp").forward(request, response);
			
			
			
		
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
