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
	<jsp:useBean id="fboardbean" class="fooding.FoodingBoardBean">
	<jsp:setProperty name="fboardbean" property="*"/>
	</jsp:useBean>
	<%
		FoodingDAO fdao = new FoodingDAO();
    	if(fboardbean.getSubject()!=null && fboardbean.getContent()!=null && fboardbean.getPassword()!=null){
    		fdao.updateBoardInfo(fboardbean);
    	}
		response.sendRedirect("Main.jsp?changePage=FoodingBoardList.jsp");
	%>
</body>
</html>