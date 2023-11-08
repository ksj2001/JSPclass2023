<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request: 웹의 정보를 요청하는 내장 객체 -->
<!-- getParameter는 name으로 지정된 값을 인수로 입력한다 -->
<!-- request의 범위는 다음 페이지까지이므로, 그 이전 페이지나 그 다음 페이지로는 이동 불가능하다. -->

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
id: <%=id %><br>
pw: <%=pw %>
<a href="requestForward.jsp">이전 페이지로 이동</a>
</body>
</html>