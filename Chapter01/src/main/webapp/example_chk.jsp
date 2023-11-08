<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>체크박스 10개 생성</h2>
<hr>
1st
<%!
	public String printInput(int num){
		String text = "";
		for(int i=0;i<num;i++){
			text += "<input type='checkbox'></input>";
		}
		return text;
	}
%>
<%= printInput(10)%>
<br>
2nd
<%
	for(int i=0;i<10;i++){
		out.print("<input type='checkbox'></input>");
	}
%>
</body>
</html>