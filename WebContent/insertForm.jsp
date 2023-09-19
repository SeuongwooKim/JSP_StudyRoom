<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent폴더 안에 insertForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td> <input type="text" name="userid" size="10"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="id" size="10" placeholder="특수문자 불가"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td> <input type="password" name="password" size="10"></td>
			</tr>
			<tr>
				<td>이메일</td>
				
				<td> <input type="text" name="email" size="10" placeholder="000@000.com"></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="등록"></td>
				<td colspan="2"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	
	</form>
	

</body>
</html>