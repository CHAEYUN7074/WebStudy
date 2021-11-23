<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//이전 페이지(Forward11.jsp)로부터 데이터(resultStr) 수신
	//										 -----------
	//										setAttribute()
	
	String resultStr = (String)request.getAttribute("resultStr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1> 최종 결과 출력 페이지(Receive11.jsp)</h1>
	<hr>
</div>

<div>
	<h2>연산결과 : <%=resultStr %></h2>
</div>

</body>
</html>