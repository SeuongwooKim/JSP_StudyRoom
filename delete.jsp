<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		// post방식은 utf-8 인코딩을 해야 한글이 안 깨진다
    	request.setCharacterEncoding("utf-8");
    					// getParmeter : name을 받아오는 아이
    	String userID = request.getParameter("USERID");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete.jsp</title>
</head>
<body>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		Statement stmt = null;
		
		Throwable occuredException = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
			String jdbcUser = "admin";
			String dbPass = "1234";
			System.out.println("DB 접속 성공");
			
			String query = "delete from membership where ID = '"+userID+"'";
			
			conn = DriverManager.getConnection(jdbcDriver, jdbcUser, dbPass);
			
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			
			int resultDelete = stmt.executeUpdate(query);
			
			if(request.getParameter("error") != null){
				throw new Exception("의도적 익셉션 발생!");
			}
	%>
	<%
		if(resultDelete == 0){
	%>
		<%= userID %> 는 존재하지 않는 아이디입니다!
	<%
		}else{
	 %>	
	  <%= resultDelete %> 건의 데이터가 삭제되었습니다 
			<div>
				
				<form action="index.jsp">
					<input type="submit" value="처음으로!">
				</form>
			</div>
	<%
		}
	%>
	<%
		} catch(Throwable e){
			if(conn != null){
				try{
					// 트랜젝션 처리과정에서 정창 처리 완료가 아닌
					// 예외 상황이 발생하면 롤백 처리를 합니다.
					conn.rollback();
				}catch(SQLException ex){
					out.println(ex.getMessage());
					ex.printStackTrace();
				}
			} // 앞서 롤백처리한 익셉션을 occuredException에 할당 처리합니다!
				occuredException = e;
	} finally{
		if(stmt != null) try{
			stmt.close();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		if(conn != null) try{
			conn.close();
		} catch(SQLException ex){
			ex.printStackTrace();
		}
		
	}
	
	%>

	<%
		if(occuredException != null){
	%>
		에러가 발생했습니다. ㅠㅅㅠ <%= occuredException.getMessage() %>
	<%
		}else {
			
	%>
		트랜잭션 데이터가 성공적으로 데이터베이스에 Insert 되었습니다!
	<%
		}
	%>
</body>
</html>