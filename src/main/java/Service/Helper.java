package Service;

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

}
