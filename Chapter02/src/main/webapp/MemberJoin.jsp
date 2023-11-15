<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	.content{
		width: 300px;
		height: 35px;
	}
	input[type='submit'],input[type='reset']{
		width: 100px;
		height: 30px;
	}
</style>
</head>
<body>
	<div class="container">
		<h2>회원 가입</h2>
		<form action="MemberJoinProc.jsp" methods="post">
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350" align="center">
						<input type="text" name="id" class="content"
						placeholder="아이디를 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호</td>
					<td width="350" align="center">
						<input type="password" name="pw" class="content"
						placeholder="영문과 숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350" align="center">
						<input type="email" name="email" class="content"
						placeholder="@를 포함하여 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350" align="center">
						<input type="tel" name="tel" class="content"
						placeholder="000-0000-0000의 형식으로 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">주소</td>
					<td width="350" align="center">
						<input type="text" name="address" class="content">
					</td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="submit" value="회원가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>