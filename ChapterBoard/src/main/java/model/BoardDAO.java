package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	// 모든 회원의 게시글 보기
	public ArrayList<BoardBean> getAllBoard(int start,int pageSize){
		getConnect();
		ArrayList<BoardBean> a = new ArrayList<>();
		
		try {
			String sql = "select * from board order by ref desc,re_step asc,re_level asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start-1); // limit는 index 번호를 0부터 읽어들인다.
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bbean = new BoardBean();
				bbean.setNum(rs.getInt(1));
				bbean.setWriter(rs.getString(2));
				bbean.setEmail(rs.getString(3));
				bbean.setSubject(rs.getString(4));
				bbean.setPassword(rs.getString(5));
				bbean.setReg_date(rs.getDate(6).toString());
				bbean.setRef(rs.getInt(7));
				bbean.setRe_step(rs.getInt(8));
				bbean.setRe_level(rs.getInt(9));
				bbean.setReadcount(rs.getInt(10));
				bbean.setContent(rs.getString(11));
				
				a.add(bbean);
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
		
		return a;
	}
	
	// 한 사람의 게시글만 확인하는 메서드 작성
	public BoardBean getOneBoard(int num) {
		getConnect();
		BoardBean bbean = new BoardBean();
		
		try {
			// 조회수 증가 쿼리 작성
			String readCountsql = "update board set readcount = readcount + 1 where num=?";
			pstmt = con.prepareStatement(readCountsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bbean.setNum(rs.getInt(1));
				bbean.setWriter(rs.getString(2));
				bbean.setEmail(rs.getString(3));
				bbean.setSubject(rs.getString(4));
				bbean.setPassword(rs.getString(5));
				bbean.setReg_date(rs.getDate(6).toString());
				bbean.setRef(rs.getInt(7));
				bbean.setRe_step(rs.getInt(8));
				bbean.setRe_level(rs.getInt(9));
				bbean.setReadcount(rs.getInt(10));
				bbean.setContent(rs.getString(11));
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
		return bbean;
	}
	
	// 답글을 저장하는 메서드 (별표 ★★★★★)
	public void reWrite(BoardBean bbean) {
		getConnect();
		// ref, re_step, re_level의 값을 초기값으로 넘겨준다.
		int ref = bbean.getRef();
		int re_step = bbean.getRe_step();
		int re_level = bbean.getRe_level();
		// System.out.println(ref);
		// System.out.println(re_step);
		// System.out.println(re_level); 
		try {
			// re_level을 1씩 더해주는 쿼리 작성
			
			  String levelsql =
			  "update board set re_level=re_level+1 where ref=? and re_level > ?"; 
			  pstmt = con.prepareStatement(levelsql); 
			  pstmt.setInt(1, ref); 
			  pstmt.setInt(2,re_level); 
			  pstmt.executeUpdate();
			 
			// insert
			String sql = "insert into board values(null,?,?,?,?,current_date(),?,?,?,0,?)";
			pstmt = con.prepareStatement(sql);
			// ? mapping
			pstmt.setString(1, bbean.getWriter());
			pstmt.setString(2, bbean.getEmail());
			pstmt.setString(3, bbean.getSubject());
			pstmt.setString(4, bbean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step+1); // 답글이기 때문에 +1을 하여 답글임을 알려준다.
			pstmt.setInt(7, re_level+1); // 답글이기 때문에 +1을 하여 답글임을 알려준다.
			pstmt.setString(8, bbean.getContent());
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
	
	
	// Update,Delete 할 때 한 사람의 게시글을 확인하는 메서드 작성(단, 조회수 증가 쿼리는 제외)
		public BoardBean getOneUpdateBoard(int num) {
			getConnect();
			BoardBean bbean = new BoardBean();
			
			try {
				String sql = "select * from board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bbean.setNum(rs.getInt(1));
					bbean.setWriter(rs.getString(2));
					bbean.setEmail(rs.getString(3));
					bbean.setSubject(rs.getString(4));
					bbean.setPassword(rs.getString(5));
					bbean.setReg_date(rs.getDate(6).toString());
					bbean.setRef(rs.getInt(7));
					bbean.setRe_step(rs.getInt(8));
					bbean.setRe_level(rs.getInt(9));
					bbean.setReadcount(rs.getInt(10));
					bbean.setContent(rs.getString(11));
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
			return bbean;
		}
	// 비밀번호를 확인하는 메서드 작성
	public String getOnePassword(int num) {
		getConnect();
		String pw = "";
		try {
			String sql = "select password from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString(1);
			}
		}catch(Exception e){
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
		return pw;
	}
	
	// 한 사람의 게시글을 update하는 메서드 작성
	public void update(BoardBean bbean) {
		getConnect();
		try {
			String sql = "update board set subject=?,content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbean.getSubject());
			pstmt.setString(2, bbean.getContent());
			pstmt.setInt(3, bbean.getNum());
			pstmt.executeUpdate();
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
	}
	
	// 한 사람의 게시글을 delete하는 메서드 작성
		public void delete(int num) {
			getConnect();
			try {
				String sql = "delete from board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				System.out.println(num);
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
		}
		
	// pageing 작업을 하기 위한 게시글의 전체 개수를 return하는 메서드
	public int getCount() {
		getConnect();
		int count=0;
		try {
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
}
