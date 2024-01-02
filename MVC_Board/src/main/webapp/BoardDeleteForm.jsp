<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body{
	display: flex;
	justify-content: center;
}
h2{
	text-align: center;
}
table{
	border-collapse: collapse;
}
</style>
</head>
<body>
<div class="container">
	<h2>게시글 삭제</h2>
	<form action="BoardDeleteProcCon.do" method="post">
		<table width="600" border="1">
			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180">${bdto.writer}</td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180">${bdto.reg_date}</td>
			</tr>
			<tr height="40">
				<td align="center" width="120">제목</td>
				<td align="left" width="480" colspan="3">${bdto.subject}</td>
			</tr>
			<tr height="40">
				<td align="center" width="120">패스워드</td>
				<td align="left" width="480" colspan="3">
				<input type="password" name="userPw"></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					<input type="hidden" name="num" value="${bdto.num}">
					<input type="hidden" name="dbPw" value="${bdto.password}">
					<input type="submit" value="글삭제">
					<input type="button" onclick="location.href='BoardListCon.do'" value="목록보기">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>