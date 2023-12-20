<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>모든 회원 보기</h2>
<div class="tableContainer">
	<table width="800" border="1">
		<tr height="40">
			<td width="50">아이디</td>
			<td width="200">이메일</td>
			<td width="150">전화번호</td>
			<td width="150">취미</td>
			<td width="150">직업</td>
			<td width="100">나이</td>
		</tr>
		<c:forEach var="mdto" items="${aList}">
			<tr height="40">
				<td width="50">${mdto.id}</td>
				<td width="200">${mdto.email}</td>
				<td width="150">${mdto.tel}</td>
				<td width="150">${mdto.hobby}</td>
				<td width="150">${mdto.job}</td>
				<td width="100">${mdto.age}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>