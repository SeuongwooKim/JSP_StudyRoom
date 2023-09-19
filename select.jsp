<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userid");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>select.jsp</title>
</head>
<body>
	
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로딩 성공!");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbUser = "admin";
		String dbPass = "1234";
		System.out.println("DB접속 성공");
		
		// select * from membership where userid = 'sdfsdf';
		String query = "select * from membership where userid = " + userId;
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
	%>		
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><%=userId %> </td>
				</tr>
				<tr>
					<td>암호</td>
					<td><%=rs.getString("id") %> </td> 
				</tr>
				<tr>
					<td>이름</td>
					<td><%=rs.getString("password") %> </td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=rs.getString("email") %> </td>
				</tr>
			</table>
			<form action="../index.jsp">
				<input type = "submit" value = "처음으로 돌아가기">
			</form>
		<%
		} else{
		%>
			<%= userId %>에 해당하는 정보가 존재하지 않습니다.
			<form action="selectForm.jsp">
				<input type = "submit" value = "다시 입력하기">
			</form>	
	<%
		}
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
	// finally는 catch가 있든 없든 실행된다. 
      	// 6. 사용한 Statement 종료

      	if(stmt != null) try{
      		stmt.close();
      	} catch(SQLException ex){
         	ex.printStackTrace();
      	}
      
      	// 7. 커넥션 종료
      	if(conn != null) try{
         	conn.close();
      	} catch(SQLException ex){
         	ex.printStackTrace();
      	}
   	}
	%>
	
</body>
</html>






