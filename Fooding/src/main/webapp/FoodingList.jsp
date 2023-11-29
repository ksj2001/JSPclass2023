<%@page import="fooding.FoodingBean"%>
<%@page import="java.util.ArrayList"%>
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
	width: 950px;
	margin: 100px auto;
	}
	h2{
	text-align: center;
	}
	table{
	border-collapse: collapse;
	}
	table tr td a{
	color: blue;
	text-decoration: underline;
	}
</style>
</head>
<body>
	<!-- 1. 데이터베이스에 저장된 데이터 가져오기 -->
	<%
		FoodingDAO fdao = new FoodingDAO();
		ArrayList<FoodingBean> aList = fdao.allMembers();
	%>
	<!-- 2. 테이블 HTML 작성해서 화면 출력 -->
	<div class="container">
		<div class="tableBox">
			<h2>모든 회원 보기</h2>
			<table width="950" border="1">
				<tr height="50">
					<td align="center" width="150">이름</td>
					<td align="center" width="150">아이디</td>
					<td align="center" width="200">전화번호</td>
					<td align="center" width="250">이메일</td>
					<td align="center" width="200">주소</td>
				</tr>
				<%
					for(int i=0;i<aList.size();i++){
						FoodingBean fbean = aList.get(i);
				%>
			
				<tr height="50">
					<td align="center" width="150"><%=fbean.getName()%></td>
					<td align="center" width="150"><a href="Main.jsp?changePage=FoodingDetail.jsp?id=<%=fbean.getId()%>"><%=fbean.getId()%></a></td>
					<td align="center" width="200"><%=fbean.getTel()%></td>
					<td align="center" width="250"><%=fbean.getEmail()%></td>
					<td align="center" width="200"><%=fbean.getAddress()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>