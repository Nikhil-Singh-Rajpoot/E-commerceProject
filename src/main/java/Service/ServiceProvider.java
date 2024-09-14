package Service;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ServiceProvider {

	private static SessionFactory factory;

	// Create a method to get SessionFactory Object
	public static SessionFactory getFactory() {
		try {
			if (factory == null)
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		} catch (Exception e) {
			e.getMessage();
		}
		return factory;
	}
}
