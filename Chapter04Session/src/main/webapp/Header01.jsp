<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
<%
	/* 로그아웃 코드 */
	String logout = request.getParameter("logout");
    /* 로그아웃 되면 logout의 값이 null이 아니므로 id에 null을 저장한다. */
	if(logout!=null){
		/* session에 id를 null로 저장 */
		session.setAttribute("id", null);
		/* 즉시 종료 */
		session.setMaxInactiveInterval(0);
	}
    
    /* 로그아웃된 아이디 값을 출력 */
    String userId = (String)session.getAttribute("id");
%>


	<div class="container">
		<table width="800">
			<tr height="100">
				<!-- 이미지 로고 -->
				<td align="center" colspan="2">
					<a href="SessionMain.jsp"><img alt="" src="img/logo.jpg" width="200" height="70"></a>
				</td>
				<td align="center" colspan="5">
					<font size="10">Romantic Camping</font>
				</td>
			</tr>
			<tr height="50">
				<td align="center"><a href="SessionMain.jsp?changePage=Section02.jsp">텐트</a></td>
				<td align="center">의자</td>
				<td align="center">식기류</td>
				<td align="center">침낭</td>
				<td align="center">테이블</td>
				<td align="center">화롯대</td>
				<td align="center">
					<%
						if(userId==null){
					%>
							<button type="button" onclick="location.href = 'SessionMain.jsp?changePage=SessionLoginForm.jsp'">로그인</button>
					<%		
						}else{
					%>
							<%=userId %>님 <button type="button" onclick="location.href = 'SessionMain.jsp?logout=1'">로그아웃</button>
					<%		
						}
					%>
				
				</td>
			</tr>
		</table>
	</div>
</body>
</html>