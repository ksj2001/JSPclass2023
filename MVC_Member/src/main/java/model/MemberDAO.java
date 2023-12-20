package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
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
	
	public void insertMember(MemberDTO mdto) {
		getConnect();
		try {
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getTel());
			pstmt.setString(5, mdto.getHobby());
			pstmt.setString(6, mdto.getJob());
			pstmt.setString(7, mdto.getAge());
			pstmt.setString(8, mdto.getInfo());
			pstmt.executeUpdate();
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
	
	public String getOneId(String id) {
		getConnect();
		String checkId = "";
		try {
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkId = rs.getString(1);
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
		return checkId;
	}
	
	public ArrayList<MemberDTO> getAllMember(){
		getConnect();
		ArrayList<MemberDTO> a = new ArrayList<>();
		try {
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPw(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				a.add(mdto);
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
}
