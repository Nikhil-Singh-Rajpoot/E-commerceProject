package com.esite.entites;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Service.ServiceProvider;

public class ProductDao {
	
 static SessionFactory factory = ServiceProvider.getFactory();
	
	//Create a method to save products on database 
	public static boolean saveProduct(Product pro) {
		boolean flage = false;
		try {
			Session son = factory.openSession();
			Transaction tx = son.beginTransaction();
			son.save(pro);
			tx.commit();
			son.close();
			flage = true;
		} catch (Exception e) {
			e.printStackTrace();
			flage=false;
		}
		return flage;
	}
	

}
