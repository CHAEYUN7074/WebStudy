<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로부터 데이터(userName, userTel) 수신
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	// 수정
	//String userName = request.getParameter("userName");
	//String userTel = request.getParameter("userTel");
	
	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h3>(TestSession03.jps)</h3>
	<h4>이름: <%=userName %></h4>
	<h4>전화번호: <%=userTel %></h4>
	<h4>아이디: <%=userId %></h4>
	<h4>패스워드: <%=userPwd %></h4>
</div>

</body>
</html>