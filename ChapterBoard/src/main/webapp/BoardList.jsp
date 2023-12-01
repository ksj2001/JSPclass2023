<%@page import="model.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
	// 전체 게시글의 내용을 BoardList.jsp로 가져온다.
	BoardDAO bdao = new BoardDAO();
	// 전체 게시글을 리턴해주는 소스
	ArrayList<BoardBean> alist = bdao.getAllBoard();
%>
<div class="container">
	<h2>전체 게시글 보기</h2>
	<table width="700" border="1">
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="320" align="center">제목</td>
			<td width="100" align="center">작성자</td>
			<td width="150" align="center">작성일자</td>
			<td width="80" align="center">조회수</td>
		</tr>
		<%
			for(int i=0; i<alist.size(); i++){
				BoardBean bean = alist.get(i);
				
				if(bean.getSubject() != null){
		%>
					<tr height="40">
						<td width="50" align="center"><%=i+1 %></td>
						<td width="50" align="center"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject()%></a></td>
						<td width="50" align="center"><%=bean.getWriter()%></td>
						<td width="50" align="center"><%=bean.getReg_date()%></td>
						<td width="50" align="center"><%=bean.getReadcount()%></td>
					</tr>
		<%	
				}
			}
		%>
		<tr height="40">
			<td colspan="5">
				<input type="button" onclick="location.href = 'BoardWriteForm.jsp'" value="글쓰기">
			</td>
		</tr>
	</table>
</div>
</body>
</html>