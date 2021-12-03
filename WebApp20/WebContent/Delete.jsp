<%@page import="java.net.URLEncoder"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String numStr = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(numStr);
	// Article 에서 param 으로 넘겼으나, 받을때는 searchKey / searachValue 로 받아야 한다.
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	String encodeValue = URLEncoder.encode(searchValue, "UTF-8");
	
	// System.out.println(encodeValue);
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.deleteData(num);
	
	DBConn.close();
	
	String str = "List.jsp" + "?pageNum=" + pageNum + "&searchKey=" + searchKey + "&searchValue=" + encodeValue;
	response.sendRedirect(str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete.jsp</title>
</head>
<body>


</body>
</html>