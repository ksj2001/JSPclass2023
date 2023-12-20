<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
	text-align: center;
}
.tableContainer{
	display: flex;
	justify-content: center;
}
table{
	border-collapse: collapse;
}
</style>
</head>
<body>
<h2>회원 가입 양식</h2>
<div class="tableContainer">
	<form action="Mproc.do" method="post">
		<table border="1" width="500">
			<tr height="40">
				<td align="center" width="200">아이디</td>
				<td align="center" width="300"><input type="text" name="id"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">패스워드</td>
				<td align="center" width="300"><input type="password" name="pw"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">이메일</td>
				<td align="center" width="300"><input type="email" name="email"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">전화번호</td>
				<td align="center" width="300"><input type="tel" name="tel"></td>
			</tr>
			<tr height="40">
				<td align="center" width="200">주소</td>
				<td align="center" width="300"><input type="text" name="address"></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="2">
					<input type="submit" value="가입하기">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>