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
<jsp:useBean id="fbean" class="fooding.FoodingBean">
	<jsp:setProperty name="fbean" property="*"/>
</jsp:useBean>
<%
	String id = request.getParameter("id");
	
	FoodingDAO fdao = new FoodingDAO();
	String pw = fdao.onePassword(id);
	if(pw.equals(fbean.getPw())){
		fdao.deleteInfo(id);
		response.sendRedirect("Main.jsp?changePage=FoodingList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 틀립니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>