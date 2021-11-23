<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Send03.html 페이지로 부터 데이터 수신
	
	// 한글 안받으니까 불필요
	//request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신(num1 과 num2 는 형변환) → Receive02 의 형변환하고 try catch 하는 방법이 훨씬 좋다! 
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");						// check~~!! 단일 값 받음!!
	
	String result="";
	if(op.equals("+"))
		result = String.valueOf(num1 + num2);
	else if(op.equals("-"))
		result = String.valueOf(num1 - num2);
	else if(op.equals("*"))
		result = String.valueOf(num1 * num2);
	else if(op.equals("/"))
	{
		//result = String.valueOf(num1 / num2);
		//result = String.valueOf(num1 / (double)num2);
		result = String.format("%.1f",(num1 / (double)num2));
		
	}
		 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	span{ color: red; font-weight: bold; font-size: 15pt; }
</style>

</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<h2>select 데이터 송수신 처리</h2>
	입력하신 <span><%=num1 %></span>과 <span><%=num2 %></span>의 연산 결과는 <span><%=result %></span> 입니다.
</div>


</body>
</html>






