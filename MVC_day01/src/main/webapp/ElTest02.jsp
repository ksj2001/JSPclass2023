<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="400">
		<tr>
			<th width="50%">표현식</th>
			<th>값</th>
		</tr>
		<tr>
			<td align="center">\${ 25+36 }</td>
			<td align="center">${ 25+36 }</td>
		</tr>
		<tr>
			<td align="center">\${ 25/6 }</td>
			<td align="center">${ 25/6 }</td>
		</tr>
		<tr>
			<td align="center">\${ 25%6 }</td>
			<td align="center">${ 25 mod 6 }</td>
		</tr>
		<tr>
			<td align="center">\${ 25>36 }</td>
			<td align="center">${ 25>36 }</td>
		</tr>
		<tr>
			<td align="center">\${ header['host'] }</td>
			<td align="center">${ header['host'] }</td>
		</tr>
		<tr>
			<td align="center">\${ header.host }</td>
			<td align="center">${ header.host }</td>
		</tr>
	</table>
</body>
</html>