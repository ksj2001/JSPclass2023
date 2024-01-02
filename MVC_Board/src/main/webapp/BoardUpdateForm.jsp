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
	<h2>게시글 수정</h2>
	<form action="BoardUpdateProcCon.do" method="post" name="formname">
		<table width="600" border="1">
			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180">${bdto.writer}</td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180">${bdto.reg_date}</td>
			</tr>
			<tr height="40">
				<td align="center" width="120">제목</td>
				<td align="left" width="480" colspan="3">
				<input type="text" name="subject" value="${bdto.subject}" class="subject"></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">패스워드</td>
				<td align="left" width="480" colspan="3">
				<input type="password" name="userPw"></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">글내용</td>
				<td align="left" width="480" colspan="3">
				<textarea rows="10" cols="60" name="content" class="content">${bdto.content}
				</textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					<input type="hidden" name="num" value="${bdto.num}">
					<input type="hidden" name="dbPw" value="${bdto.password}">
					<input type="submit" value="글수정">
					<input type="button" onclick="location.href='BoardListCon.do'" value="목록보기">
				</td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">
function BoardWriteException(){
	let formname = document.formname;
	let subject = document.querySelector(".subject");
	let content = document.querySelector(".content");
	if(subject.value==""){
		alert('제목을 입력하세요.');
		return;
	}
	if(content.value==""){
		alert('내용을 입력하세요.');
		return;
	}
	
	formname.submit();
}
</script>
</body>
</html>