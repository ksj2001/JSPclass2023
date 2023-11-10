<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     
	<form action="CoffeeProc.jsp">
		<h2>커피메뉴</h2>
		<input type="radio" name="coffeeName" value="1"/>아메리카노(3000원)<br>
		<input type="radio" name="coffeeName" value="2"/>카페라떼(3300원)<br>
		<input type="radio" name="coffeeName" value="3"/>에스프레소(2500원)<br>
		<input type="radio" name="coffeeName" value="4"/>얼그레이티(3500원)<br>
		수량&nbsp;: <input type="number" name="count"><br>
		입금액&nbsp;: <input type="number" name="money">
		<input type="submit" value="주문처리"> 
	</form>
</body>
</html>