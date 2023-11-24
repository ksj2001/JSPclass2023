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
	String select = request.getParameter("changePage");
	if(select==null){
		select = "Section.jsp";
	}
%>
<div class="container">
	<jsp:include page="Header.jsp" />
	<jsp:include page="<%=select%>" />
	<jsp:include page="Footer.jsp" />
</div>
</body>
</html>