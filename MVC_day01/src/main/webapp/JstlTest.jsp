<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- c:set은 변수를 지정할 때 사용하는 명령문 -->
<c:set var="i" value="4"/>
<!-- request.setAttribute("i",4);와 같은 의미 -->

<c:if test="${i>3}">
	안녕하세요!<br>
</c:if>

<!-- forEach문에 step을 입력하지 않으면 기본 증가값은 1이 된다. -->
<c:set var="sum" value="0"/>
<c:forEach var="j" begin="1" end="10" step="${j=j+2}">
	<c:set var="sum" value="${sum=sum+j}"/>
</c:forEach>
홀수의 합계: <c:out value="${sum}" /><br>

<!-- 배열 처리 방식 -->
<c:set var="arr" value="1,2,3,4,5"/>
<!-- 배열로 되어있는 데이터를 forEach로 담으려면 items를 활용해야 한다.(java의 확장 for문과 같다) -->
<c:forEach var="data" items="${arr }">
	${data}
</c:forEach><br>

<!-- 다중 if 사용방식 -->
<c:set var="color" value="red,green,blue,magenta,cyan"/>
<c:forEach var="data" items="${color}">
	<c:choose>
		<c:when test="${data=='red'}">빨강</c:when>
		<c:when test="${data=='green'}">초록</c:when>
		<c:when test="${data=='blue'}">파랑</c:when>
		<c:when test="${data=='magenta'}">보라</c:when>
		<c:otherwise>하늘</c:otherwise>
	</c:choose>	
</c:forEach>
</body>
</html>