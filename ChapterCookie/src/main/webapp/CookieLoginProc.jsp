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
	String save = request.getParameter("save");
	
	if(save != null){
		Cookie cookie = new Cookie("id",id); // cookie를 생성할 때, 반드시 key=value로 지정한다.
		cookie.setMaxAge(60*1); // 쿠키 유지시간		
		response.addCookie(cookie); // 쿠키를 유저한테 추가
		out.write("쿠키 생성 완료");
	}
%>
</body>
</html>