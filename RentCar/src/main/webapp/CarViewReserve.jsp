<%@page import="db.CarViewBean"%>
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
.reserve{
	width: 1000px;
	min-height: 400px;
	margin: 0 auto;
}
h2{
	font-size: 32px;
	font-weight: 600;
	text-align: center;
	margin: 50px 0;
}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
	<script type="text/javascript">
		alert('로그인 후 사용가능');
		location.href = 'RentCarMain.jsp?sectionChange=MemberLogin.jsp';
	</script>
<%		
	}
	RentCarDAO rdao = new RentCarDAO();
	ArrayList<CarViewBean> aList = rdao.getReserveList(id);
%>
	<div class="reserve">
	<h2>차량 예약 내역</h2>
	<table width="1000" border="1">
		<tr height="40">
			<td align="center" width="150">이미지</td>
			<td align="center" width="150">차량명</td>
			<td align="center" width="150">대여일</td>
			<td align="center" width="60">대여기간</td>
			<td align="center" width="100">대여금액</td>
			<td align="center" width="60">대여수량</td>
			<td align="center" width="60">보험</td>
			<td align="center" width="60">wifi</td>
			<td align="center" width="60">네비게이션</td>
			<td align="center" width="60">베이비시트</td>
			<td align="center" width="90">삭제</td>
		</tr>
	<%
		for(int i=0;i<aList.size();i++){
			CarViewBean vBean = aList.get(i);
	%>
		<tr height="40">
			<td align="center" width="150"><img src="img/<%=vBean.getImg()%>" width="80" height="40"></td>
			<td align="center" width="150"><%=vBean.getName()%></td>
			<td align="center" width="150"><%=vBean.getRday()%></td>
			<td align="center" width="60"><%=vBean.getDday()%></td>
			<td align="center" width="100"><%=vBean.getPrice()%></td>
			<td align="center" width="60"><%=vBean.getCarcnt()%></td>
			<td align="center" width="60"><%=vBean.getUsein()%></td>
			<td align="center" width="60"><%=vBean.getUsewifi()%></td>
			<td align="center" width="60"><%=vBean.getUsenavi()%></td>
			<td align="center" width="60"><%=vBean.getUsebaby()%></td>
			<td align="center" width="90"><input type="button" value="삭제" onclick="location.href='CarReserveDel.jsp?no=<%=vBean.getNo()%>'"></td>
		</tr>
	<%
		}
	%>
	</table>
	</div>
</body>
</html>