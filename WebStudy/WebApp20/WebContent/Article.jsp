<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(목록 페이지, List.jsp)로 부터 수신한 데이터
	String pageNum = request.getParameter("pageNum"); 		 //-- 페이지 번호
	int num = Integer.parseInt(request.getParameter("num")); //-- 게시물 번호
	
	// 검색 관련 기능 추가 ---------------------------------
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if (searchKey != null)
	    searchValue = URLDecoder.decode(searchValue, "UTF-8");
	else
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	// --------------------------------- 검색 관련 기능 추가
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	if(dto==null)
		response.sendRedirect("List.jsp");
		
	// 게시물 본문의 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
	// 검색 관련 기능 추가 --------------------------------------
	String param = "";
	
	// 검색 데이터가 있으면...
	if(searchValue != null && !searchValue.equals(""))
	{
		param = "&searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
			
	// -------------------------------------- 검색 관련 기능 추가
	
	DBConn.close();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css"> 
<link rel="stylesheet" href="<%=cp %>/css/article.css"> 

</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>

	<div id="bbsArticle">
	
		<div id="bbsArticle_header">
			<!-- 게시물 제목 -->		
			<%=dto.getSubject() %>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<!-- <dd>1</dd> -->
				<dd><%=lineSu %></dd>
			</dl>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<!-- <dd>2019-05-22</dd> -->
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<!-- <dd>101</dd> -->
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
						<!-- 어쩌구 저쩌구 게시물 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="bbsArticle_bottomLine">
		<!-- 	이전글 :  -->
		<%
		if(beforeNum != -1)
		{
		%>
			<a href="<%=cp %>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum %>">
			 이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject()%>
			</a>
		<%
		}
		else 
		{
		%>	
		이전글 : 없음
		<%}%>
		</div>
		
		<div class="bbsArticle_noLine">
		<!-- 	다음글 :  -->
		<%
		if(nextNum != -1)
		{
		%>
			<a href="<%=cp %>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum %>">
			 다음글 : (<%=nextNum %>) <%=dtoNext.getSubject()%>
			</a>
		<%
		}
		else 
		{
		%>	
		다음글 : 없음
		<%}%>
			
		</div>
		
	</div><!-- close bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		<!-- From : 211.238.142.154 -->
		From : <%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2" onclick="javascript:location.href='<%=cp%>/Delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		</div>
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2" onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum%><%=param %>'">
		</div>
		
	</div>
</div><!-- close bbs -->


</body>
</html>