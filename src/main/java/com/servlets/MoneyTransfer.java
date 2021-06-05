package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.*;
import com.helper.FactoryProvider;

@WebServlet("/MoneyTransfer")
public class MoneyTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MoneyTransfer() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String str = request.getParameter("receiver");
			
			System.out.println(str);
			String[] res = str.split("[,]", 0);
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name  = request.getParameter("name");
			String email = request.getParameter("email");
			int balance = Integer.parseInt(request.getParameter("balance"));
			
			int tr_id = 1000000;
			
			System.out.println(id);
			System.out.println(name);
			System.out.println(email);
			System.out.println(balance);
			
			
			int to_id = Integer.parseInt(res[0]);
			String to_name = res[1];
			String to_email = res[2];
			int to_balance = Integer.parseInt(res[3]);
			
			int send_amt = Integer.parseInt(request.getParameter("send_amt"));
			System.out.println(send_amt);
			

			
			if(send_amt > balance)
			{
				response.sendRedirect("insufficient_balance.jsp");
				System.out.println("you dont have enough balance");
			}
			else if(send_amt <= 0)
			{
				response.sendRedirect("negative_amount.jsp");
			}
			else
			{
				to_balance += send_amt;
				balance = balance-send_amt;

				
				Customer cus = new Customer();
				Customer cus1 = new Customer();
				Transfer tra = new Transfer();
				//cus.setBalance(balance);
				
				Session s = FactoryProvider.getFactory().openSession();
				Transaction tx = s.beginTransaction();
				
				cus = (Customer) s.get(Customer.class,id);
				cus1 = (Customer) s.get(Customer.class, to_id);
				
				cus.setBalance(balance);
				cus1.setBalance(to_balance);
				s.update(cus);
				s.update(cus1);
				
//				tra.setId(xxxx);
				
				tra.setTransfer_amt(send_amt);
				tra.setTo_acc(to_name);
				tra.setFrom_acc(name);
				s.save(tra);
				
				
				tx.commit();
				s.close();

				
				response.sendRedirect("transaction_successful.jsp");
			}
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
