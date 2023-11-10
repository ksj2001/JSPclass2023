<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 연습</h2>

<!-- form 태그 안에서 메서드로 get/post 방식을 이용해서 submit을 할 때에만 데이터를 전송받을 수 있다. -->

<%
	String name = "shin";
    /* session을 이용하여 데이터를 공유 */
    session.setAttribute("name1", name);
    session.setMaxInactiveInterval(10);
    /* 10초 후에 자동으로 데이터 공유가 종료됨 */
%>
<!-- 첫 번째: get 방식을 이용한다. (단, get 방식은 값이 다음 페이지로밖에 이동이 안 된다.-->
<%-- <a href="SessionName.jsp?name=<%=name%>">세션네임페이지로 이동</a> --%>

<a href="SessionName.jsp">세션네임페이지로 이동</a>
</body>
</html>