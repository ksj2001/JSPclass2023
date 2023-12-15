<%@page import="db.RentCarDAO"%>
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
	int no = Integer.parseInt(request.getParameter("no"));
	
	RentCarDAO rdao = new RentCarDAO();
	rdao.deleteReserve(no);
	response.sendRedirect("RentCarMain.jsp");
%>
</body>
</html>