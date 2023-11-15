<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table width="600" border="1">
			<!-- header 부분 -->
			<tr height="150">
				<td width="600" align="center">
				<%@include file="Header.jsp"%>
				</td>
			</tr>
			<!-- section 부분 -->
			<tr height="400">
				<td width="600" align="center">
					<img alt="" src="img/camera.jpg" width="400" height="300">
				</td>
			</tr>
			<!-- footer 부분 -->
			<tr height="100">
				<td width="600" align="center">
				<%@include file="Footer.jsp"%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>