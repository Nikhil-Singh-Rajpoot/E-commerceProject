package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
	
	
	//Make a method to return only 15 words 
	public static String get10Words(String desc) {
		String res="";
		
		String[] data = desc.split(" ");
		
		if(data.length>10) {
			
			for(int i=0; i<10; i++) {
				res = res+data[i]+" ";
			}
			
		}else {
			return (desc+".....");
		}
		
		return (res+".....");
	}
	
	//Make a method to return total products and users 
	public static Map<String, Long> getCount(SessionFactory factory) {
		Session session = factory.openSession();
		
		String q1 ="Select count(*) from User";
		String q2 = "Select count(*) from Product";
		
		Query query1 = session.createQuery(q1);
		Query query2 = session.createQuery(q2);
		
		Long userCount =(Long)query1.list().get(0);
		Long productCount =(Long)query2.list().get(0);
		
		Map<String, Long> m = new HashMap<String, Long>();
		m.put("user", userCount);
		m.put("product", productCount);
		
		session.close();
		return m;
	}

}
