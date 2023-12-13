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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	RentCarDAO rdao = new RentCarDAO();
	int result = rdao.getLogin(id, pw);
	
	if(result==0){
%>
	<script type="text/javascript">
		alert('아이디와 패스워드를 확인해주세요.');
		location.href = 'RentCarMain.jsp?sectionChange=MemberLogin.jsp';
	</script>
<%	}else{ // 로그인이 됐을 경우
		session.setAttribute("id", id); // session에 id 값을 저장
		response.sendRedirect("RentCarMain.jsp");
	}
%>
</body>
</html>