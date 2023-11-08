<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>배열</h2>
<hr>
<%
	String[] strArr = {"Java","HTML6","Jsp","MySQL"};
	for(int i=0;i<strArr.length;i++){
		out.print(strArr[i]+"<br>");
	}
%>
</body>
</html>