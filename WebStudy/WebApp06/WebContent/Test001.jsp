<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true"%> 별도로 명시하지 않으면 이 값이 기본 값 --%>
<%-- <%@ page buffer="1kb" autoFlush="false"%> 일 경우 에러 발생 --%>
<%-- <%@ page buffer="10kb" autoFlush="false" %> 일 경우 정상 처리 (버퍼크기를 늘려서 한번에 그린 것) --%>
<%-- <%@ page buffer="1kb" autoFlush="true" %> 일 경우 정상 처리 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	500번대 에러는 → 서버쪽에러 <br>
	400번대 에러는 → 클라이언트쪽  에러
</div>

<div>
	<h2>반복문 구성</h2>
	
	<% 
	for(int i=1; i<=1000; i++)
	{
	%>1234<%	
	}
	%>
	
</div>

</body>
</html>