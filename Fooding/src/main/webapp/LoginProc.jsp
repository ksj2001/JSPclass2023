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
	FoodingDAO fdao = new FoodingDAO();
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	String dbPw = fdao.onePassword(inputId);
	String dbId = fdao.oneCheckId(inputId);
	
	if(dbPw.equals(inputPw) && dbId.equals(inputId)){ // 로그인 시 존재하지 않는 아이디를 입력하면 로그인이 되는 것을 방지하는 아이디 중복 체크 기능
		session.setAttribute("id", inputId);
		session.setAttribute("pw", inputPw);
		
		session.setMaxInactiveInterval(180); // 3분간 id 유지
		response.sendRedirect("Main.jsp");
	}else{
%>
		<script type="text/javascript">
			alert('비밀번호가 올바르지 않습니다.');
			history.go(-1);
		</script>
<%
	}
	
%>

</body>
</html>