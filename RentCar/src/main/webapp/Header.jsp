<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reset.css">
<style type="text/css">
.headerContainer{
	display: flex;
	justify-content: center;
	width: 100%;
	height: 110px;
	background-color: #fff;
	border-bottom: 1px solid #ddd;
}
.headerContainerWrap{
	width: 1400px;
}
.headerContainerWrap .logo{
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.headerContainerWrap .logo img{
	width: 120px;
	height: 60px;
}
.headerContainerWrap .logo button{
	width: 60px;
	height: 25px;
}
.headerContainerWrap .navi{
	display: flex;
	align-items: center;
	margin-top: 20px;
}
.headerContainerWrap .navi .menu{
	width: 20%;
	text-align: center;
}
.headerContainerWrap .navi .menu a{
	font-size: 15px;
	font-weight: 600;
}
</style>
</head>
<body>
	<div class="headerContainer">
		<div class="headerContainerWrap">
			<div class="logo">
				<img alt="" src="img/sk_logo.png">
			<%  if(true){%>
				<button name="login">로그인</button>
			<%  }else{%>
				<button name="logout">로그아웃</button>
			<%  }%>
			</div>
			<div class="navi">
				<div class="menu"><a href="RentCarMain.jsp?sectionChange=CarReserveMain.jsp">예약하기</a></div>
				<div class="menu"><a href="#">예약확인</a></div>
				<div class="menu"><a href="#">게시판</a></div>
				<div class="menu"><a href="#">이벤트</a></div>
				<div class="menu"><a href="#">고객센터</a></div>
			</div>
		</div>
	</div>
</body>
</html>