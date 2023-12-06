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
	font-size: 22px;
	color: #222;
	line-height: 22px;
	margin-bottom: 30px;
}
table{
	border-top: 1px solid #999999;
	border-collapse: collapse;
}
table tr th{
	font-size: 15px;
	font-weight: 600;
	text-align: center;
	color: #222;
	border-bottom: 1px solid #dbdbdb;
	background-color: #fbfbfb;
}
table tr td{
	font-size: 15px;
	color: #555;
	border-bottom: 1px solid #e1e1e1;
}
table tr:last-child td{
	border-bottom: none;
}
table tr td a:hover{
	text-decoration: underline;
}
table tr td div.status{
	width: 65px;
	height: 27px;
	padding: 5px 10px;
	border: none;
	font-size: 12px;
	line-height: 27px;
	background-color: #e9e9e9;
}
table tr td div.status.complete{
	color: white;
	background-color: #00a7b3;
}
input[type="button"]{
	display: block;
	width: 170px;
	height: 50px;
	margin: 30px auto 20px;
	background-color: #00a7b3;
    border: none;
    font-size: 17px;
    color: white;
    line-height: 50px;
    cursor: pointer;
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
		<table width="1100" border="0">
		<tr height="52">
			<th width="150">등록일</th>
			<th width="700">문의내용</th>
			<th width="100">작성자</th>
			<th width="150">문의상태</th>
		</tr>
		<%
			for(int i=0; i<alist.size(); i++){
				FoodingBoardBean bean = alist.get(i);
				
				if(bean.getSubject() != null){
		%>
					<tr height="73">
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
		<tr height="100">
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