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
	ArrayList<FoodingBoardBean> alist = fdao.getAllBoard();
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
						<% // 회원이 올린 글: 관리자로 로그인했을때 or 로그인한 회원 본인이 쓴 글일 때 공개글로 설정
						  if(bean.getRe_step()!=2 && (id.equals("admin123") || id.equals(bean.getId_key()))){ %>
							<i class="fa-solid fa-lock-open"></i>&nbsp;
							<a href="Main.jsp?changePage=FoodingBoardDetail.jsp?id=<%=bean.getId()%>&id_key=<%=bean.getId_key()%>"><%=bean.getSubject()%></a></td>				
						<%}else if(bean.getRe_step()!=2){ // 위 조건에 만족하지 않으면 비공개글로 설정%>
							<i class="fa-solid fa-lock"></i>&nbsp;
							<a href="Main.jsp?changePage=FoodingBoardDetailLocked.jsp"><%=bean.getSubject()%></a></td>
						<%}else if(id.equals("admin123") || id.equals(bean.getId_key())){ // 관리자 답글: 관리자 혹은 답변을 받은 회원 본인만 확인 가능%>
							<a href="Main.jsp?changePage=FoodingBoardDetail.jsp?id=<%=bean.getId()%>&id_key=<%=bean.getId_key()%>">&nbsp;&nbsp;&nbsp;<%=bean.getSubject()%></a></td>	
						<%}else{ // 위 조건에 만족하지 않으면 확인 불가%>
							<a href="Main.jsp?changePage=FoodingBoardDetailLocked.jsp">&nbsp;&nbsp;&nbsp;<%=bean.getSubject()%></a></td>
						<%}%>
						<td width="50" align="center">
						<%-- <% // 이름의 세번째 글자부터 가리기(단, 관리자 제외)
						String name = "";
						for(int j=0;j<bean.getName().length();j++){
							if(j>1){
								name += "*";
							}else{
								name += bean.getName().charAt(j);
							}
						}
						
						%>
						<%=name %> --%>
						<%=bean.getName().substring(0, 2)+"*"%> 
						</td>
						<!-- 내 부모글에 댓글이 달리면 re_step이 2가 됨
							부모글은 re_step이 1
							댓글을 달고 나면 부모글에 re_step에 4를 더하여 5가 되게 한다
							re_step이 5가 되면 답변완료 -->
						<%-- <% // 답변이 달리면 답변완료, 아니면 문의접수
						if(bean.getRe_step())
						%>
						<td width="50" align="center"><div class="status">문의접수</div></td>
						<td width="50" align="center"><div class="status complete">답변완료</div></td> --%>
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