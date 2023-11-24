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
	/* SessionLoginProc에서 저장한 세션 아이디, 패스워드를 출력한다. */
	/* session은 최상위 클래스인 Object이므로, 가져올 때에는 다운캐스팅이 필요하다. */
	String sessionId =(String)session.getAttribute("id");
	String sessionPw =(String)session.getAttribute("pw");
%>

   <h2>당신의 아이디는 <%=sessionId%>이고, 당신의 패스워드는 <%=sessionPw%>입니다.</h2>
</body>
</html>