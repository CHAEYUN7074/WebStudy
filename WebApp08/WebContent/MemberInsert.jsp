<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 데이터 수신 (Test002.jsp 페이지로부터...)
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = String.format
	 ("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
			+ " VALUES(MEMBERSEQ.NEXTVAL,'%s', '%s')"
			, uName, uTel);
	
	// DB 액션 처리 → 작업 객체 필요
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result<1)
	{
		// 에러 페이지를 다시 요청해라... (result<1, 데이터 입력 안 됨)
		response.sendRedirect("Err002.jsp");
	}
	else
	{
		// Test002.jsp 페이지를 다시 요청해라...
		response.sendRedirect("Test002.jsp");
	}
	
		
%>
