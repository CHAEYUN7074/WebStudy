<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
String pageNum = request.getParameter("pageNum"); //넘어온 페이지 번호 확인
int currentPage = 1; //현재 표시되어야 하는 페이지로 설정(초기화)

if(pageNum !=null)
	currentPage = Integer.parseInt(pageNum);

//검색 기능 추가
	String searchKey = request.getParameter("searchKey"); // 검색 키 수신
	String searchValue = request.getParameter("searchValue"); // 검색 값 수신
	
	if(searchKey !=null) // 검색창에 입력되었을때
	{
		//넘어 온 값이 get방식이면, get은 한글 문자열을 인코딩 해서 보내기 때문에 디코딩 처리 해야한다.
		if(request.getMethod().equalsIgnoreCase("GET")) //==GET 방식이라면 이라는 뜻
		{
			//디코딩 처리
			URLDecoder.decode(searchValue, "UTF-8");
		}
	}	
		else //검색페이지가 아닌 기본 페이지 요청이 이루어진 경우
		{
			searchKey = "subject";
			searchValue = "";
		}
		//---------------------------------------------------------------
		   Connection conn = DBConn.getConnection();
		   BoardDAO dao = new BoardDAO(conn);
		   MyUtil myUtil = new MyUtil();
		//---------------------------------------------------------------
		   // 전체 데이터 개수 구하기
		   // 검색 기능 추가
		   //int dataCount = dao.getDataCount();
		   int dataCount = dao.getDataCount(searchKey, searchValue);

		   
		   // 전체 페이지를 기준으로 총 페이지 수 계산
		   int numPerPage = 10;         //-- 한 페이지에 표시할 데이터 개수
		   // 한 게시판에 게시물 10개 나오게 한거
		   
		   int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		   
		   // 현재 11페이지 보고 있어서 특정 페이지 요청하면
		   // 누군가가 삭제해서 페이지가 없어졌을 수가 있음
		   // 전체 페이지 수 보다 표시할 페이지가 큰 경우
		   // 표시할 페이지를 전체 페이지로 처리
		   // → 한 마디로, 데이터를 삭제해서 페이지가 줄었을 경우
		   if (currentPage > totalPage)
		      currentPage = totalPage;
		   
		   // 데이터베이스에서 가져올 시작과 끝 위치
		   int start = (currentPage-1) * numPerPage + 1;
		   int end = currentPage * numPerPage;
		      
		   // 실제 리스트 가져오기
		   // List<BoardDTO> lists = dao.getLists(start, end);
		   List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
		   
		   // 검색기능 추가
		   // 페이징 처리
		   String param = "";
		   
			// 검색 기능 추가 → param 구성
			if (!searchValue.equals(""))	// 검색값이 존재한다면
			{
				param += "?searchKey=" + searchKey;
				param += "&searchValue=" + searchValue;
			}
		   
		   String listUrl = "List.jsp" + param;   //-- 상대경로 접근 방식(내 위치를 기준으로 경로 설정)
		   String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

		   // 글 내용 보기 주소
		   String articleUrl = cp + "/Article.jsp";   //-- 절대경로 접근 방식(내가 어디에 있든 상관 없이 경로 지정)
		   
		   if(param.equals(""))
		   {
		      articleUrl = articleUrl + "?pageNum=" + currentPage;
		   }
		   else
		   {
		      articleUrl = articleUrl + param + "&pageNum=" + currentPage;
		   }
		   
		   DBConn.close();
//------------------------------------------------------------------------------------------------------upper part 다시 해야해
		   

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/list.css">

<script type="text/javascript">
	
</script>
</head>
<body>

	<div id="bbsList">
		<div id="bbsList_title">게시판</div>

	</div>
	<div id="bbsList_header">
		<div id="leftHeader">
			<form action="" name="searchForm" method="post">   <!-- 지금 이 페이지에 보내기 -->
				<select name="searchKey" class="selectField">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select> 
				
				<input type="text" name="searchValue" class="textField"> 
				<input type="button" value="검색" class="btn2" onclick="sendIt()"> <!-- 버튼 클릭하면 sendIt 함수 실행-->
			</form>
		</div>
		<!-- #leftHeader -->
		<div id="rightHeader">
         <input type="button" value="글올리기" class="btn2" onclick="javascript:location.href='<%=cp%>/Created.jsp'">     <!-- ☆☆☆☆☆☆ -->  
        </div><!-- #bbsList_header -->
     
     <div id="bbsList_list">
      <div id="title">
         <dl>
            <dt class="num">번호</dt>
            <dt class="subject">제목</dt>
            <dt class="name">작성자</dt>
            <dt class="created">작성일</dt>
            <dt class="hitCount">조회수</dt>
         </dl>
      </div><!-- #title -->
<!-- -------------------------------------------------------------------------------------------------------------------  -->     
      <div id="lists">
         <!-- <dl>
            	<dd class="num">1</dd>
         	  </dl> 이렇게 구성해도 된다.-->    
         <%
         for (BoardDTO dto : lists)
         {
         %>
         <dl>
            <dd class="num"><%=dto.getNum() %></dd>
            <dd class="subject">
               <a href="<%=articleUrl %>&num=<%=dto.getNum()%>">
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
      </div><!-- #lists -->         
      <div id="footer">
         <!-- <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p> -->
         
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
      
   </div><!-- #bbsList_list -->
   
</div><!-- #bbsList -->

</body>
</html>