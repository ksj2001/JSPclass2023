<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="calculatorResult.jsp" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/* int a = Integer.parseInt(request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b"));
	int i = Integer.parseInt(request.getParameter("i")); */
	int a = (int)session.getAttribute("a");
	int b = (int)session.getAttribute("b");
	int i = (int)session.getAttribute("i");
	String[] opList = {"+", "-", "*", "/", "%"};
	int answer = Integer.parseInt(request.getParameter("answer"));
	int correct;
	
	switch(i){
	case 0:
		correct = a + b;
		if(answer==correct){
%>
		<%=a%>+<%=b%>=<%=answer%><br>
		정답입니다.<br>
<%
		}
		else{
%>
		제출 : <%=a%>+<%=b%>=<%=answer%><br>
		정답 : <%=a%>+<%=b%>=<%=correct%><br>
<%
		}
		break;
	case 1:
		correct = a - b;
		if(answer==correct){
%>
		<%=a%>-<%=b%>=<%=answer%><br>
		정답입니다.<br>
<%
		}
		else{
%>
		제출 : <%=a%>-<%=b%>=<%=answer%><br>
		정답 : <%=a%>-<%=b%>=<%=correct%><br>
<%
		}
		break;
	case 2:
		correct = a * b;
		if(answer==correct){
%>
		<%=a%>*<%=b%>=<%=answer%><br>
		정답입니다.<br>
<%
		}
		else{
%>
		제출 : <%=a%>*<%=b%>=<%=answer%><br>
		정답 : <%=a%>*<%=b%>=<%=correct%><br>
<%
		}
		break;
	case 3:
		correct = a / b;
		if(answer==correct){
%>
		<%=a%>/<%=b%>=<%=answer%><br>
		정답입니다.<br>
<%
		}
		else{
%>
		제출 : <%=a%>/<%=b%>=<%=answer%><br>
		정답 : <%=a%>/<%=b%>=<%=correct%><br>
<%
		}
		break;
	default:
		correct = a % b;
		if(answer==correct){
%>
		<%=a%>%<%=b%>=<%=answer%><br>
		정답입니다.<br>
<%
		}
		else{
%>
		제출 : <%=a%>%<%=b%>=<%=answer%><br>
		정답 : <%=a%>%<%=b%>=<%=correct%><br>
<%
		}
		break;
	}
%>
<br>
<a href="calculator.jsp">다시풀기</a>
</body>
</html>