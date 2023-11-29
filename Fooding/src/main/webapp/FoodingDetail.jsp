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
	width: 500px;
	margin: 100px auto;
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
		FoodingDAO fdao = new FoodingDAO();
		FoodingBean fb = fdao.foodingDetail(id);
	%>
	<div class="container">
		<div class="tableBox">
			<h2>회원 정보 상세보기</h2>
			<table width="500" border="1">
				<tr height="50">
					<td align="center" width="150">이름</td>
					<td align="center" width="350"><%=fb.getName()%></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<td align="center" width="350"><%=fb.getId()%></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">전화</td>
					<td align="center" width="350"><%=fb.getTel()%></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">이메일</td>
					<td align="center" width="350"><%=fb.getEmail()%></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">주소</td>
					<td align="center" width="350"><%=fb.getAddress()%></td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="hidden" name="id" value="<%=fb.getId() %>">
						<button onclick="updateBtn()">회원수정</button>
						<button onclick="deleteBtn()">회원삭제</button>
						<button onclick="location.href ='Main.jsp?changePage=FoodingList.jsp'">목록보기</button>
						<button onclick="location.href ='Main.jsp?changePage=FoodingJoinForm.jsp'">회원가입</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
	function updateBtn(){
		if("<%=fb.getId()%>"==="admin123"){
			alert("관리자 정보는 수정/삭제할 수 없습니다.");
		}else{
			location.href ='Main.jsp?changePage=FoodingUpdateForm.jsp?id=<%=fb.getId()%>';
		}
	}
	function deleteBtn(){
		if("<%=fb.getId()%>"==="admin123"){
			alert("관리자 정보는 수정/삭제할 수 없습니다.");
		}else{
			location.href ='Main.jsp?changePage=FoodingDeleteForm.jsp?id=<%=fb.getId()%>';
		}
	}
	</script>
</body>
</html>