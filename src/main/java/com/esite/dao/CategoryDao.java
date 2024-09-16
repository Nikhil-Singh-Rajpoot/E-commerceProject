package com.esite.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.esite.entites.Category;

import Service.ServiceProvider;

public class CategoryDao {
	
	static SessionFactory factory = ServiceProvider.getFactory();
	
	//Write a method to save data into databse 
	public static int saveCategory(Category category) {
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		int save= (int)session.save(category);
		
		tx.commit();
		session.close();
		return save;
	}
	
	
	//Write a method to get all category
	public List<Category> getCategory(){
		Session sess = factory.openSession();
		Query query = sess.createQuery("from Category");
		List<Category> list = query.list();
		sess.close();
		return list;
	}
	
	//Write a method to get Category by Id
	public static Category getCategoryById(int catId) {
		
		Category category=null;
		try {
			Session session = factory.openSession();
			category = session.get(Category.class, catId);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

}
