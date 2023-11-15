package model;
// mySQL의 select,insert,update,delete를 연결하여 사용하는 메서드

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO extends Connect{
	/*
	 * // mySQL 접속 시 필요한 멤버변수 String id = "root"; // db 아이디 String pw = "12345678";
	 * // db 패스워드 String url =
	 * "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
	 * 
	 * Connection con; // db 접속 PreparedStatement pstmt; // 쿼리 실행 ResultSet rs; //
	 * 쿼리 실행으로 반환받은 값을 자바에 저장
	 * 
	 * // getCon 메서드 생성 public void getCon() { try {
	 * Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속 // db의 아이디,
	 * 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다. con = DriverManager.getConnection(url, id,
	 * pw); }catch(Exception e){ e.printStackTrace(); } }
	 */
	
	
    
    // 한 사람의 정보만 insert하는 메서드 작성
    public void insertMember(MemberBean mbean) {
    	getCon();
    	try {
    		PreparedStatement pstmt = con.prepareStatement("insert into member values(?,?,?,?,?,?,?,?)");
        	pstmt.setString(1, mbean.getId());
        	pstmt.setString(2, mbean.getPw());
        	pstmt.setString(3, mbean.getEmail());
        	pstmt.setString(4, mbean.getTel());
        	pstmt.setString(5, mbean.getHobby());
        	pstmt.setString(6, mbean.getJob());
        	pstmt.setString(7, mbean.getAge());
        	pstmt.setString(8, mbean.getInfo());
        	
        	// 쿼리 실행 : insert,update,delete는 executeUpdate를 이용하여 실행한다.
        	pstmt.executeUpdate();
        	
        	// 자원 반납 : connection 종료
        	con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    
    
}
