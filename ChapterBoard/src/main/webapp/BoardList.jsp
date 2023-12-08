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
.pageing{
	text-align: center;
	margin: 10px;
}
</style>
</head>
<body>
<%
    // pageing을 하기 위해 필요한 변수를 선언한다.
    int pageSize = 5; // 한 화면에 보여질 레코드의 개수
    String pageNum = request.getParameter("pageNum"); // pageing의 번호 [1] [2] [3] ...
    if(pageNum==null){
    	pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
	int count = 0; // board 테이블 레코드의 전체 개수
	int num = count - (currentPage-1) * pageSize; // 최신글의 번호를 return 해주는 번호
	int startRow = (currentPage - 1)*pageSize+1; // 한 페이지에서 첫번째로 시작하는 레코드 번호
	// 전체 게시글의 내용을 BoardList.jsp로 가져온다.
	BoardDAO bdao = new BoardDAO();
	// 전체 게시글을 리턴해주는 소스
	ArrayList<BoardBean> alist = bdao.getAllBoard(startRow,pageSize);
	count = bdao.getCount();
	
%>
<div class="container">
	<h2>전체 게시글 보기</h2>
	<table width="700" border="1">
		<tr height="40">
			<td colspan="5">
				<input type="button" onclick="location.href = 'BoardWriteForm.jsp'" value="글쓰기">
			</td>
		</tr>
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
		
	</table>
	<div class="pageing"> 
<%
	if(count>0){
		int pageBlock = 3; // pageing의 개수 (여기서는 [1] ~ [3]까지만)
		
		// 레코드의 개수를 pageBlock으로 나눌 때, 나머지가 남으면 pageCount는 pageBlock보다 1 크게, 나누어 떨어지면 pageBlock의 값으로 설정
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		// 시작페이지 숫자를 설정(pageBlock의 시작번호)
		int startPage = 1;
		if(currentPage % pageBlock != 0){
			startPage = (int)(currentPage/pageBlock)*pageBlock+1; // currentPage가 pageBlock으로 나누어 떨어지지 않을 경우
		}else{
			startPage = ((int)(currentPage/pageBlock)-1)*pageBlock+1; // 나누어 떨어질 경우
		}
		int endPage = startPage + pageBlock - 1;
		if(endPage>pageCount){
			endPage = pageCount;
		}
		if(startPage>pageBlock){
%>
			<a href="BoardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%
		}
		for(int i=startPage;i<=endPage;i++){
%>
			<a href="BoardList.jsp?pageNum=<%=i%>"><%=i%></a>
<%
		}
		if(endPage<pageCount){
%>
			<a href="BoardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%
		}
	}
%>
</div>
</div>

</body>
</html>