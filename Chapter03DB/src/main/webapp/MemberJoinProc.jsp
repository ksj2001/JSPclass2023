<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	/* 취미를 배열로 담아서 textHobby라는 String 변수에 담는다. */
	String[] hobby = request.getParameterValues("hobby");
	String textHobby = "";
	for(int i=0;i<hobby.length;i++){
		textHobby += hobby[i]+" ";
	}
%>
<!-- useBean을 이용해서 MemberBean에 있는 자료를 가져오기 -->
<!-- 객체 생성: MemberBean mbean = new MemberBean(); -->
<jsp:useBean id="mbean" class="model.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>  
</jsp:useBean>

<!-- db연동 시작 -->
<%
	mbean.setHobby(textHobby);
    MemberDAO memberdao = new MemberDAO();
    memberdao.insertMember(mbean);

    /* // 1. java에 db를 connect해준다. Connection하기 위해서 MySQL 드라이브명을 Class.forName에 입력한다.
    String id = "root"; // db 아이디
    String pw = "12345678"; // db 패스워드
    String url = "jdbc:mysql://localhost:3306/jspdatabase?serverTimezone=UTC"; // 접속 URL
    
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 드라이버를 자바에 접속
    	// db의 아이디, 패스워드, url을 자바에 연결한 드라이버와 연결시켜준다.
    	Connection con = DriverManager.getConnection(url, id, pw);
    	// 쿼리 실행 준비 작업
    	String sql = "insert into member values(?,?,?,?,?,?,?,?)";
    	
        PreparedStatement pstmt = con.prepareStatement("insert into member values(?,?,?,?,?,?,?,?)");
    	pstmt.setString(1, mbean.getId());
    	pstmt.setString(2, mbean.getPw());
    	pstmt.setString(3, mbean.getEmail());
    	pstmt.setString(4, mbean.getTel());
    	pstmt.setString(5, mbean.getHobby());
    	pstmt.setString(6, mbean.getJob());
    	pstmt.setString(7, mbean.getAge());
    	pstmt.setString(8, mbean.getInfo());
    	
    	// 쿼리 실행 : insert,update,delete는 executeUpdate를 이용하여 실행한다.
    	pstmt.executeUpdate(sql);
    	
    	// 자원 반납 : connection 종료
    	con.close();
    	
    }catch(Exception e){
    	e.printStackTrace();
    } */
%>
     mySQL 접속 완료

</body>
</html>