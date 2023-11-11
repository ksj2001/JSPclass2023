<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int a = (int)(Math.random() * 9) + 1;
	int b = (int)(Math.random() * 9) + 1;
	int i = (int)(Math.random() * 5); // 랜덤하게 생성되는 i 값
	session.setAttribute("a", a);
	session.setAttribute("b", b);
	session.setAttribute("i", i);
	String[] opList = {"+", "-", "*", "/", "%"};
%>
<form action="calculatorProc.jsp">
	<h2>랜덤 계산기</h2>
	<%=a%>&nbsp;<%=opList[i]%>&nbsp;<%=b%>&nbsp;=&nbsp;
	<input type="text" name="answer">
	<input type="submit" value="제출">
</form>
</body>
</html>