<%@page import="db.CarListBean"%>
<%@page import="db.RentCarDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	height: 1600px;
	margin: 0 auto;
}
h2{
	font-size: 32px;
	font-weight: 600;
}
table{
	border: none;
}
table tr td img{
	width: 800px;
	height: 500px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	int carcnt = Integer.parseInt(request.getParameter("carcnt"));
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*"/>
</jsp:useBean>
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
	
	// 오늘 날짜 이전의 날짜로는 예약 불가능하도록 예외 처리
	Date rday = new Date(); // new Date()는 무조건 오늘 날짜가 출력됨
	Date today = new Date();
	
    // 날짜를 형식에 맞춰서 변환하는 SimpleDateFormat을 객체 이용한다.
    SimpleDateFormat sdaf = new SimpleDateFormat("yyyy-MM-dd");
    // 숫자의 세 자리마다 콤마(,)로 변환해주는 DecimalFormat 객체를 이용한다.
    DecimalFormat dif = new DecimalFormat("#,##0");
    
    rday = sdaf.parse(rbean.getRday()); // 예약 날짜 (String으로 되어져 있는 rday를 날짜 형식으로 변환)
    today = sdaf.parse(sdaf.format(today)); // Fri Dec 15 00:00:00 KST 2023
   
    // A.compareTo(B) : A==B이면 0, A<B이면 -1, A>B이면 1
    int compare = rday.compareTo(today);
    if(compare<0){ // 오늘 날짜 이전으로는 예약 불가능하도록 예외 처리
%>
	<script type="text/javascript">
		alert('오늘 날짜 이전으로는 예약 불가능합니다.');
		history.go(-1);
	</script>
<%
    }else{ // 모든 조건을 만족한 경우
    	rbean.setId(id);
       	RentCarDAO rcdao = new RentCarDAO();
       	rcdao.carReserveInsert(rbean);
       	CarListBean cbean = rcdao.getOneCar(no);
       	
       	int usein = 0;
       	if(rbean.getUsein()==1) usein=10000;
       	int usenavi = 0;
       	if(rbean.getUsenavi()==1) usenavi=10000;
       	int usebaby = 0;
       	if(rbean.getUsebaby()==1) usebaby=10000;
       	
       	int reserveTotal = rbean.getDday()*rbean.getCarcnt()*cbean.getPrice();
       	int optionTotal = usein+usenavi+usebaby;
       	int finalTotal = reserveTotal+optionTotal;	
    	
%>  
    	<div class="reserve">
	<h2>차량 예약 완료 화면</h2>
	<table width="1000">
		<tr>
			<td align="center"><img src="img/<%=cbean.getImg()%>" id="reserveImg"></td>
		</tr>
		<tr>
			<td align="center">차량 총예약 금액 <%=dif.format(reserveTotal)%>원</td>
		</tr>
		<tr>
			<td align="center">차량 총옵션 금액 <%=dif.format(optionTotal)%>원</td>
		</tr>
		<tr>
			<td align="center">차량 총금액 <%=dif.format(finalTotal)%>원</td>
		</tr>
	</table>
</div>
<%   	
    }
%>

</body>
</html>