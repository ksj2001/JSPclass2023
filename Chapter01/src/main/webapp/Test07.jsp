<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>멤버 메서드와 멤버 변수</h2>
<%!
	public double cal(double num1, double num2, String op){
		double result = 0.0;
		if(op.equals("+")){
			result = num1 + num2;
		}
		else if(op.equals("-")){
			result = num1 - num2;
		}
		else if(op.equals("*")){
			result = num1 * num2;
		}
		else if(op.equals("/")){
			result = num1 / num2;
		}
		return result;
	}
%>
<h2>출력문</h2>
<hr>
10 + 5 = <%=cal(10,5,"+") %><br>
10 - 5 = <%=cal(10,5,"-") %><br>
10 * 5 = <%=cal(10,5,"*") %><br>
10 / 5 = <%=cal(10,5,"/") %><br>
</body>
</html>