<%@page import="bean.MemberBean"%>
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
	request.setCharacterEncoding("UTF-8");
    MemberBean mbean02 = new MemberBean();
    mbean02.setId(request.getParameter("id"));
    

%>
<!-- useBean 액션태그를 사용하여 값을 출력한다. -->
<!-- 객체 생성 : MemberBean mbean = new MemberBean(); -->
<jsp:useBean id="mbean" class="bean.MemberBean">
  <!-- property의 *는 MemberBean의 멤버변수 전부를 받아온다. -->
  <jsp:setProperty name="mbean" property="*"/>
  
  <h2>나의 아이디는:<jsp:getProperty property="id" name="mbean" /></h2>
  <h2>나의 패스워드는:<%=mbean.getPw()%></h2>
  <h2>나의 이메일은:<%=mbean.getEmail()%></h2>
  <h2>나의 전화번호는:<%=mbean.getTel()%></h2>
  <h2>나의 주소는:<%=mbean.getAddress()%></h2>
  
</jsp:useBean>
</body>
</html>