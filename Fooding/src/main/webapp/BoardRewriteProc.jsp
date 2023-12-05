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
<jsp:useBean id="fboardBean" class="fooding.FoodingBoardBean">
	<jsp:setProperty name="fboardBean" property="*"/>
</jsp:useBean>
<%
	FoodingDAO fdao = new FoodingDAO();
	if(fboardBean.getSubject()!=null && fboardBean.getContent()!=null && fboardBean.getPassword()!=null){
		fdao.rewriteInsertBoard(fboardBean);
	}
	response.sendRedirect("Main.jsp?changePage=FoodingBoardList.jsp");
%>
</body>
</html>