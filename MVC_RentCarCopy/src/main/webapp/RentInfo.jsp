<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.infocontainer{
	width: 100%;
	display: flex;
	justify-content: center;
}
.infocontainerWrap{
	width: 1000px;
	margin: 20px 0;
}
</style>
</head>
<body>
	<div class="infocontainer">
		<div class="infocontainerWrap">
			<form action="JangProc.do" method="post">
				<table width="1000">
					<tr height="100">
						<td align="center" colspan="3">${rdto.name} 차량 선택</td>
					</tr>
					<tr height="100">
						<td rowspan="6" width="500"><img alt="" src="img/${rdto.img}" width="450"></td>
						<td width="250" align="center">차량이름</td>
						<td width="250" align="center">${rdto.name}</td>
					</tr>
					<tr height="100">
						<td width="250" align="center">차량수량</td>
						<td width="250" align="center">
							<select name="cnt">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</td>
					</tr>
					<tr height="100">
						<td width="250" align="center">대여가격</td>
						<td width="250" align="center">${rdto.price}원</td>
					</tr>
					<tr height="100">
						<td width="250" align="center">제조회사</td>
						<td width="250" align="center">${rdto.company}</td>
					</tr>
					<tr height="100">
						<td align="center" colspan="2">
							<input type="hidden" name="no" value="${rdto.no}">
							<input type="hidden" name="img" value="${rdto.img}">
							<input type="hidden" name="name" value="${rdto.name}">
							<input type="hidden" name="price" value="${rdto.price}">
							<input type="submit" value="장바구니 담기">&nbsp;&nbsp;
							<input type="button" value="목록보기" onclick="location.href='RentListPro.do'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>