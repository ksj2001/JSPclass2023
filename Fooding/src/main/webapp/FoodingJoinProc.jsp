<%@page import="java.util.ArrayList"%>
<%@page import="fooding.FoodingBean"%>
<%@page import="fooding.FoodingDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- useBean을 이용해서 FoodingBean에 있는 자료를 가져오기 -->
<!-- 객체 생성: FoodingBean fbean = new FoodingBean(); -->
<jsp:useBean id="fbean" class="fooding.FoodingBean">
	<jsp:setProperty name="fbean" property="*"/>  
</jsp:useBean>

<!-- db연동 시작 -->
<%
    FoodingDAO foodingdao = new FoodingDAO();

    /* 데이터베이스에서 가져온 아이디 값 */
	String checkId = foodingdao.oneCheckId(fbean.getId());
	
	if(fbean.getName()==null){
%>
	<script type="text/javascript">
		alert("이름을 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getId()==null){
%>
	<script type="text/javascript">
		alert("아이디를 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(checkId.equals(fbean.getId())){
%>
	<script type="text/javascript">
		alert("이미 존재하는 아이디입니다.");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getPw()==null){
%>
	<script type="text/javascript">
		alert("비밀번호를 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getTel()==null){
%>
	<script type="text/javascript">
		alert("전화번호를 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getEmail()==null){
%>
	<script type="text/javascript">
		alert("이메일을 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getAddress()==null){
%>
	<script type="text/javascript">
		alert("주소를 입력하세요");
		history.go(-1);
	</script>
<%
	}
	else if(fbean.getPw()==fbean.getPwchk()){
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%
			}
	else{
%>
		<%-- <script type="text/javascript">
			// 아이디: 알파벳 대소문자 또는 숫자로 시작하고 6-12자리인지 검사
			const regexId = /^[A-za-z0-9]{6,12}/;
			const regexPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/;
			console.log(<%=fbean.getId()%>);
			console.log(<%=fbean.getPw()%>);
			if(!regexId.test('<%=fbean.getId()%>')){
				alert("아이디는 알파벳 또는 숫자를 포함하여야 하고 6~12자리 이내여야 합니다.");
				history.go(-1);
			}
			else if(!regexPw.test('<%=fbean.getPw()%>')){
				alert("비밀번호는 알파벳,숫자,특수기호(!@#$%^*+=-)를 포함하여야 하고 6~12자리 이내여야 합니다.");
				history.go(-1);
			}
		</script> --%>
<%
		foodingdao.insertFooding(fbean);
%>
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.");
		location.href="Main.jsp";
	</script>
<%
	}
%>
</body>
</html>