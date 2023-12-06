<%@page import="model.BoardDAO"%>
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
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*"/>
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bdao = new BoardDAO();
	
	String dbPW = bdao.getOnePassword(num);
	if(dbPW.equals(boardbean.getPassword())){
		bdao.update(boardbean);
		response.sendRedirect("BoardList.jsp");
	}else{%>
<script type="text/javascript">
		alert('비밀번호가 일치하지 않습니다.');
		history.go(-1);
</script>	
<%	}%>
</body>
</html>