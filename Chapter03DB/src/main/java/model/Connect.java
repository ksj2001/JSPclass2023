package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Connect {
	// mySQL 접속 시 필요한 멤버변수
		String id = "root"; // db 아이디
	    String pw = "12345678"; // db 패스워드
	    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
	    
	    Connection con; // db 접속
	    PreparedStatement pstmt; // 쿼리 실행
	    ResultSet rs; // 쿼리 실행으로 반환받은 값을 자바에 저장
	    
	    // getCon 메서드 생성
	    public void getCon() {
	    	    
		    	    	
	    	try {
	    		Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속
	    		// db의 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다.
	        	con = DriverManager.getConnection(url, pw, id);
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    }
}
