<%@page import="fooding.FoodingBoardBean"%>
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
	input[type=submit],button{
	display:flex;
	justify-content: center;
	width: 80px;
	height: 30px;
	margin: 0 auto;
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
	String id = (String)session.getAttribute("id");
    FoodingDAO fdao = new FoodingDAO();
	// fooding 테이블의 name, email, tel의 값을 가지고 오는 DAO 메서드 작성(foodingMemberJoin)
    FoodingBean fbean = fdao.foodingMemberJoin(id);
	FoodingBoardBean bean = fdao.foodingBoardDetail(id);

	if(id==null){
%>
	<script type="text/javascript">
		alert('로그인 후 사용 가능');
		history.go(-1);
	</script>
<%
	}else{
%>
		<div class="container">
	<div class="tableBox">
		<h2>1:1 문의 등록하기</h2>
		<table border="1">
			<form action="BoardUpdateProc.jsp" method="post">
				<tr height="40">
					<td class="title">이름</td>
					<td colspan="3"><%=fbean.getName() %></td>
				</tr>
				<tr height="40">
					<td class="title">제목</td>
					<td colspan="3">
						<input type="text" name="subject" value="<%=bean.getSubject() %>">
					</td>
				</tr>
				<tr height="350">
					<td class="title">문의내용</td>
					<td colspan="3"><textarea rows="20" cols="120" name="content"><%=bean.getContent()%></textarea></td>
				</tr>
				<tr height="40">
					<td class="title">이메일</td>
					<td width="500"><%=fbean.getEmail() %></td>
					<td class="title">전화번호</td>
					<td width="300"><%=fbean.getTel() %></td>
				</tr>
				<tr height="40">
					<td class="title">비밀번호</td>
					<td colspan="3"><input type="password" name="password" value="<%=bean.getPassword()%>"></td>
				</tr>
				<tr height="100">
					<td colspan="4" class="title">
						<input type="hidden" name="id" value="<%=id%>">	
						<input type="submit" name="complete" value="완료">
					</td>
				</tr>
			</form>
		</table>
	</div>
</div>
<%		
	}
%>



</body>
</html>