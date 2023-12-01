<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	// BoardList.jsp에서 넘기는 num 값을 request로 받는다.
	int num = Integer.parseInt(request.getParameter("num"));
	// 데이터 베이스 접근
	BoardDAO bdao = new BoardDAO();
	// BoardBean 타입으로 하나의 게시글을 리턴받는다.
	BoardBean bbean = bdao.getOneBoard(num);
%>
<div class="container">
	<h2>게시글 보기</h2>
	<table width="600" border="1">
		<tr height="40">
			<td align="center" width="120">글번호</td>
			<td align="center" width="180"><%=bbean.getNum()%></td>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180"><%=bbean.getReadcount()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180"><%=bbean.getWriter()%></td>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180"><%=bbean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" width="480" colspan="3"><%=bbean.getEmail()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" width="480" colspan="3"><%=bbean.getSubject()%></td>
		</tr>
		<tr height="100">
			<td align="center" width="120">글내용</td>
			<td align="center" width="480" colspan="3"><%=bbean.getContent()%></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				<input type="button" value="답글쓰기" onclick="location.href='BoardReWriterForm.jsp?num=<%=bbean.getNum()%>&ref=<%=bbean.getRef()%>&re_step=<%=bbean.getRe_step()%>&re_level=<%=bbean.getRe_level()%>'">
				<input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?num=<%=bbean.getNum()%>'">
				<input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?num=<%=bbean.getNum()%>'">
				<input type="button" value="목록보기" onclick="location.href='BoardList.jsp'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>