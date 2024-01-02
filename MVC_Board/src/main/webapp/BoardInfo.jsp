<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h2>게시글 보기</h2>
	<table width="600" border="1">
		<tr height="40">
			<td align="center" width="120">글번호</td>
			<td align="center" width="180">${num}</td>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180">${readcount}</td>
		</tr>
		<tr height="40">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180">${writer}</td>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180">${reg_date}</td>
		</tr>
		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" width="480" colspan="3">${email}</td>
		</tr>
		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" width="480" colspan="3">${subject}</td>
		</tr>
		<tr height="100">
			<td align="center" width="120">글내용</td>
			<td align="center" width="480" colspan="3">${content}</td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				<input type="button" value="답글쓰기" onclick="location.href='BoardReWriteCon.do?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
				<input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${num}'">
				<input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${num}'">
				<input type="button" value="목록보기" onclick="location.href='BoardListCon.do'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>