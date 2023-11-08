<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>삼각형 별 모양 출력</h2>
<hr>
<%!
	public String star(){
		String star = "";
		for(int i=0;i<5;i++){
			for(int j=0;j<5-i;j++){
				star += "&nbsp";
			}
			for(int j=0;j<=i;j++){
				star += "*";
			}
			star += "<br>";
		}
		return star;
	}
%>

<%= star()%>
</body>
</html>