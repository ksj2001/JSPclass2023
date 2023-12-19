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
	int i = 5;
	
   	// EL 표현식은 변수 값을 직접적으로 받아올 수 없다.
   	// request.setAttribute로 받아와서 넘겨준다.
   	request.setAttribute("i", i);
	// request.getParameter("id");  = ${param.id}
%>
 ${i};
</body>
</html>