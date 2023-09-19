<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String user = request.getParameter("userid");
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String em = request.getParameter("email");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent 안에 insert.jsp 소스 코딩</title>
</head>
<body>
<%
	//1-1. 드라이버 로딩
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로딩 성공!");
	
	Throwable occuredException = null;
	Connection conn = null;
	Statement stmt = null;
	
	try{
		//1-2. DB접속 로딩
		String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
		String jdbcID = "admin";
		String jdbcPW = "1234";
		System.out.println("DB 접속 성공!");
		
		//String user를 int값으로 변경
		int userid = Integer.parseInt(user);
		
		//2. 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,jdbcID,jdbcPW);
		conn.setAutoCommit(false);
		
		//3. 쿼리문 짜기
		//insert into membership values ('10','suong22','1234','suong22@naver.com');
		String query = "insert into membership values ('"+userid+"','"+ id +"','"+pw+"','"+em+"')";
		
		//4. Statement 생성
		stmt = conn.createStatement();
		
		//5. 쿼리문 실행
		int resultInsert = stmt.executeUpdate(query);
		conn.commit();
		
		//6. 결과 출력
%>
		회원가입이 정상적으로 완료되었습니다.		
<% 
	}
	catch(Throwable e){
		if(conn != null){
			try{
			//트랜잭션 처리 과정에서 정상처리 완료가 아닌 예외상황이 발생하면 롤백 처리를 합니다.
			conn.rollback();
		}catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		}
		}
			occuredException = e;
	}finally{
	      // 7. 사용한 Statement 종료
	      if(stmt != null) try{
	    	  stmt.close();
	      } catch(SQLException ex){
	         ex.printStackTrace();
	      }
	      
	      // 8. 커넥션 종료
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

			에러가 발생했습니다 다시 시도 바랍니다! <%=occuredException.getMessage() %>
<%
		}else{
%>
			트랜잭션 완료로 회원가입이 정상 가입 되었습니다.
<% 
		}
%>
<form action="index.jsp">
	<input type="submit" value="처음으로!">
</form>

</body>
</html>