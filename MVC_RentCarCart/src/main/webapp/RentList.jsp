<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="rentcontainer">
    	<h2>모든 상품 보기</h2>
    	<table width="800" border="1" class="renttable">
    		<tr height="40">
    			<td align="center" width="50">상품번호</td>
    			<td align="center" width="50">상품이미지</td>
    			<td align="center" width="50">상품명</td>
    			<td align="center" width="50">상품가격</td>
    			<td align="center" width="50">제조사</td>
    			<td align="center" width="50">상품설명</td>
    		</tr>
    		<c:forEach var="rdto" items="${aList}">
    			<tr height="40">
    				<td align="center" width="50">${rdto.no}</td>
    				<td align="center" width="50"><a href="RentInfo.do?no=${rdto.no}">
    					<img alt="" src="img/${rdto.img}" width="60" height="60"></a></td>
    				<td align="center" width="50">${rdto.name}</td>
    				<td align="center" width="50"><fmt:formatNumber value="${rdto.price}" pattern="#,##0"/></td>
    				<td align="center" width="50">${rdto.company}</td>
    				<td align="center" width="50">${rdto.info}</td>
    			</tr>
    		</c:forEach>
    	</table>
	</div>
</body>
</html>