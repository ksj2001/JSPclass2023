<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {box-sizing:border-box;}
	body{
		display: flex;
		justify-content: center;
	}
	h3,h4{
		margin: 5px 0;
	}
	input[type='text'],input[type='password'],input[type='submit']{
		font-size: 14px;
	}
	.container{
		width: 100%;
	}
	.container .title{
		display: flex;
		justify-content: center;
		margin-top: 50px;
	}
	.container .title .titlewrap{
		width: 750px;
	}
	.content{
		display: flex;
		justify-content: center;
		height: 600px;
	}
	.loginBox{
		width: 500px;
		height: 530px;
		margin-right: 20px;
		padding: 20px 30px;
		border: 1px solid #aaa;
	}
	.idpwconfirm{
		display: flex;
	}
	.idpw input{
		display: block;
		width: 320px;
		height: 23px;
		margin: 10px 0;
		margin-right: 10px;
		border: 1px solid #888;
	}
	.idpw input:focus{
		outline: none;
	}
	.confirmbtn input{
		width: 100px;
		height: 70px;
		font-weight: 700;
		border: none;
		color: white;
		background-color: #00A7B3;
		cursor: pointer;
	}
	.member h4{
		margin-top: 40px;
	}
	.member .memberbtns{
		margin-bottom: 50px;
	}
	.member .memberbtns button{
		width: 142px;
		height: 35px;
		font-size: 14px;
		font-weight: 700;
		border: 1px solid #555;
		color: #555;
		background-color: white;
		cursor: pointer;
	}
	.member .memberbtns button.signup{
		border: none;
		color: white;
		background-color: #555;
	}
	.member hr{
		margin-top: 30px;
		margin-bottom: 20px;
	}
	.nonmember span{
		font-size: 12px;
	}
	.cupon{
		/* float: right; */
	}
	.cupon a{
		display: block;
	}
</style>
</head>
<body>
<div class="container">
	<div class="title">
		<div class="titlewrap">
			<h3>로그인</h3>
		</div>
	</div>
	<div class="content">
		<div class="loginBox">
			<div class="member">
				<h4>회원 로그인</h4>
				<form action="LoginProc.jsp" method="post">
					<div class="idpwconfirm">
						<div class="idpw">
							<input type="text" name="id" placeholder="아이디">
							<input type="password" name="pw" placeholder="비밀번호">
						</div>
					<div class=confirmbtn><input type="submit" value="로그인"></div> 
				</div>
				</form>
				<hr>
				<div class="memberbtns">
					<button type="button" class="signup" onclick="location.href = 'Main.jsp?changePage=FoodingJoinForm.jsp'">회원가입</button>
					<button type="button" onclick="#">아이디 찾기</button>
					<button type="button" onclick="#">비밀번호 찾기</button>
				</div>
			</div>
			<div class="nonmember">
				<h4>비회원 주문조회 하기</h4>
				<div class="idpwconfirm">
					<div class="idpw">
						<input type="text" name="ordername" placeholder="주문자명">
						<input type="text" name="ordernum" placeholder="주문번호">
					</div>
					<div class="confirmbtn"><input type="submit" value="확인"></div> 
				</div> 
				<span>! 주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</span>
			</div>
		</div>
		<div class="cupon">
			<a href="#"><img alt="" src="img/cupon1.JPG"></a>
			<a href="#"><img alt="" src="img/cupon2.JPG"></a>
		</div>
	</div>
</div>
</body>
</html>