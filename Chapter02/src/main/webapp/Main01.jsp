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
	String changePage = request.getParameter("changePage");
    if(changePage==null){
    	changePage="Section01.jsp";
    }
%>

<div class="container">
	<table border="1" width="800">
		<!-- header -->
		<tr height="150">
			<td align="center" colspan="2">
				<jsp:include page="Header01.jsp">
				  <jsp:param value="KIM" name="id"/>
				</jsp:include>
				
				<%-- <%@include file="Header01.jsp" %> --%>
			</td>
		</tr>
		<tr height="400">
			<!-- article -->
			<td align="center" width="200">
				<jsp:include page="Article01.jsp" />
			</td>
			<!-- section -->
			<td align="center" width="600">
				<jsp:include page="<%=changePage%>" />
			</td>
		</tr>
		<!-- footer -->
		<tr height="150">
			<td align="center" colspan="2">
				<jsp:include page="Footer01.jsp" />
			</td>
		</tr>
	</table>
</div>
</body>
</html>