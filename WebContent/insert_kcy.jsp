<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String userID = request.getParameter("USERID");
	String id = request.getParameter("ID");
	String password = request.getParameter("PASSWORD");
	String email = request.getParameter("EMAIL");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insert.jsp</title>
</head>
<body>
	
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		Statement stmt = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbUser = "admin";
			String dbPass = "1234";
			System.out.println("DB 접속 성공!");
			
			//insert into membership values ('10','suong22','1234','suong22@naver.com');
			String query = "insert into membership values ('"+userID+"','"+id+"','"+password+"','"+email+"')";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			stmt = conn.createStatement();
			
			int result = stmt.executeUpdate(query);
	%>
			<%= result %>건의 데이터가 추가 되었습니다.
	<%
		}catch (SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		}finally{			
			if(stmt != null) try{
				stmt.close();
			} catch(SQLException ex){
				ex.printStackTrace();
			}
			if(conn != null) try{
				conn.close();
			} catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	%>
	<form action="index.jsp">
				<input type = "submit" value = "처음으로 돌아가기">
			</form>
</body>
</html>