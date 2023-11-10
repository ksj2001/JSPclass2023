<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 네임 페이지입니다.</h2>
<%
	/* String name1 = request.getParameter("name"); */
    /* session의 setAttribute로 받은 값을 session의 getAttribute로 출력해준다. */
    /* session은 Object 객체로서, String으로 반드시 다운캐스팅 한다. */
    String name1 = (String)session.getAttribute("name1");
%>
<%=name1 %>님 반갑습니다.
</body>
</html>