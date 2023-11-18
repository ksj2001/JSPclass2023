package model;
// mySQL의 select,insert,update,delete를 연결하여 사용하는 메서드

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO{
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
	
	Connection con = Connect.getCon(); // db 접속
    PreparedStatement pstmt; // 쿼리 실행
    ResultSet rs; // 쿼리 실행으로 반환받은 값을 자바에 저장
    
    // 한 사람의 정보만 insert하는 메서드 작성
    public void insertMember(MemberBean mbean) {
    	try {
    		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
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
    
    // 가입한 회원의 모든 정보를 출력하는 메서드 작성
    public ArrayList<MemberBean> allMembers(){
    	ArrayList<MemberBean> aList = new ArrayList<>(); // MemberBean이 자료형인 ArrayList 객체 생성
    	
    	try{
    		// 1. 쿼리 구문
    		String sql = "select * from member";
    		// 2. 쿼리 구문 실행 준비
    		pstmt = con.prepareStatement(sql);
    		// 3. select한 결과값을 자바에 저장하는 ResultSet 객체를 사용
    		rs = pstmt.executeQuery();
    		// 4. 반복문을 이용하여 자료를 MemberBean에 add
    		while(rs.next()) {
    			MemberBean mb = new MemberBean(); // 빈 클래스 생성
    			mb.setId(rs.getString(1));
    			mb.setPw(rs.getString(2));
    			mb.setEmail(rs.getString(3));
    			mb.setTel(rs.getString(4));
    			mb.setHobby(rs.getString(5));
    			mb.setJob(rs.getString(6));
    			mb.setAge(rs.getString(7));
    			mb.setInfo(rs.getString(8));
    			aList.add(mb);
    		}
    		con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	return aList;
    }
    
    
    // 한 사람의 모든 정보를 출력하는 메서드
    public MemberBean memberDetail(String id) {
    	MemberBean mb = new MemberBean();
    	
    	try {
    		String sql = "select * from member where id=?";
    		pstmt = con.prepareStatement(sql);
    		// 물음표(?)에 대한 맵핑
    		pstmt.setString(1, id);
    		// select문은 반드시 ResultSet 객체의 값 반환
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			mb.setId(rs.getString(1));
    			mb.setPw(rs.getString(2));
    			mb.setEmail(rs.getString(3));
    			mb.setTel(rs.getString(4));
    			mb.setHobby(rs.getString(5));
    			mb.setJob(rs.getString(6));
    			mb.setAge(rs.getString(7));
    			mb.setInfo(rs.getString(8));
    		}
    		con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return mb;
    }
    
}
