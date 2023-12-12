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
    public ArrayList<CarListBean> getCategory(int category){
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
}
