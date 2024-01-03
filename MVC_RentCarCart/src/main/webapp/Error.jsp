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
	<c:if test="${msg != null}">
		<script type="text/javascript">
			alert("${msg}");
			location.href = "RentCarMain.jsp";
		</script>
	</c:if>
</body>
</html>