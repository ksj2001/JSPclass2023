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
.carReserve{
	width: 1400px;
	height: 600px;
	margin: 50px auto;
	background-color: #fff;
}
#searchTable{
	margin: 0 auto;
}
#searchTable tr td{
	text-align: center;
}
#searchTable tr td p{
	margin-top: 8px;
}
.search_title{
	margin-top: 30px;
	font-size: 18px;
	font-weight: 600;
	color: #777;
	text-align: center;
}
.carSearch{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 600px;
	height: 50px;
	margin: 20px auto;
}
.carSearch input[type=submit],.carSearch button{
	width: 85px;
	height: 25px;
}
</style>
</head>
<body>
<%
	RentCarDAO rdao = new RentCarDAO();
	ArrayList<CarListBean> alist = rdao.getSelectCar();
%>
<div class="carReserve">
<table width="1000" id="searchTable">
	<tr height="240">
	<%
		for(int i=0;i<alist.size();i++){
			CarListBean cbean = alist.get(i);
	%>
		<td width="333" align="left">
		    <!-- CarReserveInfo : 자동차 정보 상세보기 -->
			<a href="RentCarMain.jsp?sectionChange=CarReserveInfo.jsp?no=<%=cbean.getNo()%>">
				<img src="img/<%=cbean.getImg()%>" width="310" height="150">
			</a><br>
			<p>차량명 : <%=cbean.getName()%></p>
		</td>
	<%  }%>
	</tr>
</table>
<p class="search_title">차량 검색하기</p>
<div class="carSearch">
	<form action="RentCarMain.jsp?sectionChange=CarCategoryList.jsp" method="post">
		<label>차량 검색 하기</label>
		<select name="category">
			<option value="1">소형</option>
			<option value="2">중형</option>
			<option value="3">대형</option>
		</select>&nbsp;&nbsp;
		<input type="submit" value="검색">&nbsp;&nbsp;
	</form>
	<button onclick="location.href='RentCarMain.jsp?sectionChange=CarAllList.jsp'">전체 검색</button>
</div>
</div>
</body>
</html>