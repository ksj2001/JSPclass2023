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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
%>
<h2>가입이 완료되었습니다.</h2>
<h2>가입정보</h2>
<ul>
	<li>가입 아이디 :<%=id%></li>
	<li>가입 비밀번호 :<%=pw%></li>
	<li>가입 이름 :<%=name%></li>
</ul>
</body>
</html>