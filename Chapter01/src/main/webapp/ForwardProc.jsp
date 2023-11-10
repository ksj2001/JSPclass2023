<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- forward를 이용하여 페이지를 이동할 때에는 서버 내부에서 이동이 이루어지기 때문에 유저는 url로 확인할 수 없다. -->
	<%
		int age = Integer.parseInt(request.getParameter("age"));
		if(age>=20){
			request.getRequestDispatcher("adult.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("child.jsp").forward(request, response);
		}
	%>
</body>
</html>