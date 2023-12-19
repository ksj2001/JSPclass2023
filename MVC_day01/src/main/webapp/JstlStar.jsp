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
<c:forEach var="i" begin="1" end="5">
	<c:forEach var="j" begin="1" end="${5-i}">
		&nbsp;
	</c:forEach>
	<c:forEach var="j" begin="1" end="${2*i-1}">
		*
	</c:forEach>
	<br>
</c:forEach>
</body>
</html>