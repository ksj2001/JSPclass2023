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
	table tr td:nth-child(2){
		padding-left: 10px;
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
	<h2>회원 정보 삭제하기</h2>
	<table width="400" border="1">
		<form action="MemberDeleteProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=request.getParameter("id") %></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pw"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
				    <!-- 위에 있는 아이디가 input이 아니기 때문에 아이디 값을 memberUpdateProc로 떠넘겨준다. -->
				    <input type="hidden" name="id" value="<%=request.getParameter("id") %>">
					<input type="submit" value="회원 삭제하기">&nbsp;&nbsp;</form>
					<button onclick="location.href='MemberList.jsp'">회원 전체보기</button>
				</td>
			</tr>
		</form>
	</table>
</div>
</body>
</html>