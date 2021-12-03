<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Delete_ok.jsp
	// 제거할때 딜리트메소드에 넘겨줘야하는 매개변수가 인트니까
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	// result 결과값에 따른 분기 처리 가능~!!!
	DBConn.close();
	
	response.sendRedirect(cp + "List.jsp?pageNum=" + pageNum);
	
%>