<%@page import="fooding.FoodingDAO"%>
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

<!-- FoodingBean fbean = new FoodingBean(); -->
<jsp:useBean id="fbean" class="fooding.FoodingBean">
	<jsp:setProperty name="fbean" property="*" />
</jsp:useBean>
  
<%
    // hidden으로 떠넘겨준 아이디값을 request로 받아서 저장
    String id = request.getParameter("id");

	FoodingDAO fdao = new FoodingDAO();
    String pw = fdao.onePassword(id);
	if(pw.equals(fbean.getPw())){
		// 패스워드가 일치하면 수정이 진행되도록 DAO 메서드를 이용한다.
		// 수정이 완료되면 response.sendRedirect로 FoodingList.jsp 파일로 보낸다.
		fdao.updateInfo(fbean);
		response.sendRedirect("FoodingList.jsp");
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