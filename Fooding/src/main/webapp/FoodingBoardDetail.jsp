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
	width: 1200px;
	margin: 100px auto;
	}
	h2{
	text-align: center;
	}
	table{
	width: 1200px;
	border-collapse: collapse;
	}
	table .title{
	width: 200px;
	text-align: center;
	font-weight: bold;
	background-color: #eee;
	}
	table tr td:nth-child(2){
	padding-left: 10px;
	}
	input,textarea{
	border:none;
	}
	.btns{
	display:flex;
	justify-content: center;
	}
	input[type=button]{
	width: 100px;
	height: 40px;
	margin: 0 10px;
	border-radius: 5px;
	font-weight: bold;
	color: white;
	background-color: #00A7B3;
	cursor: pointer;
	}
</style>
</head>
<body>
<%
	String id = request.getParameter("id");
	String id_key = request.getParameter("id_key");
	String loginId = (String)session.getAttribute("id");
    FoodingDAO fdao = new FoodingDAO();
    FoodingBoardBean bean = fdao.foodingBoardDetail(id,id_key);
%>
<div class="container">
	<div class="tableBox">
		<h2>1:1 문의 등록하기</h2>
		<table border="1">
				<tr height="40">
					<td class="title">이름</td>
					<td colspan="3"><%=bean.getName() %></td>
				</tr>
				<tr height="40">
					<td class="title">제목</td>
					<td colspan="3"><%=bean.getSubject() %></td>
				</tr>
				<tr height="40">
					<td class="title">작성일자</td>
					<td colspan="3"><%=bean.getReg_date() %></td>
				</tr>
				<tr height="350">
					<td class="title">문의내용</td>
					<td colspan="3"><%=bean.getContent() %></td>
				</tr>
				<tr height="100">
					<td colspan="4" class="title">
						<div class="btns">
						<%  if(loginId.equals("admin123")){%>
							<input type="button" name="rewrite" onclick="location.href ='Main.jsp?changePage=BoardRewriteForm.jsp?id=<%=bean.getId()%>&num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>'" value="답변하기">
						<%	}%>
							<input type="button" name="update" onclick="location.href ='Main.jsp?changePage=BoardUpdateForm.jsp?id=<%=bean.getId()%>'" value="수정하기">
							<input type="button" name="delete" onclick="location.href ='Main.jsp?changePage=BoardDeleteForm.jsp?id=<%=bean.getId()%>'" value="삭제하기">
							<input type="button" name="list" onclick="location.href ='Main.jsp?changePage=FoodingBoardList.jsp'" value="목록">
						</div>
					</td>
				</tr>
		</table>
	</div>
</div>
</body>
</html>