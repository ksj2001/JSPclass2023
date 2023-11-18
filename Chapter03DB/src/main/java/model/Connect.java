package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Connect {
	// mySQL 접속 시 필요한 멤버변수
		
	    
	    
	    
	    // getCon 메서드 생성
	    public static Connection getCon() {
	    	    
		    	    	
	    	try {
	    		String id = "root"; // db 아이디
	    	    String pw = "12345678"; // db 패스워드
	    	    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
	    	    
	    		Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속
	    		// db의 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다.
	        	return DriverManager.getConnection(url, id, pw);
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	return null;
	    }
}
