<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String id = request.getParameter("ID");
	String password = request.getParameter("password");
	String Email = request.getParameter("Email");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>데이터 추가하기</title>
</head>
<body>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이브 로딩 성공!");
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		Throwable occuredException = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbUser = "admin";
			String dbPass = "1234";
			System.out.println("DB 접속 성공!");
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			String query = "insert into membership values ('" + userId + "','" + id + "','" + password + "','" + Email + "')";
			
			st = conn.createStatement();
			conn.setAutoCommit(false);
			
			int resultInsert = st.executeUpdate(query);
			
			conn.commit();
			%>
			<%= resultInsert %>건의 데이터가 추가되었습니다!<br>
			
		<%
		} catch(Throwable e){
			if(conn != null){
				try{
					// 트랜잭션 처리 과정에서 정상 처리 완료가 아닌
					// 예외 상황이 발생하면 롤백 처리를 합니다.
					conn.rollback();
				} catch(SQLException ex){
					out.println(ex.getMessage());
					ex.printStackTrace();
				}
			} // 앞서 롤백 처리한 익셉션을 occuredException에 할당 처리 합니다!
				occuredException = e;
		} finally {
		// 6. 사용한 Statement 종료
		if (st != null)
			try {
				st.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		
		if (st != null)
			try {
				st.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

		// 7. 커넥션 종료
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		%>
		
		<%
		if(occuredException != null){
			%>
			에러가 발생했습니다.ㅠㅠ <%= occuredException.getMessage()%>
			<%
		} else{
			%>
			트랜잭션 데이터가 성공적으로 데이터베이스에 Insert 되었습니다!
			<%
		}
		%>
		<div>
		<form action="index.jsp">
			<input type="submit" value="처음으로">
		</form>
	</div>

</body>
</html>