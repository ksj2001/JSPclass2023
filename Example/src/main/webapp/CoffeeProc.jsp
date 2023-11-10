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
	/* String coffeeName = request.getParameter("coffeeName"); */
     int coffeeName = Integer.parseInt(request.getParameter("coffeeName")) ;
	String name;
	int price;
	int count = Integer.parseInt(request.getParameter("count"));
	int money = Integer.parseInt(request.getParameter("money"));
	switch(coffeeName){
	case 1:
		name = "아메리카노";
		price = 3000;
		break;
	case 2:
		name = "카페라떼";
		price = 3300;
		break;
	case 3:
		name = "에스프레소";
		price = 2500;
		break;
	default:
		name = "얼그레이티";
		price = 3500;
		break;
	}
	int total = count*price;
	int change = money-total;
%>
<h2>주문계산 결과</h2>
<ul>
	<li>커피종류&nbsp;:&nbsp;<%= name%></li>
	<li>1개 가격&nbsp;:&nbsp;<%= price%></li>
	<li>수량&nbsp;:&nbsp;<%= count%></li>
	<li>총 금액&nbsp;:&nbsp;<%= total%></li>
	<li>입금액&nbsp;:&nbsp;<%= money%></li>
	<li>거스름돈&nbsp;:&nbsp;<%= change%></li>
</ul>
</body>
</html>