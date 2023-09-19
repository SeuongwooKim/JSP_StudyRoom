<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
input {
	width: 140px;
	height: 50px;
}
</style>
</head>
<body>
	<form action="insertForm.jsp" method="post">
		<input type="submit"
			value="데이터 추가_김성우" name="insert">
	</form>
	<form action="insertForm_jyc.jsp" method="post">
		<input type="submit"
			value="데이터 추가_조윤채" name="insert">
	</form>
	<form action="insertForm_kcy.jsp" method="post">
		<input  type="submit"
			value="데이터 추가_김채연" name="insert">
	</form>
	<form action="selectForm_ksj.jsp" method="post">
		<input type="submit" value="데이터 조회_김수진" name="select">
	</form>

	<form action="modifyForm_ayj.jsp" method="post">
		<input type="submit" value="데이터 수정_어예진" name="modify">
	</form>
	<form action="deleteForm_jsj.jsp" method="post">
		<input type="submit" value="데이터 삭제_조수정" name="delete">
	</form>
</body>
</html>