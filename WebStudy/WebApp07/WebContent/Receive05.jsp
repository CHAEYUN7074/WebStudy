<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(Send05.html)로부터 넘어온 데이터(dan) 수신 		
	// 최초 요청페이지에서는 수신된건 null!! 내가 아무것도 입력안했으니까!
	
	String danStr = request.getParameter("dan");
	int nDan=0;	
	String result = "";
	
	try
	{
		nDan = Integer.parseInt(danStr);
		
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", nDan, i, (nDan*i));
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 실습05</h1>
	<hr>
</div>


<div>
	
	<h2>구구단 출력</h2>
	<div>
		<%=result %>
	</div>
	
</div>


</body>
</html>