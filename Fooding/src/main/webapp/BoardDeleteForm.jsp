<%@page import="fooding.FoodingBoardBean"%>
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
	FoodingBoardBean fbb = fdao.foodingBoardDetail(id);
%>
<div class="container">
	<div class="tableBox">
		<h2>1:1 문의글 삭제</h2>
		<table width="400" border="1">
			<form action="BoardDeleteProc.jsp" method="post">
				<tr height="50">
					<td align="center">정말로 삭제하시겠습니까?</td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
					    <input type="hidden" name="id" value="<%=fbb.getId() %>">
						<input type="submit" value="네">&nbsp;&nbsp;</form>
						<button onclick="location.href='Main.jsp?changePage=FoodingBoardList.jsp'">아니오</button>
					</td>
				</tr>
		</table>
	</div>
</div>
</body>
</html>