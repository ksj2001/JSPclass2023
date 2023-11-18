<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
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
	button{
	width: 80px;
	height: 35px;
	margin: 0 5px;
	cursor: pointer;
	}
</style>
</head>
<body>
	<%
		String id = request.getParameter("id");
		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.memberDetail(id);
	%>
	<div class="container">
		<h2>회원 정보 상세보기</h2>
		<table width="500" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="350"><%=mb.getId()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td align="center" width="350"><%=mb.getEmail()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">전화</td>
				<td align="center" width="350"><%=mb.getTel()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">취미</td>
				<td align="center" width="350"><%=mb.getHobby()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">직업</td>
				<td align="center" width="350"><%=mb.getJob()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">나이</td>
				<td align="center" width="350"><%=mb.getAge()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">정보</td>
				<td align="center" width="350"><%=mb.getInfo()%></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<button onclick="location.href ='MemberUpdateForm.jsp?id=<%=mb.getId()%>'">회원수정</button>
					<button onclick="location.href ='MemberDeleteForm.jsp?id=<%=mb.getId()%>'">회원삭제</button>
					<button onclick="location.href ='MemberList.jsp'">목록보기</button>
					<button onclick="location.href ='MemberJoin.jsp'">회원가입</button>
				</td>
			</tr>
		</table>
	</div>
	
</body>
</html>