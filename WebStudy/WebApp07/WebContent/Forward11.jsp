<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(Send11.html)로부터 데이터(num1, num2, calResult) 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String calStr = request.getParameter("calResult");
	
	String result="";
	if(calStr.equals("1"))		// 더하기
		result = String.format("%d + %d = %d",num1,num2,(num1+num2));
	else if(calStr.equals("2"))	// 빼기
		result = String.format("%d - %d = %d",num1,num2,(num1-num2));
	else if(calStr.equals("3"))	// 곱하기
		result = String.format("%d * %d = %d",num1,num2,(num1*num2));
	else if(calStr.equals("4"))
		result = String.format("%d / %d = %.1f",num1, num2, (num1 / (double)num2));
	
	request.setAttribute("resultStr", result);		// resultStr 이름으로 result 값 넘기겠다.
	
%>

<%-- <%
	
	String num11Str = request.getParameter("num1");
	String num12Str = request.getParameter("num2");
	String opStr = request.getParameter("op");
	
	int num1,num2;
	num1=num2=0;
	String result ="";
	
	try
	{
		num1 = Integer.parseInt("num1Str");
		num2 = Integer.parseInt("num2Str");
		
		if(opStr.equals(1))
			result = String.valueOf(num1 + num2);
		else if(opStr.equals(2))
			result = String.valueOf(num1 - num2);
		else if(opStr.equals(3))
			result = String.valueOf(num1 * num2);
		else if(opStr.equals(4))
			result = String.format("%.1f",(num1 / (double)num2));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
</head>
<body>

<!-- 이 페이지는 클라이언트를 만날 일이 없음! -->
<jsp:forward page="Receive11.jsp"></jsp:forward>


</body>
</html>