
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		<c:set var="number" value="${number}"/>
		<c:forEach var="bdto" items="${aList }">
					<tr height="40">
						<td width="50" align="center">${number}</td>
						<!-- 답글 들여쓰기 -->
						<td width="50" align="left">
						<c:if test="${bdto.re_step > 1}">
						  <c:forEach var="j" begin="1" end="${(bdto.re_step-1)*3 }" >
						    &nbsp;
						  </c:forEach>
						</c:if>
						  <a href="BoardInfoControl.do?num=${bdto.num}">${bdto.subject}</a>
						</td>
						<td width="50" align="center">${bdto.writer}</td>
						<td width="50" align="center">${bdto.reg_date}</td>
						<td width="50" align="center">${bdto.readcount}</td>
					</tr>
		<c:set var="number" value="${number=number-1}"/>			
		</c:forEach>
	</table>
	<!-- 페이징 코드 [1] [2] [3] ... -->
	<div class="pageing"> 
        <c:if test="${startPage>pageBlock }">
			<a href="BoardListCon.do?pageNum=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
        	<a href="BoardListCon.do?pageNum=${i}"> [${i}] </a>
        </c:forEach>

        <c:if test="${endPage<pageCount}">
        <a href="BoardListCon.do?pageNum=${startPage+pageBlock}">[다음]</a>
        </c:if>
</div>
</div>

</body>
</html>