<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
<style>
	body{
	display: flex;
	justify-content: center;
	}
	h2{
	text-align: center;
	}
	table{
	border-collapse: collapse;
	}
	table tr td{
		text-align: center;
	}
	input{
	height: 25px;
	}
	input[type=checkbox]{
	vertical-align: center;
	}
	input[type=submit],button{
	width: 100px;
	height: 30px;
	margin: 0 10px;
	cursor: pointer;
	}
</style>
</head>
<body>
<%
	/* 사용자의 컴퓨터에서 쿠키 값을 배열로 얻어오기 */	
	Cookie[] cookie = request.getCookies();
	String id = "";
	// 얻어온 쿠키 값은 반드시 null 처리한다.
	if(cookie != null){
		for(int i=0;i<cookie.length;i++){
			if(cookie[i].getName().equals("id")){ // getName은 name값을 찾아준다.
				id = cookie[i].getValue(); // getValue는 getName에 입력된 값을 가져온다.
				break;
			}
		}
	}
%>

<div class="container">
	<h2>쿠키 로그인</h2>
	<form action="CookieLoginProc.jsp">
		<table width="400" border="1" id="popUp">
			<tr height="50">
				<td width="150">아이디</td>
				<td width="250"><input type="text" name="id" value="<%=id%>"></td>
			</tr>
			<tr height="50">
				<td width="150">패스워드</td>
				<td width="250"><input type="password" name="pw"></td>
			</tr>
			<tr height="50">
				<td colspan="2">
					<input type="checkbox" name="save" value="1">아이디 저장
					<input type="checkbox" name="close" value="2" id="close">오늘 하루동안 닫기
				</td>
			</tr>
			<tr height="50">
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
	// 쿠키값 얻어오는 함수
	function getCookie(name){
		let value = document.cookie.match('(^|;) ?'+name+'=([^;]*)(;|$)');
		console.log('쿠키값: '+value);
		return value? value[2]:null;
	}
	
	// 모달 창 닫기 함수
	let cookieModal = document.querySelector("#popUp");
	let cookieCheck = document.querySelector("#close");
	
	cookieCheck.addEventListener("click", ()=>{
		// 만료시간 하루 24시간으로 설정. 단 ms로 지정한다.
		let date = new Date(Date.now()+24*60*60*1000);
		// toUTCString() 메서드는 날짜를 문자열로 변환하여 UTC 시간대로 해석한다.
		date = date.toUTCString();
		// 쿠키값을 key=value;
		document.cookie = `modalClose=T; expires=${date}`;
		modalClose();
	})
	
	function modalClose(){
		cookieModal.style.display = "none";
	}
	
	// 즉시실행 function 작성방법
	(function (){
		if(getCookie('modalClose')) modalClose();
	})();
</script>
</body>
</html>