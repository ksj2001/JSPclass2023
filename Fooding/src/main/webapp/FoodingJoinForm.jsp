<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		display: flex;
		justify-content: center;
	}
	h2{
		text-align: center;
	}
	h2 span{
		font-size: 1em;
		font-weight: bold;
		color: #00A7B3;
	}
	.container{
		width: 100%;
	}
	.box{
		width: 550px;
		height: 560px;
		margin: 0 auto;
		border: 1px solid #ddd;
		border-top: 1px solid #00A7B3;
	}
	.box span{
		display: block;
		text-align: center;
		color: #aaa;
		margin: 20px 0;
	}
	.box .formBox{
		width: 400px;
		margin: 0 auto;
	}
	.box .formBox h3{
		margin: 0;
		color: #00A7B3;
	}
	.content{
		width: 400px;
		height: 35px;
		margin: 10px 0;
		padding-left: 10px;
		border: 1px solid #aaa;
		border-radius: 3px;
		background-color: #f6f6f6;
	}
	.content:focus{
		background-color: #E8F0FE;
		outline: none;
	}
	.btns{
		width: 200px;
		margin: 0 auto;
		margin-top: 5px;
	}
	input[type='text'],input[type='password'],input[type='tel'],input[type='email']{
		font-size: 14px;
	}
	input[type='submit'],input[type='reset']{
		width: 80px;
		height: 35px;
		font-size: 14px;
		cursor: pointer;
	}
	input[type='reset']{
		border: 1px solid #00A7B3;
		color: #00A7B3;
		background-color: white;
	}
	input[type='submit']{
		margin-left: 5px;
		border: none;
		color: white;
		background-color: #00A7B3;
	}
</style>
</head>
<body>
	<div class="container">
		<h2><span>푸딩팩토리</span> 정보입력</h2>
		<div class="box">
			<span>지금 회원가입하신 후 푸딩팩토리의 다양한 식자재 메뉴를 만나보세요.</span>
			<div class="formBox">
				<h3>필수항목</h3>
				<form action="FoodingJoinProc.jsp" method="post">
					<input type="text" name="name" class="content" placeholder="이름">
					<input type="text" name="id" class="content" placeholder="아이디">
					<input type="password" name="pw" class="content" placeholder="비밀번호">
					<input type="password" name="pwchk" class="content" placeholder="비밀번호확인">
					<div class="pwCheck"></div>
					<input type="tel" name="tel" class="content" placeholder="휴대전화번호">
					<input type="email" name="email" class="content" placeholder="이메일">
					<input type="text" name="address" class="content" placeholder="주소">
					<div class="btns">
						<input type="reset" value="취소">
						<input type="submit" value="회원가입">	
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// 비밀번호가 일치하지 않을 때에는 '비밀번호가 일치하지 않습니다' 출력
		let id = document.getElementsByName('id');
		let pw = document.getElementsByName('pw');
		let pwchk = document.getElementsByName('pwchk');
		let pwCheckDiv = document.getElementsByClassName("pwCheck");
		pwchk[0].addEventListener("focusout", () =>{
			if(pw[0].value!="" && pwchk[0].value!=""){
				if(pw[0].value===pwchk[0].value){
					pwCheckDiv[0].innerHTML = "비밀번호가 일치합니다.";
				}
				else{
					pwCheckDiv[0].innerHTML = "비밀번호가 일치하지 않습니다.";
				}
			}
			else{
				pwCheckDiv[0].innerHTML = "";
			}
		})
		
		/* id[0].addEventListener("focusout", () =>{
			const regexId = /^[A-za-z0-9]{6,12}/;
			if(!regexId.test(id[0].value)){
				alert("아이디는 알파벳 또는 숫자를 포함하여야 하고 6~12자리 이내여야 합니다.");
				history.go(-1);
			}
		})
		pw[0].addEventListener("focusout", () =>{
			const regexPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/;
			 if(!regexPw.test(pw[0].value)){
				alert("비밀번호는 알파벳,숫자,특수기호(!@#$%^*+=-)를 포함하여야 하고 6~12자리 이내여야 합니다.");
				history.go(-1);
			}
		}) */
		    
			
			
	</script>
</body>
</html>