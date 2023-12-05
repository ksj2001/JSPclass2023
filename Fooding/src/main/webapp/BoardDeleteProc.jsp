<%@page import="fooding.FoodingDAO"%>
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
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="fbbean" class="fooding.FoodingBoardBean">
	<jsp:setProperty name="fbbean" property="*"/>
</jsp:useBean>
<%
	String id = request.getParameter("id");
	FoodingDAO fdao = new FoodingDAO();
	fdao.deleteBoardInfo(id);
	response.sendRedirect("Main.jsp?changePage=FoodingBoardList.jsp");
%>
</body>
</html>