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
   width: 120px;
   height: 50px;
}
</style>
</head>
<body>
   <form action="insertForm.jsp" method="post">
      <input style="width: 120px; height: 50px;" type="submit"
         value="데이터 추가" name="insert">
   </form>
   <form action="selectForm.jsp" method="post">
      <input type="submit" value="데이터 조회" name="select">
   </form>

   <form action="modifyForm.jsp" method="post">
      <input type="submit" value="데이터 수정" name="modify">
   </form>
   <form action="deleteForm.jsp" method="post">
      <input type="submit" value="데이터 삭제" name="delete">
   </form>


</body>
</html>