<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Delete.jsp
	// 전페이지로부터 num과 pageNum만 받으면 된다.
	int num = Integer.parseInt(request.getParameter("num"));
	//DAO에 제거하는 메소드를 호출하면서 매개변수로 넘겨주는게 INT라서 INT NUM
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.deleteData(num);
	
	response.sendRedirect("List.jsp?pageNum="+pageNum);
%>