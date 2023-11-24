<%@page import="model.MemberDAO"%>
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
<jsp:useBean id="mbean" class="model.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<%
	MemberDAO mdao = new MemberDAO();
  	String dbPW = mdao.onePassword(mbean.getId());
  	String userPW = mbean.getPw();
  	String userID = mbean.getId();
	
	if(dbPW.equals(userPW)){
		mdao.deleteInfo(userID);
		response.sendRedirect("MemberList.jsp");
	}else{
%>
	<script>
		alert('비밀번호가 일치하지 않습니다.');
		history.go(-1);
	</script>
<%	
	}
%>
</body>
</html>