<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
<%
	String changePage;
	
%>
	<div class="container">
		<table width="200">
			<tr height="60">
				<td width="200" align="center">
					<!-- get 방식을 이용하여 각각의 Section 페이지를 떠넘기기 -->
					<a href="?changePage=Section02.jsp">스노우파크</a>
				</td>
			</tr>
			<tr height="60">
				<td width="200" align="center">
					<a href="?changePage=Section03.jsp">콜맨</a>
				</td>
			</tr>
			<tr height="60">
				<td width="200" align="center">
					<a href="?changePage=Section04.jsp">지프</a>
				</td>
			</tr>
			<tr height="60">
				<td width="200" align="center">
					<a href="?changePage=Section05.jsp">코베아</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>