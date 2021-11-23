<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Redirect12.jsp)로부터 받은 데이터(num1, num2, cal, result) 수신
	// → 직접 Redirect12.jsp 로 부터 데이터를 넘겨받은 것이 아니라
	//    클라이언트가 새로운 요청을 하는 과정에서 넘긴 값을 수신하게 되는 개념
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String cal = request.getParameter("cal");
	String result = request.getParameter("result");
	
	// get방식에서는 연산자(특수문자)가 제대로 전달이 안됨!!
	if(cal.equals("1"))
		cal = "+";
	else if(cal.equals("2"))
		cal = "-";
	else if(cal.equals("3"))
		cal = "*";
	else if(cal.equals("4"))
		cal = "/";
	
	String strResult = String.format("%s %s %s = %s", num1, cal, num2, result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp </title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>결과 :  <%=strResult %></h2>
</div>

</body>
</html>