<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.optionContainer{
	display: flex;
	justify-content: center;
	width: 100%;
	height: 500px;
	margin: 100px 0;
	background-color: #fff;
}
.optionContainerWrap{
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
	width: 600px;
	height: 420px;
	margin-left: 100px;
}
.main .cont .row{
	display: flex;
	width: 100%;
	height: 60px;
}
.row .fieldName, .row .fieldValue{
	width: 50%;
	height: 100%;
}
.row .fieldValue select, .row .fieldValue input[type=date]{
	width: 150px;
}
.row .btn{
	margin: 0 auto;
} 
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String img = request.getParameter("img");
	int carcnt = Integer.parseInt(request.getParameter("carcnt"));
%>
<div class="optionContainer">
	<div class="optionContainerWrap">
		<div class="util">옵션 선택</div>
		<div class="main">
			<div class="img"><img src="img/<%=img%>" width="700" height="420"></div>
			<form action="RentCarMain.jsp?sectionChange=CarReserveResult.jsp" method="post">
				<div class="cont">
					<div class="row">
						<div class="fieldName">대여기간</div>
						<div class="fieldValue">
							<select name="dday">
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fieldName">대여일</div>
						<div class="fieldValue">
							<input type="date" name="rday" class="select" id="currentDate">
						</div>
					</div>
					<div class="row">
						<div class="fieldName">보험적용</div>
						<div class="fieldValue">
							<select name="usein">
								<option value="1">적용(1일:1만원)</option>
								<option value="2">비적용</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fieldName">WiFi적용</div>
						<div class="fieldValue">
							<select name="usewifi">
								<option value="1">적용(1일:1만원)</option>
								<option value="2">비적용</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fieldName">네비게이션 적용</div>
						<div class="fieldValue">
							<select name="usenavi">
								<option value="1">적용(무료)</option>
								<option value="2">비적용</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="fieldName">베이비시트 적용</div>
						<div class="fieldValue">
							<select name="usebaby">
								<option value="1">적용(1일:1만원)</option>
								<option value="2">비적용</option>
							</select>
						</div>
					</div>
					<div class="row">
						<input type="hidden" name="no" value="<%=no%>">
						<input type="hidden" name="carcnt" value="<%=carcnt%>">
						<div class="btn"><input type="submit" value="차량예약하기"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 대여일자 선택 시 null 에러(404 not found)를 방지하기 위해 기본값으로 오늘 날짜를 출력
	let today = new Date().toISOString().substring(0,10);
	document.getElementById("currentDate").value = today;
</script>
</body>
</html>