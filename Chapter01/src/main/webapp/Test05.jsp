<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>오늘 날짜와 현재시간 출력</h1>
<hr>
<%
	Date date = new Date();
	int year = date.getYear()+1900;
	int month = date.getMonth()+1;
	int day = date.getDate();
	
	int hour = date.getHours();
	int minute = date.getMinutes();
	int second = date.getSeconds();
%>
오늘날짜: <%=year %>년&nbsp;<%=month %>월&nbsp;<%=day %>일&nbsp;<br>
현재시간: <%=hour %>시&nbsp;<%=minute %>분&nbsp;<%=second %>초&nbsp;
</body>
</html>