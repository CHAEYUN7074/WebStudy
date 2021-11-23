<%@page import="com.test.MemberScoreDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	StringBuffer str  = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh' >이름</th>");
		str.append("<th>국어점수</th>");
		str.append("<th>영어점수</th>");
		str.append("<th>수학점수</th>");
		str.append("<th>총점</th>");
		str.append("<th>평균</th>");
		str.append("<th>석차</th>");
		str.append("<th>성적처리</th>");
		str.append("</tr>");

		for(MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() +"</td>");
			str.append("<td>" + score.getName() +"</td>");
			str.append("<td class='txtScore'>" + score.getKor() +"</td>");
			str.append("<td class='txtScore'>" + score.getEng() +"</td>");
			str.append("<td class='txtScore'>" + score.getMat() +"</td>");
			str.append("<td class='txtScore'>" + score.getTot() +"</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", score.getAvg()) +"</td>");
			str.append("<td class='txtScore'>" + score.getRank() +"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			// 이부분은 각자 비활성화 활성화되게 처리해야함!!
			/*
			str.append("<td>");
			
			str.append("<a href=''>");
			str.append("<button type='button' class='btn01'>입력</button>");
			str.append("</a>");
			str.append("<a href=''>");
			str.append("<button type='button' class='btn01'>삭제</button>");
			str.append("</a>");
			str.append("<a href=''>");
			str.append("<button type='button' class='btn01'>수정</button>");
			str.append("</a>");
			
			str.append("</td>");
			*/
			
			// 성적입력이 안된 애들은 입력 활성화
			if(score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("<td>");
				str.append("<a href='MemberScoreInsertForm.jsp?sid="+ score.getSid() +"'>");
				str.append("<button type='button' class='btn01'>입력</button>");
				str.append("</a>");
				
				str.append("<button type='button' class='btn02'>삭제</button>");
				str.append("<button type='button' class='btn02'>수정</button>");
				
				str.append("</td>");
			}
			else
			{
				str.append("<td>");
				
				str.append("<button type='button' class='btn02'>입력</button>");
				
				str.append("<a href='MemberScoreUpdateForm.jsp?sid="+ score.getSid() +"'>");
				str.append("<button type='button' class='btn01'>수정</button>");
				str.append("</a>");
				
				str.append("<a href='javascript:memberScoreDelete(" + score.getSid() + ", \"" + score.getName() + "\")'>");
				str.append("<button type='button' class='btn01'>삭제</button>");
				str.append("</a>");

				str.append("</td>");
			}
			
			
			str.append("</tr>");


		}
		str.append("</table>");
		
		
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">

	function memberScoreDelete(sid, name)
	{
		//alert("확");
		
		// ※ name 문자열 넘기는 과정에서 따옴표 구성 주의~!!!
		// 확인
		//alert("sid :" + sid + ", name:" + name);
		
		var res = confirm("번호:" + sid + ", 이름 :" + name + "\n이 회원의 성적 데이터를 삭제하시겠습니까?");
		
		if(res)
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
		
	}
</script>
</head>
<body>

<div>
	<h1>회원 <span style="color: blue;">성적</span> 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<div>
	<!-- 리스트 출력 -->
	<%=str.toString() %>
</div>


</body>
</html>