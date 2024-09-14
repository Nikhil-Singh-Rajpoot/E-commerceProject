package com.esite.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.esite.entites.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// Creating a method to return User if Exist on database
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		Session session = factory.openSession();
		String query = "from User where user_email=: e and user_password=: p";
		Query q = session.createQuery(query);
		q.setParameter("e", email);
		q.setParameter("p", password);
		user = (User) q.uniqueResult();
		session.close();
		return user;
	}

}
