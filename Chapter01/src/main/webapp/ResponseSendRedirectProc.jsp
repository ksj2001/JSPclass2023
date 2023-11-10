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
	String dbId = "k1234";
	String dbPw = "1234";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(dbId) && pw.equals(dbPw)){
		/* get 방식을 이용해서 id를 떠넘겨준다. */
		response.sendRedirect("main.jsp?id="+id);	
	}
	else{
%>
<script type="text/javascript">
	alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	history.back();
</script>
<%
	}
%>

</body>
</html>