<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertForm.jsp</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="USERID" size="15"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="ID" size="15"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="PASSWORD" size="15"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="EMAIL" size="15"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>