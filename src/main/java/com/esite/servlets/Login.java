package com.esite.servlets;

import java.io.IOException;

import com.esite.dao.UserDao;
import com.esite.entites.User;

import Service.ServiceProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");

		// Authentication here
		UserDao dao = new UserDao(ServiceProvider.getFactory());
		User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
		HttpSession httpSession = request.getSession();
		if (user == null) {
			httpSession.setAttribute("message", "Invaid Login Email and Password !!");
			response.sendRedirect("login.jsp");
			return;
		} else {
			httpSession.setAttribute("current-user", user);
			if (user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			} else if (user.getUserType().equals("normal")) {
				response.sendRedirect("normal.jsp");
			}
		}
	}

}
