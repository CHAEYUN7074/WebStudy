<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(Send09.jsp)로 부터 데이터 수신(gugudan) 수신
	
	String danStr = request.getParameter("gugudan");
	int dan = 0;
	String result ="";
	
	try
	{
		dan = Integer.parseInt(danStr);
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", dan,i,(dan*i));
		} 
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	/* 
	int dan = Integer.parseInt(request.getParameter("gugudan"));

	String result ="";
	
	for(int i=1; i<=9; i++)
	{
		result += String.format("%d * %d = %d<br>", dan,i,(dan*i));
	} 
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09 결과</h1>
	<hr>
</div>

<div>
	<h2>수신된 데이터 : <%=danStr %></h2>
	 <%=result %>
</div>


</body>
</html>