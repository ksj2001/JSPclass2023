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
	String op = request.getParameter("operator");
	if(op.equals("+")){
%>
		${param.num1}&nbsp;+&nbsp;${param.num2}&nbsp;=&nbsp;${param.num1+param.num2}
<%
	}else if(op.equals("-")){
%>
		${param.num1}&nbsp;-&nbsp;${param.num2}&nbsp;=&nbsp;${param.num1-param.num2}
<%
	}else if(op.equals("*")){
%>
		${param.num1}&nbsp;*&nbsp;${param.num2}&nbsp;=&nbsp;${param.num1*param.num2}
<%
	}else{
%>
		${param.num1}&nbsp;/&nbsp;${param.num2}&nbsp;=&nbsp;${param.num1/param.num2}
<%
	}
%>
</body>
</html>