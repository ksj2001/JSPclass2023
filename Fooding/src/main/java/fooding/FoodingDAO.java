package fooding;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import com.mysql.cj.xdevapi.Statement;

public class FoodingDAO {
	// java에 db를 connect해준다. Connection하기 위해서 MySQL 드라이브명을 Class.forName에 입력한다.
    String id = "root"; // db 아이디
    String pw = "12345678"; // db 패스워드
    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
    
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    
    public void getCon() {
		/*
		 * try{ Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속 // db의
		 * 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다. con = DriverManager.getConnection(url,
		 * id, pw); }catch(Exception e){ e.printStackTrace(); } return con;
		 */
    	try {
			Context init = new InitialContext();
			Context ex = (Context) init.lookup("java:comp/env");
			DataSource ds = (DataSource) ex.lookup("jdbc/pool");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
    }
    
    public void insertFooding(FoodingBean fbean) {
    	getCon();
    	try {
    		// 쿼리 실행 준비 작업
    		String sql = "insert into fooding (name,id,pw,tel,email,address) values(?,?,?,?,?,?)";
        	// 쿼리를 사용하도록 설정
            PreparedStatement pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        	// 데이터 연결
            pstmt.setString(1, fbean.getName());
        	pstmt.setString(2, fbean.getId());
        	pstmt.setString(3, fbean.getPw());
        	pstmt.setString(4, fbean.getTel());
        	pstmt.setString(5, fbean.getEmail());
        	pstmt.setString(6, fbean.getAddress());
        	// 쿼리 실행 : insert,update,delete는 executeUpdate를 이용하여 실행한다.
        	pstmt.executeUpdate();
        	// 자원 반납 : connection 종료
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se){
    			se.printStackTrace();
    		}
    	}
    }
    
    
//  회원으로 가입한 한 사람의 아이디를 추출하는 메서드 작성
    public String oneCheckId(String id) {
    	getCon();
    	String checkId = "";
    	try {
//    		조건이 id와 같은 아이디 추출
    		String sql = "select id from fooding where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			checkId = rs.getString(1);
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se){
    			se.printStackTrace();
    		}
    	}
    	return checkId;
    }
    
    public String onePassword(String id) {
    	getCon();
    	String password = "";
    	try {
    		String sql = "select pw from fooding where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			password = rs.getString(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se){
    			se.printStackTrace();
    		}
    	}
    	return password;
    }
    
 // 가입한 회원의 모든 정보를 출력하는 메서드 작성
    public ArrayList<FoodingBean> allMembers(){
    	getCon();
    	ArrayList<FoodingBean> aList = new ArrayList<>(); // FoodingBean이 자료형인 ArrayList 객체 생성
    	
    	try{
    		String sql = "select * from fooding";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			FoodingBean fb = new FoodingBean(); // 빈 클래스 생성
    			fb.setName(rs.getString(1));
    			fb.setId(rs.getString(2));
    			fb.setPw(rs.getString(3));
    			fb.setTel(rs.getString(4));
    			fb.setEmail(rs.getString(5));
    			fb.setAddress(rs.getString(6));
    			aList.add(fb);
    		}
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
}
