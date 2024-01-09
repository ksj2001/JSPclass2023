<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.jangcontainer{
	width: 100%;
	height: 680px;
	display: flex;
	justify-content: center;
}
h2{
	text-align: center;
	font-size: 28px;
	font-weight: 600;
	margin: 15px 0;
}
.jangcontainerWrap{
	width: 800px;
	margin: 20px 0;
}
.jangcontainerWrap table{
	border-left: none;
	border-right: none;
}
.jangcontainerWrap table tr:first-child{
	border-top: 3px solid #000;
	background-color: #ddd;
}
.jangcontainerWrap table td{
	border-left: none;
	border-right: none;
}
.cntcontainer{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100px;
	height: 20px;
}
.cntcontainer input{
	margin: 0;
	border: 1px solid #777;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	background-color: #fff;
}
.cntcontainer input[type="text"]{
	width: 40px;
	height: 28px;
}
.cntcontainer input[type="button"]{
	width: 30px;
	height: 30px;
	cursor: pointer;
}
.cntcontainer .minus{
	border-radius: 5px 0 0 5px;
	border-right: none;
}
.cntcontainer .plus{
	border-radius: 0 5px 5px 0;
	border-left: none;
}
</style>
</head>
<body>
<div class="jangcontainer">
	<div class="jangcontainerWrap">
    	<h2>장바구니</h2>
    	<table width="800" border="1" class="renttable">
    		<tr height="40">
    			<td align="center" width="50">선택</td>
    			<td align="center" width="50">상품번호</td>
    			<td align="center" width="50">상품명</td>
    			<td align="center" width="50">상품수량</td>
    			<td align="center" width="50">상품가격</td>
    			<td align="center" width="50">총금액</td>
    		</tr>
    		<c:set var="index" value="0"/>
    		<c:forEach var="jdto" items="${jaList}">
    			<form action="RentDeleteJang.do" method="post">
    				<tr height="40">
    					<td align="center" width="50"><input type="checkbox" class="chk" name="chk" value="${jdto.no}"></td>
    					<td align="center" width="50">${jdto.no}</td>
    					<td align="center" width="50"><img alt="" src="img/${jdto.img}" width="60" height="60"></td>
    					<td align="center" width="50">
    						<div class="cntcontainer">
    							<input type="button" value="-" class="minus" onclick="fn_update(false,${index},this.form)">
    							<input type="text" name="cnt" value="${jdto.cnt}" class="spancnt">
    							<input type="button" value="+" class="plus" onclick="fn_update(true,${index},this.form)">
    							<input type="hidden" name="no" value="${jdto.no}" class="carno">
    						</div>
    					</td>
    					<td align="center" width="50"><fmt:formatNumber value="${jdto.price}" pattern="#,##0"/></td>
    					<td align="center" width="50"><fmt:formatNumber value="${jdto.price * jdto.cnt}" pattern="#,##0"/></td>
    				</tr>
    			</form>
    			<c:set var="index" value="${index=index+1}"/>
    		</c:forEach>
    		<tr height="40">
    			<td align="center" colspan="6">
    				<input type="button" value="선택삭제" class="bottombtn" onclick="fn_delete()">
    				<input type="button" value="목록보기" class="bottombtn" onclick="location.href='RentListPro.do'">
    				<input type="button" value="주문하기" class="bottombtn" onclick="OrderList()">
    			</td>
    		</tr>
    	</table>
	</div>
</div>
<script type="text/javascript">
    
    // 1. jsp의 EL 표현식은 javascript에 직접적으로 사용이 불가능하다.
    // 2. 단, jsp의 변수명은 javascript에 사용할 수 있다.
    
    let minus = document.querySelectorAll(".minus");
    let plus = document.querySelectorAll(".plus");
    let cnt = document.querySelectorAll(".spancnt");
    let chk_list = document.querySelectorAll(".chk"); // checkbox에 담겨진 no 값을 배열로 처리한 것
    let param = ""; // checkbox에 담겨진 no 값을 담을 변수
 	
    // 자바스크립트에서 EL로 받아온 값을 변수로 담는 방법
    let loginId = "<c:out value='${loginId}' />";
    
    
    function fn_delete(){
    	
    	for(let i=0;i<chk_list.length;i++){
    		
    		if(chk_list[i].checked){ // 장바구니에서 선택된 no값만 넘기는 코드
    			param = param + chk_list[i].value + " ";
    		}
    	}
    	
    	location.href = 'RentDeleteJang.do?chk=' + param;
    }
    
	function fn_update(isBool,i,f){
		if(isBool==false){
			// - 버튼
			if(parseInt(cnt[i].value)>1){
				cnt[i].value = parseInt(cnt[i].value)-1;
			}else{
				alert("수량은 1부터 9999까지 입력 가능합니다.");
			}
		}else{
			// + 버튼
			if(parseInt(cnt[i].value)<9999){
				cnt[i].value = parseInt(cnt[i].value)+1;
			}else{
				alert("수량은 1부터 9999까지 입력 가능합니다.");
			}
		}
		
		// +,-버튼을 눌렀을 때 cnt가 update되는 servlet으로 보내야 함
		// <form action="RentUpdate.do" method="">
		f.action = "RentUpdate.do";
		f.submit();
	}
	
	function OrderList(){
		if(loginId == ""){
			alert("로그인 후 실행하세요.");
			location.href = "RentCarMain.jsp?sectionChange=MemberLogin.jsp";
		}else{
			for(let i=0;i<chk_list.length;i++){
	    		if(chk_list[i].checked){ // 장바구니에서 선택된 no값만 넘기는 코드
	    			param = param + chk_list[i].value + " ";
	    		}
	    	}
	    	
	    	location.href = 'OrderListPro.do?chk=' + param +'&loginId=' + loginId;
		}
	}
	
</script>
</body>
</html>