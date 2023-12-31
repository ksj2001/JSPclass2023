package model;
// mySQL의 select,insert,update,delete를 연결하여 사용하는 메서드

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO{
	
	Connection con ; // db 접속
    PreparedStatement pstmt; // 쿼리 실행
    ResultSet rs; // 쿼리 실행으로 반환받은 값을 자바에 저장
    
	// ConnectionPool의 외부 자원을 가지고 오는 메서드를 만든다.
	public void getConnect() {
		try {
			Context init = new InitialContext();
			Context ex = (Context) init.lookup("java:comp/env");
			DataSource ds = (DataSource) ex.lookup("jdbc/pool");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
    // 한 사람의 정보만 insert하는 메서드 작성
    public void insertMember(MemberBean mbean) {
    	getConnect();
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
        	// con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    		    if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // 가입한 회원의 모든 정보를 출력하는 메서드 작성
    public ArrayList<MemberBean> allMembers(){
    	getConnect();
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
    		// con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    		    if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	
    	
    	return aList;
    }
    
    
    // 한 사람의 모든 정보를 출력하는 메서드
    public MemberBean memberDetail(String id) {
    	getConnect();
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
    		// con.close();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    		    if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return mb;
    }
    
    // 회원으로 가입한 한 사람의 패스워드를 추출하는 메서드
    public String onePassword(String id) {
    	getConnect();
    	String password="";
    	try {
    		// select문을 이용하여 아이디가 같은 패스워드를 추출한다.
    		String sql = "select pw from member where id=?";
    		// 위에서 받은 sql문을 실행하기 위해 connection 연결
    		pstmt = con.prepareStatement(sql);
    		// 실행하고 싶은 값을 세팅값으로 지정한다.(단, 자료형에 유의하자!)
    		pstmt.setString(1, id);
    		// sql문이 select문일 때에는 반드시 ResultSet에 담아서 java에 저장
    		// select문은 executeQuery(), 그 이외의 insert,delete,update문은 executeUpdate()로 실행
    		rs = pstmt.executeQuery();
    		// rs에 담긴 값이 null이 아닐 경우, 위에서 찾은 값을 변수 password에 넣어준다.
    		if(rs.next()) {
    			password = rs.getString(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			// 사용한 자원은 반드시 반납한다.
    		    if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	
    	return password;
    	
    }
    
    // 이메일과 전화번호를 수정하는 메서드를 작성
    public void updateInfo(MemberBean mbean) {
    	getConnect();
    	
    	try {
    		
    		String sql = "update member set email=?,tel=? where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, mbean.getEmail());
    		pstmt.setString(2, mbean.getTel());
    		pstmt.setString(3, mbean.getId());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		try {
    		    if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // 한 사람의 정보를 삭제하는 메서드
    public void deleteInfo(String id) {
    	getConnect();
    	
    	try {
    		String sql = "delete from member where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
}
