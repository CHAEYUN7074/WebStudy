<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Send04.html 페이지로 부터 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String idStr = request.getParameter("id");
	String pwdStr = request.getParameter("pwd");
	String nameStr = request.getParameter("name");
	String telStr = request.getParameter("tel");
	String genderStr = request.getParameter("gender");
	String cityStr = request.getParameter("city");
	
	String[] majorArr = request.getParameterValues("userSubject");
	
	// radio 버튼 처리
	String gender ="";
	if(genderStr.equals("F"))
		gender = "여성";
	else if(genderStr.equals("M"))
		gender="남성";
		
	// select 옵션 처리
	String city = "";
	if(cityStr.equals("서울"))
		city = "서울";
	else if(cityStr.equals("대전"))
		city="대전";
	else if(cityStr.equals("대구"))
		city="대구";
	else if(cityStr.equals("광주"))
		city="광주";
	
	// checkbox 처리
	String major="";
	if(majorArr != null)
	{
		for(String item : majorArr)
		{
			major += "[" + item + "]";
		}
	}
	
	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB 에 입력하는
	//    처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>회원가입 데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	<h3><%=idStr %></h3>
	<h3><%=pwdStr %></h3>
	<h3><%=nameStr %></h3>
	<h3><%=telStr %></h3>
	<h3><%=gender %></h3>
	<h3><%=city %></h3>
	<h3><%=major %></h3>
	
</div>

</body>
</html>