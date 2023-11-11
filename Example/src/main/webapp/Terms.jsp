<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		display: inline-block;
		width: 100px;
	}
	input[type=submit]{
		text-align: center;
	}
</style>
</head>
<body>
<form action="TermsProc.jsp">
	<h3>신규 회원 정보를 입력하세요</h3>
	<div>아이디</div>
	<input type="text" name="id"><br>
	<div>비밀번호</div>
	<input type="password" name="pw"><br>
	<div>이름</div>
	<input type="text" name="name"><br>
	<input type="submit" value="회원가입">
</form>
</body>
</html>