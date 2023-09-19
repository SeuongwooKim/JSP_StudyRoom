<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insert 페이지</title>
</head>
<body>
	<form action="insert.jsp">
		<table>
			<tr>
				<td>UserID : </td>
				<td><input type="text" name="userId" size="40"></td>
			</tr>
			<tr>
				<td>ID : </td>
				<td><input type="text" name="ID"  size="40"></td>
			</tr>
			<tr>
				<td>password : </td>
				<td><input type="text" name="password" size="40"></td>
			</tr>
			<tr>
				<td>Email : </td>
				<td><input type="text" name="Email" size="40"></td>
			</tr>
			<tr>
				<td><input type="submit" value="추가"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>