package com.esite.servlets;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.esite.entites.User;

import Service.ServiceProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			
			/* Here you can validate your form in server side */
			
			try {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");
				/* Here we add all data in user class */
				
				User user = new User(userName, userEmail, userPassword, userPhone, "Default.jpg", userAddress,"normal");
				//Here we create Hibernate session factory 
				Session hibernateSession = ServiceProvider.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				int userId = (int) hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Registration Seccessful !! User Id is :: "+userId);
				response.sendRedirect("registration.jsp");
				return;
				
			} catch (Exception e) {
				e.printStackTrace();
				}
	}

}
