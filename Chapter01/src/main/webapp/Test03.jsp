<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 주석 단축키: Ctrl + Shift + / -->
<!-- 주석 취소 단축키: Ctrl + Shift + | -->

<!-- 스크립트릿은 자바 코드를 입력하는 공간이다 -->
<!-- 표현식은 자바 코드의 변수의 값을 브라우저에 출력하는 공간이다. -->
<%
  for(int i=0;i<10;i++){
%>
	<%= i %>
<%
	}
%>   	
   

</body>
</html>