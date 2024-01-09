<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
	display: flex;
	justify-content: center;
	width: 100%;
	height: 500px;
	margin: 100px 0;
	}
	.containerWrap{
	width: 1400px;
	}
	h2{
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 20px;
	text-align: center;
	}
	table{
	margin: 0 auto;
	border-collapse: collapse;
	}
	table tr td{
		text-align: center;
	}
	input{
	height: 25px;
	}
	input[type=submit],button{
	width: 100px;
	height: 30px;
	margin: 0 10px;
	cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="containerWrap">
			<h2>로그인</h2>
			<form action="MemberLoginProc.do">
				<table width="400" border="1">
					<tr height="50">
						<td width="150">아이디</td>
						<td width="250"><input type="text" name="id"></td>
					</tr>
					<tr height="50">
						<td width="150">패스워드</td>
						<td width="250"><input type="password" name="pw"></td>
					</tr>
					<tr height="50">
						<td colspan="2"><input type="submit" value="로그인"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>