<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
%>
<div class="container">
	<h2>게시글 삭제</h2>
	<form action="BoardDeleteProc.jsp" method="post">
		<table width="600" border="1">
			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180"><%=bean.getWriter()%></td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180"><%=bean.getReg_date()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">제목</td>
				<td align="left" width="480" colspan="3"><%=bean.getSubject()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">패스워드</td>
				<td align="left" width="480" colspan="3">
				<input type="password" name="password"></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">글내용</td>
				<td align="left" width="480" colspan="3">
				<textarea rows="10" cols="60" name="content"><%=bean.getContent()%>
				</textarea></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					<input type="hidden" name="num" value="<%=num%>">
					<input type="submit" value="글삭제">
					<input type="button" onclick="location.href='BoardList.jsp'" value="목록보기">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>