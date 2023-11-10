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
String surveyer = request.getParameter("surveyer");
String entertainer = request.getParameter("entertainer");
String sportsman = request.getParameter("sportsman");
%>

<h2><%=surveyer %>님의 선호도 조사 결과</h2>
<ul>
	<li>좋아하는 연예인:<%=entertainer %></li>
	<li>좋아하는 운동선수:<%=sportsman %></li>
</ul>
<input type="button" value="처음부터 다시하기" onclick="location.href='Survey.jsp'" />
</body>
</html>