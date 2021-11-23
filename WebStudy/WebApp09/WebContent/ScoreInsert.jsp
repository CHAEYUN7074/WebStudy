<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	//이전페이지(ScoreList.jsp)에서 받아온 데이터(userName, scoreKor, scoreEng, scoreMat) 수신 
	// 받아온 데이터 check~!!!  html name값!!
	String uName = request.getParameter("userName");
	String uKor = request.getParameter("scoreKor");	
	String uEng = request.getParameter("scoreEng");
	String uMat = request.getParameter("scoreMat");
	

	try
	{

		// 데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비(insert) → PreparedStatement
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)" 
						+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		// DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, uName);
		pstmt.setInt(2, Integer.parseInt(uKor));
		pstmt.setInt(3, Integer.parseInt(uEng));
		pstmt.setInt(4, Integer.parseInt(uMat));
		
		//int result = pstmt.executeUpdate();	// sql 매개변수 안쓴다!!!
		pstmt.executeUpdate();
		pstmt.close();		
				
			
	}
	catch(Exception e)
	{
		// 서버측 콘솔에서 확인
		System.out.println(e.toString());
	}
	finally
	{
		// 데이터베이스 연결 종료
		DBConn.close();
	}
	
	
	// 클라이언트가 다시 요청해야할 URL 건네주기(→ sendRedirect() 메소드 활용)
	response.sendRedirect("ScoreList.jsp");
%>
