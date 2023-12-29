<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
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
	<h2>게시글 쓰기</h2>
	
		<table width="600" border="1" bordercolor="gray">
		<form action="BoardWriteProcCon.do" method="post" name="formname">
			<tr height="40">
				<td align="center" width="150">작성자</td>
				<td width="450"><input type="text" name="writer"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">제목</td>
				<td width="450"><input type="text" name="subject" class="subject"></td>
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
				<td width="450"><textarea rows="10" cols="55" name="content" class="content"></textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="button" onclick="BoardWriteException();" value="글쓰기">&nbsp;&nbsp;
					<input type="reset" value="다시작성">&nbsp;&nbsp;
					</form>
					<button onclick="location.href='BoardListCon.do'">전체 게시글보기</button>
				</td>
			</tr>
		</table>
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