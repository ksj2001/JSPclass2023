<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.navi{
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	.navi .menu ul, .navi .account ul{
		display: flex;
	}
	.navi ul > li > a{
		display: block;
		margin: 10px 30px;
		font-size: 16px;
		font-weight: 700;
	}
	hr{
		background-color: #ccc;
		height: 1px;
		border: 0;
	}
</style>
</head>
<body>
<%
	/* 로그아웃 코드 */
	String logout = request.getParameter("logout");
    /* 로그아웃 되면 logout의 값이 null이 아니므로 id에 null을 저장 */
	if(logout!=null){
		session.setAttribute("id", null);
		/* 즉시 종료 */
		session.setMaxInactiveInterval(0);
	}
    
    String id = (String)session.getAttribute("id");
%>

<div class="container">
	<div class="util">
		<div class="logo"><a href="Main.jsp"><img alt="" src="img/logo.JPG"></a></div>
		<div class="navi">
			<div class="menu">
				<ul>
					<%if(id!=null && id.equals("admin123")){%>
						<li><a href="Main.jsp?changePage=FoodingList.jsp">회원관리</a></li>
						<li><a href="#">게시물관리</a></li>
						<li><a href="#">상품관리</a></li>
					  <%}else{ %>
					<li><a href="#">카테고리 전체</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">베스트</a></li>
					<li><a href="#">세일</a></li>
					<li><a href="#">입점브랜드</a></li>
					<li><a href="#">푸딩콕</a></li>
					<%}%>
				</ul>
			</div>
			<div class="account">
				<ul>
					<%if(id==null){ %>
						<li><a href="Main.jsp?changePage=Login.jsp">로그인</a></li>
						<li><a href="Main.jsp?changePage=FoodingJoinForm.jsp">회원가입</a></li>
						<li><a href="Main.jsp?changePage=BoardMainList.jsp">1:1문의</a></li>
					<%}else{
							if(id.equals("admin123")){%>
								<li><a href="#" style="cursor: default">관리자 로그인</a></li>
								<li><a href="Main.jsp?logout=1">로그아웃</a></li>
					<%		}else{%>
								<li><a href="#" style="cursor: default"><%=id %>님 로그인!</a></li>
								<li><a href="Main.jsp?logout=1">로그아웃</a></li>
					<%		}%>
							<li><a href="Main.jsp?changePage=FoodingBoardList.jsp">1:1문의</a></li>	
					<%}%>
				</ul>
			</div>
		</div>
	</div>
	<hr>
</div>
</body>
</html>