<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>deleteForm.jsp</title>
</head>
<body>
	<form action="delete_jsj.jsp" method="post">
	
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="USERID" size="10"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="삭제"></td>
				<td colspan="2"><input type="submit" value="삭제 취소"></td>
			</tr>
		
		</table>
	</form>
</body>
</html>