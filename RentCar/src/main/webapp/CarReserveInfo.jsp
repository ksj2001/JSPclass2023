<%@page import="db.CarListBean"%>
<%@page import="db.RentCarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.infoContainer{
	display: flex;
	justify-content: center;
	width: 100%;
	height: 500px;
	margin: 100px 0;
	background-color: #fff;
}
.infoContainerWrap{
	width: 1400px;
}
.util{
	width: 100%;
	height: 80px;
	font-size: 18px;
	color: #777;
	text-align: center;
}
.main{
	display: flex;
	width: 100%;
	height: 420px;
}
.img{
	width: 700px;
	height: 420px;
}
.main .cont{
	width: 700px;
	height: 420px;
}
.main .cont .row{
	display: flex;
	width: 100%;
	height: 70px;
}
.row .fieldName, .row .fieldValue{
	width: 50%;
	height: 100%;
	text-align: center;
}
.row .btn{
	margin: 0 auto;
} 
</style>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	RentCarDAO rdao = new RentCarDAO();
	String categoryName = "";
	CarListBean clbean = rdao.getOneCar(no);
	if(clbean.getCategory()==1) categoryName="소형";
	else if(clbean.getCategory()==2) categoryName="중형";
	else categoryName="대형";
%>
<div class="infoContainer">
	<div class="infoContainerWrap">
		<div class="util"><%=clbean.getName()%> 차량 선택</div>
		<div class="main">
			<div class="img"><img src="img/<%=clbean.getImg()%>" width="700" height="420"></div>
			<form action="RentCarMain.jsp?sectionChange=CarOptionSelect.jsp" method="post">
				<div class="cont">
					<div class="row">
						<div class="fieldName">차량이름</div>
						<div class="fieldValue" name="name"><%=clbean.getName()%></div>
					</div>
					<div class="row">
						<div class="fieldName">차량수량</div>
						<div class="fieldValue">
							<select name="carcnt">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fieldName">차량분류</div>
						<div class="fieldValue" name="category"><%=categoryName%></div>
					</div>
					<div class="row">
						<div class="fieldName">대여가격</div>
						<div class="fieldValue" name="price"><%=clbean.getPrice()%></div>
					</div>
					<div class="row">
						<div class="fieldName">제조회사</div>
						<div class="fieldValue" name="company"><%=clbean.getCompany()%></div>
					</div>
					<div class="row">
						<input type="hidden" name="no" value="<%=clbean.getNo()%>">
						<input type="hidden" name="img" value="<%=clbean.getImg()%>">
						<div class="btn"><input type="submit" value="옵션선택 후 대여하기"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>