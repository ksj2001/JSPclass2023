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
table td{
	text-align: center;
}
</style>
</head>
<body>
	<h2>회원 가입 결과</h2>
	<div class="tableContainer">
		<table width="500" border="1">
			<tr height="40">
				<td width="200">아이디</td>
				<td width="300">${mdto.id}</td>
			</tr>
			<tr height="40">
				<td width="200">패스워드</td>
				<td width="300">${mdto.pw}</td>
			</tr>
			<tr height="40">
				<td width="200">이메일</td>
				<td width="300">${mdto.email}</td>
			</tr>
			<tr height="40">
				<td width="200">전화번호</td>
				<td width="300">${mdto.tel}</td>
			</tr>
			<tr height="40">
				<td width="200">주소</td>
				<td width="300">${mdto.address}</td>
			</tr>
		</table>
	</div>
</body>
</html>