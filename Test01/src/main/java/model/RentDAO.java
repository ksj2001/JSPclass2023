package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentDAO {
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
    
    // 한 사람의 pw를 가져오는 메서드
    public String getMemberPw(String id) {
    	getCon();
    	String pw = "";
    	try {
    		String sql = "select pw from member where id=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			pw = rs.getString(1);
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
    	return pw;
    }
    
    // 모든 자동차 정보를 가져오는 메서드
    public ArrayList<RentDTO> getAllCar(){
    	getCon();
    	ArrayList<RentDTO> a = new ArrayList<>();
    	try {
    		String sql = "select * from rentcar order by no desc";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			RentDTO rdto = new RentDTO();
    			rdto.setNo(rs.getInt(1));
    			rdto.setName(rs.getString(2));
    			rdto.setCategory(rs.getInt(3));
    			rdto.setPrice(rs.getInt(4));
    			rdto.setUsepeople(rs.getInt(5));
    			rdto.setCompany(rs.getString(6));
    			rdto.setImg(rs.getString(7));
    			rdto.setInfo(rs.getString(8));
    			a.add(rdto);
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
    
    // 하나의 자동차 정보를 가져오는 메서드
    public RentDTO getOneCar(int no) {
    	getCon();
    	RentDTO rdto = new RentDTO();
    	try {
    		String sql = "select * from rentcar where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, no);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			rdto.setNo(rs.getInt(1));
    			rdto.setName(rs.getString(2));
    			rdto.setCategory(rs.getInt(3));
    			rdto.setPrice(rs.getInt(4));
    			rdto.setUsepeople(rs.getInt(5));
    			rdto.setCompany(rs.getString(6));
    			rdto.setImg(rs.getString(7));
    			rdto.setInfo(rs.getString(8));
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
    	return rdto;
    }
}
