package com.esite.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.esite.entites.Product;
import Service.ServiceProvider;

public class ProductDao {

	static SessionFactory factory = ServiceProvider.getFactory();

	// Create a method to save products on database
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
			flage = false;
		}
		return flage;
	}
	
	//Write a method to get all products
		public static List<Product> getProducts(){
			Session sess = factory.openSession();
			Query query = sess.createQuery("from Product");
			List<Product> list = query.list();
			sess.close();
			return list;
		}
		
		//Write a method to get all products by category
				public static List<Product> getProductsByCatId(int catId){
					Session sess = factory.openSession();
					Query query = sess.createQuery("from Product as p where p.category.categoryId =: id");
					query.setParameter("id", catId);
					List<Product> list = query.list();
					sess.close();
					return list;
				}

}
