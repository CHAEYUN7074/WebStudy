<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<!-- dto 변수와 Created 에 name 이름 같아야함!! -->
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Created_ok.jsp
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// insertData에서 추가해주려는데 num 이랑 ipaddress는 안넘겨주니까 따로 지정!
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set 하는 과정
	dto.setNum(maxNum+1);
	
	
	// IP Address 확인
	// → request.getRemoteAddr(); → 클라이언트(브라우저)의 IP Address 확인
	dto.setIpAddr(request.getRemoteAddr());
	
	
	// 다 설정해주고 나서 이제 insertData 실행	
	dao.insertData(dto);
	
	DBConn.close();
	
	// 안내
	response.sendRedirect("List.jsp");
	
	// http://211.238.142.150:8090/WebApp20/List.jsp 이 주소로 글쓰니까 ip주소 달라짐
	// localhost 면 0:0:0:0:0:0:0:1 나옴!
%>
