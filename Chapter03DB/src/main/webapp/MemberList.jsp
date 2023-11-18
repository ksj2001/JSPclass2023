<%@page import="model.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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
</style>
</head>
<body>
	<!-- 1. 데이터베이스에 저장된 데이터 가져오기 -->
	<%
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberBean> aList = mdao.allMembers();
	%>
	<!-- 2. 테이블 HTML 작성해서 화면 출력 -->
	<div class="container">
		<h2>모든 회원 보기</h2>
		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
				<td align="center" width="200">취미</td>
			</tr>
			<%
				for(int i=0;i<aList.size();i++){
					MemberBean mbean = aList.get(i);
					/* out.print(mbean.getId());
					out.print(mbean.getEmail());
					out.print(mbean.getTel());
					out.print(mbean.getHobby()); */
				
			%>
			
			<tr height="50">
				<td align="center" width="150"><a href="MemberDetail.jsp?id=<%=mbean.getId()%>"><%=mbean.getId()%></a></td>
				<td align="center" width="250"><%=mbean.getEmail()%></td>
				<td align="center" width="200"><%=mbean.getTel()%></td>
				<td align="center" width="200"><%=mbean.getHobby()%></td>
			</tr>
			
			<%
				}
			%>
			
		</table>
	</div>
	
	
</body>
</html>