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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String agreeornot = request.getParameter("agreeornot");
	
	if(agreeornot.equals("yes")){
		request.getRequestDispatcher("TermsYes.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("TermsNo.jsp").forward(request, response);
	}
%>
</body>
</html>