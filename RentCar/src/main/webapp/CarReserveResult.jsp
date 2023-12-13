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
	int no = Integer.parseInt(request.getParameter("no"));
	int carcnt = Integer.parseInt(request.getParameter("carcnt"));
	
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
	<script type="text/javascript">
		alert('로그인 후 사용가능');
		location.href = 'RentCarMain.jsp?sectionChange=MemberLogin.jsp';
	</script>
<%		
	}
%>
</body>
</html>