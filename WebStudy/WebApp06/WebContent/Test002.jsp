<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
</head>
<body>

<div>
	<h1>include 디렉티브 실습</h1>
	buffer 나 include 디렉티브 등은 많이 활용하진 않지만 그래도 jsp 에 탑재되어있다는걸 알곤있자!
</div>


<%@ include file="Test003.jsp" %>

<br><br>

<div>
	<h2><%=str %></h2>
	<h2><%=name %></h2>
</div>

</body>
</html>