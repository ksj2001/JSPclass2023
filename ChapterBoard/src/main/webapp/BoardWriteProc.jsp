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
<!-- BoardBean을 jsp action 태그로 인스턴스 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	BoardDAO bDao = new BoardDAO();
	
	
	if(boardbean.getSubject()!=null){
		bDao.insertBoard(boardbean);
	}
%>
데이터 입력완료
</body>
</html>