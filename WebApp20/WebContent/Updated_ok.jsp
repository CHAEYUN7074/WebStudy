<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%
	// Update_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchKey != null)
		searchValue = URLEncoder.encode(searchValue, "UTF-8");
	else
	{
		searchKey = "subject";
		searchValue = "";
	} 
	
	dto.setNum(num);
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.updateData(dto);
	
	DBConn.close();
	
	response.sendRedirect("List.jsp?pageNum=" + pageNum + "&searchKey=" + searchKey + "&searchValue=" + searchValue);
%>