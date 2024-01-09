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
	 String sectionChange = request.getParameter("sectionChange");
	  if(sectionChange==null){
		sectionChange = "Section.jsp";
	  }
   %>
  <jsp:include page="Header.jsp"/>
    <section>
	<jsp:include page="<%=sectionChange %>"/>
   </section>
  <jsp:include page="Footer.jsp"/>
</body>
</html>