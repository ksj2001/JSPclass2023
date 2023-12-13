package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentCarDAO {
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
    
    // 최신순 3대의 자동차를 리턴하는 메서드
    public ArrayList<CarListBean> getSelectCar(){
    	getCon();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	try {
    		String sql = "select * from rentcar order by no desc limit 3";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			CarListBean bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			a.add(bean);
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
    	return a;
    }
    
    // category별 자동차 목록을 return하는 메서드
    public ArrayList<CarListBean> getCategoryCar(int category){
    	getCon();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	try {
    		String sql = "select * from rentcar where category=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, category);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			CarListBean bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			a.add(bean);
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
    	return a;
    }
    
    // category별 자동차 목록을 return하는 메서드
    public ArrayList<CarListBean> getAllCar(){
    	getCon();
    	ArrayList<CarListBean> a = new ArrayList<>();
    	try {
    		String sql = "select * from rentcar";
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			CarListBean bean = new CarListBean();
    			bean.setNo(rs.getInt(1));
    			bean.setName(rs.getString(2));
    			bean.setCategory(rs.getInt(3));
    			bean.setPrice(rs.getInt(4));
    			bean.setUsepeople(rs.getInt(5));
    			bean.setCompany(rs.getString(6));
    			bean.setImg(rs.getString(7));
    			bean.setInfo(rs.getString(8));
    			a.add(bean);
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
    	return a;
    }
    
    // CarList중에서 한 개의 자동차 정보만 저장하는 메서드
    public CarListBean getOneCar(int no) {
    	getCon();
    	CarListBean cbean = new CarListBean();
    	try {
    		String sql = "select * from rentcar where no=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, no);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			cbean.setNo(rs.getInt(1));
    			cbean.setName(rs.getString(2));
    			cbean.setCategory(rs.getInt(3));
    			cbean.setPrice(rs.getInt(4));
    			cbean.setUsepeople(rs.getInt(5));
    			cbean.setCompany(rs.getString(6));
    			cbean.setImg(rs.getString(7));
    			cbean.setInfo(rs.getString(8));
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
    	return cbean;
    }
    
    // 로그인 처리하는 메서드
    public int getLogin(String id,String pw) {
    	getCon();
    	int result = 0;
    	try {
    		String sql = "select count(*) from member where id=? and pw=?";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		pstmt.setString(2, pw);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			result = rs.getInt(1);
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
    	return result;
    }
}
