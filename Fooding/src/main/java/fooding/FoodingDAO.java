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
	/*
	 * String id = "root"; // db 아이디 String pw = "12345678"; // db 패스워드 String url =
	 * "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
	 */    
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
    			fb.setName(rs.getString(2));
    			fb.setId(rs.getString(3));
    			fb.setPw(rs.getString(4));
    			fb.setTel(rs.getString(5));
    			fb.setEmail(rs.getString(6));
    			fb.setAddress(rs.getString(7));
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
    
    // 한 사람의 모든 정보를 출력하는 메서드 작성
    public FoodingBean foodingDetail(String id) {
    	getCon();
    	FoodingBean fb = new FoodingBean();
    	try {
    		String sql = "select * from fooding where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			fb.setName(rs.getString(2));
    			fb.setId(rs.getString(3));
    			fb.setPw(rs.getString(4));
    			fb.setTel(rs.getString(5));
    			fb.setEmail(rs.getString(6));
    			fb.setAddress(rs.getString(7));
    		}
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
    	return fb;
    }
    
    // 이메일, 전화번호, 주소를 수정하는 메서드 작성
    public void updateInfo(FoodingBean fbean) {
    	getCon();
    	try {
    		String sql = "update fooding set email=?,tel=?,address=? where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, fbean.getEmail());
    		pstmt.setString(2, fbean.getTel());
    		pstmt.setString(3, fbean.getAddress());
    		pstmt.setString(4, fbean.getId());
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
    
    // 한 사람의 정보를 삭제하는 메서드 작성
    public void deleteInfo(String id) {
    	getCon();
    	try {
    		String sql = "delete from fooding where id=?";
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
    // fooding 테이블의 name, email, tel을 가지고 오는 메서드 작성
    public FoodingBean foodingMemberJoin(String id) {
    	getCon();
    	FoodingBean fbean = new FoodingBean();
    	
    	try {
    		String sql = "select name,email,tel from fooding where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			fbean.setName(rs.getString(1));
    			fbean.setEmail(rs.getString(2));
    			fbean.setTel(rs.getString(3));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally{
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    	return fbean;
    }
    
    // foodingBoard 테이블에 insert하는 메서드
    public void fInsertBoard(FoodingBoardBean bean) {
    	getCon();
    	int ref = 0;
    	int re_step = 1;
    	String id_key = "";
    	try {
    		String refSql = "select max(ref) from foodingBoard";
    		pstmt = con.prepareStatement(refSql);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			ref = rs.getInt(1)+1;
    		}
    		String sql = "insert into foodingBoard values(null,?,?,?,current_date(),?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, bean.getName());
    		pstmt.setString(2, bean.getSubject());
    		pstmt.setString(3, bean.getPassword());
    		pstmt.setInt(4, ref);
    		pstmt.setInt(5, re_step);
    		pstmt.setString(6, bean.getContent());
    		pstmt.setString(7, bean.getId());
    		pstmt.setString(8, bean.getId_key());
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
    
    // foodingBoard 정보를 모두 출력하는 메서드 작성
    public ArrayList<FoodingBoardBean> getAllBoard(){
    	getCon();
    	ArrayList<FoodingBoardBean> aList = new ArrayList<>(); // FoodingBoardBean이 자료형인 ArrayList 객체 생성
    	try {
    		String sql = "select * from foodingBoard order by ref desc";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()){
    			FoodingBoardBean fbb = new FoodingBoardBean();
    			fbb.setNum(rs.getInt(1));
    			fbb.setName(rs.getString(2));
    			fbb.setSubject(rs.getString(3));
    			fbb.setPassword(rs.getString(4));
    			fbb.setReg_date(rs.getString(5));
    			fbb.setRef(rs.getInt(6));
    			fbb.setRe_step(rs.getInt(7));
    			fbb.setContent(rs.getString(8));
    			fbb.setId(rs.getString(9));
    			fbb.setId_key(rs.getString(10));
    			aList.add(fbb);
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
    
    // Main에 return할 BoardList 메서드 작성(id가 admin123인 경우는 제외)
    public ArrayList<FoodingBoardBean> getAllMainBoard(){
    	getCon();
    	ArrayList<FoodingBoardBean> aList = new ArrayList<>(); // FoodingBoardBean이 자료형인 ArrayList 객체 생성
    	try {
    		String sql = "select * from foodingBoard where id <>'admin123' order by ref desc";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()){
    			FoodingBoardBean fbb = new FoodingBoardBean();
    			fbb.setNum(rs.getInt(1));
    			fbb.setName(rs.getString(2));
    			fbb.setSubject(rs.getString(3));
    			fbb.setPassword(rs.getString(4));
    			fbb.setReg_date(rs.getString(5));
    			fbb.setRef(rs.getInt(6));
    			fbb.setRe_step(rs.getInt(7));
    			fbb.setContent(rs.getString(8));
    			fbb.setId(rs.getString(9));
    			fbb.setId_key(rs.getString(10));
    			aList.add(fbb);
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
    
    // 1:1문의글 한 개의 모든 정보를 출력하는 메서드 작성
    public FoodingBoardBean foodingBoardDetail(String id,String id_key) {
    	getCon();
    	FoodingBoardBean fbb = new FoodingBoardBean();
    	try {
    		String sql = "select * from foodingboard where id=? and id_key=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.setString(2, id_key);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			fbb.setNum(rs.getInt(1));
    			fbb.setName(rs.getString(2));
    			fbb.setSubject(rs.getString(3));
    			fbb.setPassword(rs.getString(4));
    			fbb.setReg_date(rs.getString(5));
    			fbb.setRef(rs.getInt(6));
    			fbb.setRe_step(rs.getInt(7));
    			fbb.setContent(rs.getString(8));
    			fbb.setId(rs.getString(9));
    			fbb.setId_key(rs.getString(10));
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
    	
    	return fbb;
    }
    
    // 1대1문의 게시글을 수정하는 메서드 작성
    public void updateBoardInfo(FoodingBoardBean fbbean) {
    	getCon();
    	try {
    		String sql = "update foodingboard set subject=?,content=?,reg_date=current_date(),password=? where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, fbbean.getSubject());
    		pstmt.setString(2, fbbean.getContent());
    		pstmt.setString(3, fbbean.getPassword());
    		pstmt.setString(4, fbbean.getId());
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally{
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    // 1대1문의 게시글 하나를 삭제하는 메서드 작성
    public void deleteBoardInfo(String id) {
    	getCon();
    	try {
    		String sql = "delete from foodingboard where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally{
    		try {
    			if(con!=null) con.close();
    			if(pstmt!=null) pstmt.close();
    			if(rs!=null) rs.close();
    		}catch(SQLException se) {
    			se.printStackTrace();
    		}
    	}
    }
    
    // 답변 게시글을 foodingboard에 추가하는 메서드 작성
    public void rewriteInsertBoard(FoodingBoardBean fbb) {
    	getCon();
    	
    	int ref = fbb.getRef();
    	int re_step = fbb.getRe_step();
    	
    	try {
    		// 답변글을 쓰면 부모 게시글의 re_step에 4를 더해준다.
    		String restepSql = "update foodingboard set re_step = re_step + 4 where ref=? and re_step=1";
    		pstmt = con.prepareStatement(restepSql);
    		pstmt.setInt(1, ref);
    		pstmt.executeUpdate();
    		
    		// insert
    		String sql = "insert into foodingboard values(null,?,?,?,current_date(),?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, fbb.getName());
    		pstmt.setString(2, fbb.getSubject());
    		pstmt.setString(3, fbb.getPassword());
    		pstmt.setInt(4, ref);
    		pstmt.setInt(5, re_step + 1);
    		pstmt.setString(6, fbb.getContent());
    		pstmt.setString(7, fbb.getId());
    		pstmt.setString(8, fbb.getId_key());
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
