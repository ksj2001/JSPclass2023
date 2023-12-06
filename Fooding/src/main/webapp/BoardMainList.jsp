<%@page import="fooding.FoodingBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fooding.FoodingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/82fd850f0d.js" crossorigin="anonymous"></script>
<style type="text/css">
body{
	display: flex;
	justify-content: center;
}
.container{
	width: 100%;	
}
.tableBox{
	width: 1100px;
	margin: 100px auto;
}
h2{
	text-align: center;
}
table{
	border-collapse: collapse;
}
input[type="button"]{
	display: block;
	width: 100px;
	height: 35px;
	margin: 0 auto;
}
table tr td a:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	FoodingDAO fdao = new FoodingDAO();
	ArrayList<FoodingBoardBean> alist = fdao.getAllMainBoard();
%>
<div class="container">
	<div class="tableBox">
		<h2>1:1문의하기</h2>
		<table width="1100" border="1">
		<tr height="40">
			<td width="150" align="center">등록일</td>
			<td width="700" align="center">문의내용</td>
			<td width="100" align="center">작성자</td>
			<td width="150" align="center">문의상태</td>
		</tr>
		<%
			for(int i=0; i<alist.size(); i++){
				FoodingBoardBean bean = alist.get(i);
				
				if(bean.getSubject() != null){
		%>
					<tr height="40">
						<%-- <% // 오늘 올린 글은 시간으로 출력, 나머지는 날짜로 출력 %> --%>
						<td width="50" align="center"><%=bean.getReg_date() %></td>
						<td width="50">&nbsp;&nbsp;
						<i class="fa-solid fa-lock"></i>&nbsp;
						<a href="Main.jsp?changePage=FoodingBoardDetailLocked.jsp"><%=bean.getSubject()%></a></td>				
						<td width="50" align="center">
						<%=bean.getName().substring(0, 2)+"*"%> 
						</td>
						<td width="50" align="center">
						<%
							if(bean.getRe_step()==5){
						%>		<div class="status complete">답변완료</div>
						<%  }else if(bean.getRe_step()==1){%>
								<div class="status">문의접수</div>
						<%	}%>
						</td>
					</tr>
		<%	
				}
			}
		%>
		<tr height="40">
			<td colspan="5">
				<input type="button" onclick="writeBtn()" value="1:1문의하기">
			</td>
		</tr>
	</table>
	</div>

</div>
<script type="text/javascript">
	function writeBtn(){
		if("<%=id%>"==="admin123"){
			alert('관리자는 문의글을 작성할 수 없습니다.');
		}else{
			location.href = 'Main.jsp?changePage=BoardWriteForm.jsp';
		}
	}
</script>
</body>
</html>