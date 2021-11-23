<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 여기는 오로지 자바코드만 구성!!
	
	// 이전 페이지(Send12.html)로부터 받아온 데이터(num1, num2, calResult) 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String cal = request.getParameter("calResult");
	
	
	String result = "";
	if(cal.equals("1"))
		result = String.format("%d",(num1 + num2));
	else if(cal.equals("2"))
		result = String.format("%d",(num1 - num2));
	else if(cal.equals("3"))
		result = String.format("%d",(num1 * num2));
	else if(cal.equals("4"))
		result = String.format("%.1f",(num1 / (double)num2));
	
	// check~!!!
	// 결과 제이터 재전송~!!! → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//     : 지정된 URL(location)로 요청을 재전송한다.
	// 그냥 response.sendRedirect("Receive12.jsp) 이거만 보내면 아무것도 보내지는 것이 없다.
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&cal="+cal+"&result="+result);
	
	
	
%>
