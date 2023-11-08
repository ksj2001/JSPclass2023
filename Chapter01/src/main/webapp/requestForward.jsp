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
	/* post 방식으로 정보를 전송할 때 한글 깨짐 현상 방지 코드 */
    request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
id: <%=id %><br>
pw: <%=pw %>
</body>
</html>