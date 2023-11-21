
<%@page import="model.MemberDAO"%>
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
%>

<!-- MemberBean mbean = new MemberBean(); -->
<jsp:useBean id="mbean" class="model.MemberBean">
	<jsp:setProperty name="mbean" property="*" />
</jsp:useBean>
  
<%
    // hidden으로 떠넘겨준 아이디값을 request로 받아서 저장
    String id1 = request.getParameter("id");

	MemberDAO mdao = new MemberDAO();
    String pw = mdao.onePassword(id1);
   
	if(pw.equals(mbean.getPw())){
		// 패스워드가 일치하면 수정이 진행되도록 DAO 메서드를 이용한다.
		// 수정이 완료되면 response.sendRedirect로 MemberList.jsp 파일로 보낸다.
		mdao.updateInfo(mbean);
		response.sendRedirect("MemberList.jsp");
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 틀립니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>