<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
	text-align: center;
}
.tableContainer{
	display: flex;
	justify-content: center;
}
table{
	border: none;
}
</style>
</head>
<body>
<h2>계산기</h2>
<div class="tableContainer">
	<table width="600">
	<!-- 자기 자신 form에서 자신의 form으로 넘겨주는 것을 재귀라고 한다. -->
	<form action="ElCal.jsp">
		<tr height="40">
			<td width="150"><input type="text" name="num1" value="${param.num1}"></td>
			<td width="40">
				<select name="operator">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select>
			</td>
			<td width="150"><input type="text" name="num2" value="${param.num2}"></td>
			<td width="40">=</td>
			<td width="150">
			<% 
			String op = request.getParameter("operator");
			
			if(op==null){
				op="+";
			}
			if(op.equals("+")){
			%>
				<input type="text" name="result" value="${param.num1+param.num2}">
			<%
			}else if(op.equals("-")){
			%>
				<input type="text" name="result" value="${param.num1-param.num2}">
			<%
			}else if(op.equals("*")){
			%>
				<input type="text" name="result" value="${param.num1*param.num2}">
			<%
			}else{
			%>
				<input type="text" name="result" value="${param.num1/param.num2}">
			<%
			}
			%>
			</td>
			<td width="70"><input type="submit" value="결과보기"></td>
		</tr>
	</form>
	</table>
</div>
</body>
</html>