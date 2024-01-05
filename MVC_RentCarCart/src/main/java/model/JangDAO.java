package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JangDAO {
	Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    
    public void getCon() {
    	try {
			Context init = new InitialContext();
			Context ex = (Context) init.lookup("java:comp/env");
			DataSource ds = (DataSource) ex.lookup("jdbc/pool");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
    }
    
    // rentjang 테이블에 insert하는 메서드
    public void insertJang(JangDTO jdto) {
    	getCon();
    	try {
    		String sql = "insert into rentjang values(?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, jdto.getNo());
    		pstmt.setString(2, jdto.getImg());
    		pstmt.setString(3, jdto.getName());
    		pstmt.setInt(4, jdto.getCnt());
    		pstmt.setInt(5, jdto.getPrice());
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
    
    // 모든 장바구니 정보를 return하는 메서드
    public ArrayList<JangDTO> getAllJang() {
    	getCon();
    	ArrayList<JangDTO> a = new ArrayList<>();
    	try {
    		String sql = "select * from rentjang";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			JangDTO jdto = new JangDTO();
    			jdto.setNo(rs.getInt(1));
    			jdto.setImg(rs.getString(2));
    			jdto.setName(rs.getString(3));
    			jdto.setCnt(rs.getInt(4));
    			jdto.setPrice(rs.getInt(5));
    			a.add(jdto);
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
    	return a;
    }
    
    // no에 해당하는 상품이 존재하는지 개수를 세는 메서드
    // rentjang 테이블에 데이터가 존재하는지 여부를 확인하는 메서드
    public int getNoCount(int no) {
    	getCon();
    	int count = 0;
    	try {
    		String sql = "select count(*) from rentjang where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, no);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			count = rs.getInt(1);
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
    	return count;
    }
    
    // rentjang 테이블에 데이터가 존재할 경우, cnt는 1씩 증가한다.
    public void updateCnt1(int cnt, int no) {
    	getCon();
    	try {
    		String sql = "update rentjang set cnt=cnt+? where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, cnt);
    		pstmt.setInt(2, no);
    		pstmt.executeUpdate();
    		System.out.println(cnt);
    		System.out.println(no);
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
    
    public void updateCnt2(int cnt,int no) {
    	getCon();
    	try {
    		String sql = "update rentjang set cnt=? where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, cnt);
    		pstmt.setInt(2, no);
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
    
    // rentjang에서 선택한 항목들을 삭제하는 메서드
    public void deleteJang(int no) {
    	getCon();
    	try {
    		String sql = "delete from rentjang where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, no);
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
    
    // rentjang 테이블에서 주문한 상품 중 하나의 정보를 return
    public JangDTO getJangSelect(int no) {
    	getCon();
    	JangDTO jdto = new JangDTO();
    	try {
    		String sql = "select * from rentjang where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, no);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			jdto.setNo(rs.getInt(1));
    			jdto.setImg(rs.getString(2));
    			jdto.setName(rs.getString(3));
    			jdto.setCnt(rs.getInt(4));
    			jdto.setPrice(rs.getInt(5));
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
    	return jdto;
    }
}
