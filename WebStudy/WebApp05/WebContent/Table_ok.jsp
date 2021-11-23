<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로(Table.jsp)부터 전송된 데이터 수신
	//request.setCharacterEncoding("utf-8");
	
	// 데이터 수신
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	// 수신된 데이터 형 변환
	int n1 = Integer.parseInt(s1);
	int n2 = Integer.parseInt(s2);
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n=0;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p>Table.jsp ○ → Table_ok.jsp ●</p>
</div>

<div>
	<table border="1">
		<%
		for(int i=0; i<n2; i++)
		{
		%>
			<tr>
			<% 
			for (int j=0; j<n1;j++)
			{
			%>
				<td style="width: 40px; text-align: right;"><%=++n %></td>
			<%
			}
			%>	
			</tr>
		<%	
		}
		%>
	</table>
</div>



</body>
</html>