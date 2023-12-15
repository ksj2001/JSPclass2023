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
    
    // CarReserveTable에 예약 정보를 Insert하는 메서드
    public void carReserveInsert(CarReserveBean bean) {
    	getCon();
    	try {
    		String sql = "insert into carreserve values(null,?,?,?,?,?,?,?,?,?)";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setInt(1, bean.getNo());
    		pstmt.setString(2, bean.getId());
    		pstmt.setInt(3, bean.getCarcnt());
    		pstmt.setInt(4, bean.getDday());
    		pstmt.setString(5, bean.getRday());
    		pstmt.setInt(6, bean.getUsein());
    		pstmt.setInt(7, bean.getUsewifi());
    		pstmt.setInt(8, bean.getUsenavi());
    		pstmt.setInt(9, bean.getUsebaby());
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
    
    // RentCarTable + CarReserveTable의 필요한 필드명만 join하여 예약 확인 목록을 출력하는 메서드
    public ArrayList<CarViewBean> getReserveList(String id){
    	getCon();
    	ArrayList<CarViewBean> a = new ArrayList<>();
    	try {
    		String sql = "SELECT * FROM rentcar r JOIN carreserve c ON r.no = c.no where id=? and current_date()<= rday";
    		pstmt = con.prepareStatement(sql);
    		pstmt.setString(1, id);
    		rs = pstmt.executeQuery();
    		while(rs.next()) {
    			CarViewBean vbean = new CarViewBean();
    			vbean.setNo(rs.getInt(1));
    			vbean.setName(rs.getString(2));
    			vbean.setPrice(rs.getInt(4));
    			vbean.setImg(rs.getString(7));
    			vbean.setCarcnt(rs.getInt(12));
    			vbean.setDday(rs.getInt(13));
    			vbean.setRday(rs.getString(14));
    			vbean.setUsein(rs.getInt(15));
    			vbean.setUsewifi(rs.getInt(16));
    			vbean.setUsenavi(rs.getInt(17));
    			vbean.setUsebaby(rs.getInt(18));
    			a.add(vbean);
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
    
    // 차량번호가 같은 CarReserve 테이블의 레코드를 삭제하는 메서드
    public void deleteReserve(int no) {
    	getCon();
    	try {
    		String sql = "delete from carreserve where no=?";
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
}
