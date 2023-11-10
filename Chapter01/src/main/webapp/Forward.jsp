<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 메서드를 생략할 경우, default는 get 방식이다. -->
	<form action="ForwardProc.jsp">
		당신의 나이는?
		<input type="text" name="age"/>
		<input type="submit" value="확인"/>
	</form>
</body>
</html>