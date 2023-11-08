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
	String name = "홍길동";
	if(name.equals("김철수")){
%>
	김철수 입니다.
<%
	}else{
%>
	김철수가 아닙니다.
<%  }%>
</body>
</html>