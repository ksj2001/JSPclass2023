<%@page import="fooding.FoodingBean"%>
<%@page import="fooding.FoodingDAO"%>
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
	.container{
	width: 100%;	
	}
	.tableBox{
	width: 400px;
	margin: 100px auto;
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
	width: 220px;
	height: 25px;
	}
	input[type=submit],button{
	width: 120px;
	height: 30px;
	margin: 0 10px;
	cursor: pointer;
	}
</style>
</head>
<body>
<%
	String id = request.getParameter("id");
	FoodingDAO fdao = new FoodingDAO();
	FoodingBean fb = fdao.foodingDetail(id);
%>
<div class="container">
	<div class="tableBox">
		<h2>회원 정보 수정하기</h2>
		<table width="400" border="1">
			<form action="FoodingDeleteProc.jsp" method="post">
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td width="250"><%=fb.getId() %></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">패스워드</td>
					<td width="250"><input type="password" name="pw"></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
					    <input type="hidden" name="id" value="<%=fb.getId() %>">
						<input type="submit" value="회원 삭제하기">&nbsp;&nbsp;</form>
						<button onclick="location.href='FoodingList.jsp'">회원 전체보기</button>
					</td>
				</tr>
		</table>
	</div>
</div>
</body>
</html>