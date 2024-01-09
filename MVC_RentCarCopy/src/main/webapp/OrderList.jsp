<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.addressContainer{
	width: 100%;
	height: 680px;
	display: flex;
	justify-content: center;
}
.addressContainer .addressContainerWrap{
	width: 600px;
	margin: 20px 0;
}
.addressContainerWrap h2{
	font-size: 28px;
	font-weight: 600;
	text-align: center;
}
#phone01,#phone02,#phone03{
	width: 60px;
}
#roadAddress,#detailAddress{
	width: 300px;
}
</style>
</head>
<body>
	<div class="addressContainer">
		<div class="addressContainerWrap">
			<h2>주문 상세내역</h2>
			아이디: ${loginId}
			<form action="ToOrderListProc.do" name="formname" method="post">
				<table width="600" border="1" id="ordertable">
					<tr height="40">
						<td width="50" align="center">상품번호</td>
						<td width="50" align="center">상품이미지</td>
						<td width="50" align="center">상품명</td>
						<td width="50" align="center">상품수량</td>
						<td width="50" align="center">상품가격</td>
						<td width="50" align="center">총금액</td>
					</tr>
					<c:forEach var="a" items="${aList}">
						<tr height="40">
							<td width="50" align="center">${a.no}
								<input type="hidden" name="no" value="${a.no}">
							</td>
							<td width="50" align="center">
								<img alt="" src="img/${a.img}" width="60" height="60">
								<input type="hidden" name="img" value="${a.img}">
							</td>
							<td width="50" align="center">${a.name}
								<input type="hidden" name="name" value="${a.name}">
							</td>
							<td width="50" align="center">${a.cnt}
								<input type="hidden" name="cnt" value="${a.cnt}">
							</td>
							<td width="50" align="center"><fmt:formatNumber value="${a.price}" pattern="#,##0"/>
								<input type="hidden" name="price" value="${a.price}">
								<input type="hidden" name="loginId" value="${loginId}">
							</td>
							<td width="50" align="center"><fmt:formatNumber value="${a.cnt * a.price}" pattern="#,##0"/></td>
						</tr>
					</c:forEach>
					<tr height="60">
						<td align="center" colspan="6" id="rent" align="center">배송지 정보</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">이름</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="text" name="buy_name" id="buy_name">
						</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">연락처</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="text" name="phone01" id="phone01" value="010">-
							<input type="text" name="phone02" id="phone02" maxlength="4">-
							<input type="text" name="phone03" id="phone03" maxlength="4">
						</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">이메일</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="email" name="email" id="email">
						</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">우편번호</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="text" name="postcode" id="postcode" placeholder="우편번호">&nbsp;
							<input type="button" onclick="DaumPostCode()" class="dup" value="우편번호 찾기">
						</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">주소</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
						</td>
					</tr>
					<tr height="40">
						<td width="100" align="center">상세주소</td>
						<td width="300" colspan="5" align="left" class="info">
							<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
						</td>
					</tr>
					<tr height="40">
						<td colspan="6" align="center">
							<input type="button" class="btn" value="이전" onclick="location.href='JangProc.do'">
							<input type="button" class="btn" value="주문" onclick="checkMember()">
							<input type="reset" class="btn" value="다시입력">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
<script type="text/javascript">

   let postcode = document.getElementById('postcode').value;
   let roadAddress = document.getElementById('roadAddress').value;
   let detailAddress = document.getElementById('detailAddress');
    // Daum API와 연결하여 우편번호, 주소 출력
	function DaumPostCode(){
		new daum.Postcode({
		    oncomplete: function(data) {
		        let addr = "";
		        if(data.userSelectedType === 'R'){
		        	addr = data.roadAddress;
		        }else{
		        	addr = data.jibunAddress;
		        }
		        postcode = data.zonecode;
		        roadAddress = addr;
		        detailAddress.focus();
		    },
		}).open();
	}
    
    // 정규식을 이용하여 예외처리
    function checkMember(){
    	let regExpName = /^[가-힣]*$/; 
    	let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
    	let regExpEmail = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
    	
    	let formname = document.formname;
    	let name = document.getElementById('buy_name').value;
    	let email = document.getElementById('email').value;
    	let phone01 = document.getElementById('phone01').value;
    	let phone02 = document.getElementById('phone02').value;
    	let phone03 = document.getElementById('phone03').value;
    	let phone = phone01+"-"+phone02+"-"+phone03;
    	
    	if(!regExpName.test(name) || name===""){
    		alert("이름은 한글로만 입력하세요");
    		return
    	}
    	if(!regExpPhone.test(phone)){
    		alert("연락처 입력을 확인해 주세요");
    		return
    	}
    	if(!regExpEmail.test(email)){
    		alert("이메일 입력을 확인해 주세요");
    		return
    	}
    	if(postcode===""){
    		alert("우편번호를 입력하세요");
    		return
    	}
    	if(roadAddress===""){
    		alert("도로명/지번주소를 입력하세요");
    		return
    	}
    	if(detailAddress===""){
    		alert("상세주소를 입력하세요");
    		return
    	}
    	
    	formname.submit();
    }
</script>
</body>
</html>