<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();
	
	// 넘어온 페이지 번호 확인
	String pageNum = request.getParameter("pageNum");
	int current_page = 1;	//-- 현재 표시되어야 하는 페이지
	
	if(pageNum != null)
		current_page = Integer.parseInt(pageNum);
	
	// 검색 키와 검색 값 수신
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if (searchKey != null)	//-- 검색 기능을 통해 페이지가 요청되었을 경우
	{
		// 넘어온 값이 GET 방식이라면
		// → GET 은 한글 문자열을 인코딩 해서 보내기 때문에
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue, "UTF-8");		
		}
		
	}
	else	//-- 기본적인 페이지 요청이 이루어졌을 경우
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	
	// 전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);
	
	// 전체 페이지를 기준으로 총 페이지 수 계산
	int numPerPage = 10;	//-- 한 페이지에 표시할 수
	int total_page = myUtil.getPageCount(numPerPage, dataCount);
	
	// 전체 페이지 수보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로 처리
	// → 한 마디로, 데이터를 삭제해서 페이지가 줄었을 경우
	if (current_page > total_page)
		current_page = total_page;
	
	// 데이터베이스에서 가져올 시작과 끝 위치
	int start = (current_page-1) * numPerPage + 1;
	int end = current_page * numPerPage;
	
	// 실제 리스트 가져오기
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
	
	// 페이징 처리
	
	String param = "";
	
	// 검색값이 존재한다면
	if (!searchValue.equals(""))
	{
		param += "?searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
	
	String listUrl = "List.jsp" + param;
	String pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);
	
	// 글 내용 보기 주소
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
	{
		articleUrl = articleUrl + "?pageNum=" + current_page;
	}
	else
	{
		articleUrl = articleUrl + param + "&pageNum=" + current_page;
	}
	
	DBConn.close();
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css">
<link rel="stylesheet" href="<%=cp %>/css/list.css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.searchForm;
		
		// 검색 키워드에 대한 유효성 검사 코드 활용 가능~!!!
		
		f.action = "<%=cp%>/List.jsp";
		f.submit();
	}
</script>

</head>
<body>


<div id="bbsList">

	<div id="bbsList_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<div id="bbsList_header">
		
		<div id="leftHeader">
			<form action ="" name="searchForm" method="post">
				<select name="searchKey" class="selectField">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchValue" class="textField">
				<input type="button" value="검색" class="btn2" onclick="sendIt()">
 			</form>
		</div>
		
		<div id="rightHeader">
			<input type="button" value="글올리기" class="btn2" onclick="javascript:location.href='<%=cp %>/Created.jsp'">
		</div>
	</div><!-- close bbsList_header  -->
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div><!-- close title -->
		
		<div id="lists">
		 <!-- 
			<dl>
				<dd class="num">1</dd>
				<dd class="subject">안녕하세요</dd>
				<dd class="name">유진석</dd>
				<dd class="created">2019-05-21</dd>
				<dd class="hitCount">0</dd>
			</dl> 
		 -->
		 
		 <%
		 for(BoardDTO dto : lists)
		 {
		 %>
		 <dl>
		 	<dd class="num"><%=dto.getNum() %></dd>
			<dd class="subject">
				<a href="<%=articleUrl%>&num=<%=dto.getNum()%>">
					<%=dto.getSubject() %>
				</a>
			</dd>
			<dd class="name"><%=dto.getName() %></dd>
			<dd class="created"><%=dto.getCreated() %></dd>
			<dd class="hitCount"><%=dto.getHitCount() %></dd>
		 </dl>
		 <%
		 }
		 %>
		 
	    </div><!-- close lists -->
		
		<div id="footer">
			<!-- <p>1 Preview 21 22 23 24 25 26 27 28 29 30 Next 90</p> -->
			<p>
			<%
			if(dataCount != 0)
			{
			%>
				<%=pageIndexList %>
			<%
			}
			else
			{
			%>
				 등록된 게시물이 존재하지 않습니다.
			<%
			}
			%>	
			</p>
		</div>
		
	</div>
	
</div>
</body>
</html>