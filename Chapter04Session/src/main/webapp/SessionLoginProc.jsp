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
	MemberDAO mdao = new MemberDAO();
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	String dbPw = mdao.onePassword(inputId);
	
	if(dbPw.equals(inputPw)){
		/* 세션 내장 객체의 사용자가 입력한 아이디와 패스워드를 저장한다. */
		session.setAttribute("id", inputId);
		session.setAttribute("pw", inputPw);
		
		session.setMaxInactiveInterval(10);
		response.sendRedirect("SessionMain.jsp");
	}else{
%>
		<script type="text/javascript">
			alert('비밀번호가 올바르지 않습니다.');
			history.go(-1);
		</script>
<%
	}
	
	
%>

   <%-- <h2>당신의 아이디는 <%=inputId%>이고, 당신의 패스워드는 <%=inputPw%>입니다.</h2>
   <a href="SessionLoginProc2.jsp">다음 페이지로 이동</a> --%>
</body>
</html>