<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userNum = request.getParameter("userid");
	String userId = request.getParameter("id");
	String userPassword = request.getParameter("password");
	String userEmail = request.getParameter("email");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>membership 폴더 안에 modify.jsp 소스 코딩</title>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		Statement stmt = null;
		
		Throwable occuredException = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/membership?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbUser = "admin";
			String dbPass = "1234";
			System.out.println("DB 접속 성공!");
			
			// String query = "update member set password = '2468', name='이영자', email='ja@gmail.com' where memberid = 'jang'";
			String query = "update membership set id = '"+userId+"', password='"+userPassword+"', email='"+userEmail+"' where userid = '"+userNum+"'";
			
			// 2. 데이터베이스 커넥션 생성
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			// 3. Statement 생성
			stmt = conn.createStatement();
			
			// 오토커밋(자동커밋) 처리를 false로 설정함.
			conn.setAutoCommit(false);
			
			// 4. 쿼리문 실행
			int resultUpdate = stmt.executeUpdate(query);
			
			// 만약에 error 파라미터(매개변수)가 존재할 경우, 익셉션(예외 처리)을 발생시킵니다!
			if(request.getParameter("error") != null){
				throw new Exception("의도적 익셉션 발생!");
			}
						
			conn.commit(); // 세션 연결 상태에서 커밋 처리를 합니다!
	%>
			
			<%
			// 5. 쿼리문 실행 결과 출력
			if(resultUpdate == 0){ // 수정 데이터가 없을 때!
			%>
				<%= userId %>는 존재하지 않는 게시글입니다! <br><br>
			<%
			} else {
			%>
				<%= resultUpdate %>건의 게시글이 수정 되었습니다! <br><br>
				
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
					// 트랜잭션 처리 과정에서 정상 처리 완료가 아닌
					// 예외 상황이 발생하면 롤백 처리를 합니다.
					conn.rollback();
				} catch(SQLException ex){
					out.println(ex.getMessage());
					ex.printStackTrace();
				}
			} // 앞서 롤벡 처리한 익셉션을 occuredException에 할당 처리 합니다!
				occuredException = e;
		} finally{
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
	
		<%
			if(occuredException != null){
		%>
				에러가 발생했습니다. ㅠㅠ <%= occuredException.getMessage() %> <br><br>
		<%
			} else {
		%>
				트랜잭션 데이터가 성공적으로 데이터베이스에 Modify 되었습니다!
		<%
			}
		%>
</head>
<body>
	
</body>
</html>