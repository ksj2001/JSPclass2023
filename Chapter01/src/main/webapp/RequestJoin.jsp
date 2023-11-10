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
	table{
		border-collapse: collapse;
	}
	.content{
		width: 300px;
		height: 35px;
	}
	input[type='submit'],input[type='reset']{
		width: 100px;
		height: 30px;
	}
</style>
</head>
<body>
	<div class="container">
		<h2>회원 가입</h2>
		<form action="RequestJoinProc.jsp" methods="post">
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350" align="center">
						<input type="text" name="id" class="content"
						placeholder="아이디를 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호</td>
					<td width="350" align="center">
						<input type="password" name="pw" class="content"
						placeholder="영문과 숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호확인</td>
					<td width="350" align="center">
						<input type="password" name="pwchk" class="content"
						placeholder="영문과 숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350" align="center">
						<input type="email" name="email" class="content"
						placeholder="@를 포함하여 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350" align="center">
						<input type="tel" name="tel" class="content"
						placeholder="000-0000-0000의 형식으로 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">당신의 관심 분야</td>
					<td width="350" align="center">
						<input type="checkbox" name="hobby" value="캠핑" id="camping">
						<label for="camping">캠핑</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="등산" id="mount">
						<label for="mount">등산</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="영화" id="movie">
						<label for="movie">영화</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="독서" id="book">
						<label for="book">독서</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">당신의 직업은</td>
					<td width="350" align="center">
						<select name="job">
							<option value="교사">교사
							<option value="변호사">변호사
							<option value="의사">의사
							<option value="기술사">기술사
						</select>
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">연령</td>
					<td width="350" align="center">
						<input type="radio" name="age" value="10대" id="teenage">
						<label for="teenage">10대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="20대" id="twenty">
						<label for="twenty">20대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="30대" id="thirty">
						<label for="thirty">30대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="40대" id="forty">
						<label for="forty">40대</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">하고싶은 말</td>
					<td width="350" align="center">
						<textarea rows="5" cols="40" name="info"></textarea>
					</td>
				</tr>
				<tr height="50">
					<td align="center" colspan="2">
						<input type="submit" value="회원가입">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>