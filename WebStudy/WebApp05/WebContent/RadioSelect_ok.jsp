<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로(RadioSelect.jsp)부터 전송된 데이터 수신
	
	request.setCharacterEncoding("UTF-8");				// check~!!!
	
	
	String nameStr = request.getParameter("name");		//-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender");	//-- 라디오버튼... 단일값 수신
	String majorStr = request.getParameter("major");	//-- 선택상자... 단일값 수신
	String[] hobbyArr = request.getParameterValues("habby");	
	//-- 다중 선택이 가능한 선택상자일 경우... 『getParameterValues()』로 수신 → 배열 반환
	
	String gender = "";		
	if(genderStr.equals("M"))
		gender = "남자";
	else if(genderStr.equals("F"))
		gender = "여자";
	else
		gender = "확인불가";
	
	String hobby="";
	if(hobbyArr != null)
	{
		for(String item : hobbyArr)
		{
			hobby += "[" + item + "]";
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습03</h1>
	<hr>
	<p>RadioSelect.jsp ○ → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신 결과 확인</h2>
	
	<div>
		<!-- <p>이름 : 이윤서</p> -->
		<p>이름 : <%=nameStr %></p>
		
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%=genderStr %>(<%=gender %>)</p>
		
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=majorStr %></p>
		
		<!-- <p>취미 : [영화감상] [음악감상]</p> -->
		<p>취미 :<%=hobby %></p>
	</div>
</div>




</body>
</html>