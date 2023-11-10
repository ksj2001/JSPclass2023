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
		String age = request.getParameter("age");
	%>
	<h3>미성년자</h3>
	<div>
		당신의 나이는 <%=age %>살이므로, 주류 구매가 불가능합니다.
	</div>
	<br>
	<a href="Forward.jsp">처음으로 이동</a>
</body>
</html>