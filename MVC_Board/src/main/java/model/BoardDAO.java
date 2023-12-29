package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
	
	// 전체 게시글의 개수를 출력하는 메서드
	public int getAllCount() {
		getConnect();
		int count = 0;
		try {
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
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
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		return count;
	}
	
	// pageSize를 기준으로 게시글을 return 받아주는 메서드
	public ArrayList<BoardDTO> getAllBoard(int startRow, int pageSize){
		getConnect();
		ArrayList<BoardDTO> a = new ArrayList<>();
		try {
			String sql = "select * from board order by ref desc, re_step asc, re_level asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6).toString());
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setRe_level(rs.getInt(9));
				bdto.setReadcount(rs.getInt(10));
				bdto.setContent(rs.getString(11));
				a.add(bdto);
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
	
	public void insertBoard(BoardDTO bdto) {
		getConnect();
		// ref, re_step, re_level 초기값 설정
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		try {
			String refSql = "select max(ref) from board";
			pstmt = con.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1)+1;
			}
			String sql = "insert into board values(null,?,?,?,?,current_Date(),?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bdto.getContent());
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
}
