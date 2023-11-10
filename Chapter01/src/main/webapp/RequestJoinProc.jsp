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
	/* RequestJoin.jsp 파일에서 넘겨준 값을 변수로 저장하는 작업 */
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwchk = request.getParameter("pwchk");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String[] hobby = request.getParameterValues("hobby");
	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
	
	if(!pw.equals(pwchk)){
%>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.");
/* history.go(-1): 이전 페이지, history.go(1): 다음 페이지, history.back(): 무조건 이전 페이지로 이동 */
history.go(-1);
</script>
<%		
	}
%>

            <h2>회원 정보</h2>
		
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350" align="center"><%=id %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350" align="center"><%=email %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350" align="center"><%=tel %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">관심분야</td>
					<td width="350" align="center">
                    <%
                    for(int i=0;i<hobby.length;i++){
                    	out.write(hobby[i]+" ");
                    }
                    %>
	           	    </td>
				</tr>
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350" align="center"><%=job %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">연령</td>
					<td width="350" align="center"><%=age %></td>
				</tr>
				<tr height="50">
					<td width="150" align="center">하고싶은말</td>
					<td width="350" align="center"><%=info %></td>
				</tr>
			</table>

</body>
</html>