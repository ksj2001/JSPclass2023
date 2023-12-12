<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listSearch{
	display: flex;
	justify-content: center;
	width: 100%;
	height: 1200px;
	background-color: #fff;
}
.listSearchWrap{
	width: 950px;
}
.car{
	display: flex;
	/* justify-content: flex-start; */
	align-items: center;
	gap: 20px;
	flex-flow: row wrap;
	width: 950px;
	height: 1200px;
}
.carProduct{
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
<div class="listSearch">
  <div class="listSearchWrap">
<%
	request.setCharacterEncoding("UTF-8");

	int category = Integer.parseInt(request.getParameter("category"));
	RentCarDAO rdao = new RentCarDAO();
	ArrayList<CarListBean> aList = rdao.getCategory(category);
%>
	<div class="car">
<%
	for(int i=0;i<aList.size();i++){
		CarListBean cbean = aList.get(i);
		// 한 줄에 자동차 세 개씩 출력
%>
		<div class="carProduct">
			<a href="RentCarMain.jsp?sectionChange=CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
				<img src="img/<%=cbean.getImg()%>" width="300" height="200">
			</a>
			<div class="caption">
				<p>차량명 : <%=cbean.getName() %></p><br>
				<p>금액 : <%=cbean.getPrice() %></p>
			</div>
		</div>
<%
	}
%>
	</div>
  </div>
</div>
</body>
</html>