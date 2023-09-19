<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>membership 폴더 안에 modifyForm.jsp 소스 코딩</title>
</head>
<body>
	<form action="modify.jsp" method="post">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="userid" size="10"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" size="20" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" size="15" placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" size="30" placeholder="이메일을 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>