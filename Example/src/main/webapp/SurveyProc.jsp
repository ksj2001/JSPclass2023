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
	String surveyer = request.getParameter("surveyer");
	String entertainer = request.getParameter("entertainer");
%>


<form action="SurveyResult.jsp">
	<h2>2.좋아하는 운동선수 누구인가요?</h2>
	<input type="text" name="sportsman">
	<!-- get 방식을 숨겨서 데이터를 떠넘겨주는 방식 -->
	<input type="hidden" name="surveyer" value="<%=surveyer%>">
	<input type="hidden" name="entertainer" value="<%=entertainer%>">
	<input type="submit" value="결과보기">
</form>
</body>
</html>