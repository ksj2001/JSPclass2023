<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 60px;
}
.headerContainerWrap .logo img{
	float: left;
	width: 120px;
	height: 60px;
}
.headerContainerWrap .logo .buttonWrap{
	float: right;
	line-height: 60px;
}
.headerContainerWrap .logo button{
	min-width: 60px;
	height: 25px;
}
.headerContainerWrap .navi{
	height: 50px;
	display: flex;
	align-items: center;
}
.headerContainerWrap .navi .menu{
	width: 20%;
	text-align: center;
}
.headerContainerWrap .navi .menu a{
	font-size: 15px;
	font-weight: 600;
}
.headerContainerWrap .navi .menu span.add{
	display: inline-block;
	width: 18px;
	height: 18px;
    margin: 2px;
	border-radius: 50%;
	font-size: 10px;
	font-weight: 600;
	color: #fff;
	background-color: #000;
	line-height: 18px;
}
.headerContainerWrap .navi .menu span.remove{
	display: none;
}
</style>
</head>
<body>
 
	<div class="headerContainer">
		<div class="headerContainerWrap">
		 
			<div class="logo">
				<a href="RentCarMain.jsp"><img alt="" src="img/sk_logo.png"></a>
			<c:choose>
			  <c:when test="${loginId == null}">
			  	<div class="buttonWrap"><button name="login" onclick="location.href='RentCarMain.jsp?sectionChange=MemberLogin.jsp'">로그인</button></div>
			  </c:when>
			  <c:otherwise>
			  	<div class="buttonWrap">
			  		${loginId}님&nbsp;
					<button name="logout" onclick="location.href='MemberLogoutProc.do'">로그아웃</button>
			  	</div>
			  </c:otherwise>
			</c:choose>
			</div>
			<div class="navi">
				<div class="menu"><a href="RentListPro.do">예약하기</a></div>
				<div class="menu"><a href="RentCarMain.jsp?sectionChange=CarViewReserve.jsp">예약확인</a></div>
				<div class="menu"><a href="#">게시판</a></div>
				<div class="menu"><a href="JangProc.do">장바구니</a><span class="jangCnt">${rentJangCount}</span></div>
				<div class="menu"><a href="#">고객센터</a></div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	let jangCnt = document.querySelector(".jangCnt");
	let count = "<c:out value='${rentJangCount}'/>";
	
	if( parseInt(count) === 0){
		jangCnt.classList.add('remove');
	}else{
		jangCnt.classList.add('add');
	}
</script>
</body>
</html>