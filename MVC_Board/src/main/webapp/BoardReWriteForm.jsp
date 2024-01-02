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
h2{
	text-align: center;
}
table{
	border-collapse: collapse;
}
input[type="text"],input[type="email"],input[type="password"]{
	width: 400px;
	height: 25px;
}
input[type="submit"],input[type="reset"]{
	width: 90px;
}
</style>
</head>
<body>
<div class="container">
	<h2>답변글 입력하기</h2>
		<table width="600" border="1" bordercolor="gray">
		<form action="BoardReWriteProcCon.do" method="post">
			<tr height="40">
				<td align="center" width="150">작성자</td>
				<td width="450"><input type="text" name="writer"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="subject" value="[답변]"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">이메일</td>
				<td width="450"><input type="email" name="email"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">비밀번호</td>
				<td width="450"><input type="password" name="password"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">글내용</td>
				<td width="450"><textarea rows="10" cols="55" name="content"></textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value="${ref}">
					<input type="hidden" name="re_step" value="${re_step}">
					<input type="hidden" name="re_level" value="${re_level}">
					<input type="submit" value="답글쓰기완료">&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					</form>
					<button onclick="location.href='BoardListCon.do'">전체 게시글보기</button>
				</td>
			</tr>
		</table>
</div>
</body>
</html>