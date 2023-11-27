package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Resultset;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	
	// 한 사람의 게시글을 저장하는(insert) 메서드
	public void insertBoard(BoardBean bean) {
		getConnect();
		// bean 클래스에 들어가지 않는 값을 초기화한다.
		int ref = 0; // ref는 최대값에 +1을 해서 글 그룹을 생성한다.
		int re_step = 1; // 글 스탭
		int re_level = 1; // 글 레벨
		
		try {
			
			// 쿼리 준비
			String refSql = "select max(ref) from board";
			// 쿼리 실행객체
			pstmt = con.prepareStatement(refSql);
			// ResultSet에 담아서 자바에 저장하기
		    rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1)+1; // rs에 있는 자료의 개수만큼 ref의 값을 1씩 늘려준다.
			}
			// insert
			String sql = "insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ? mapping
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
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
