<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ob" class="com.test.FriendDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />

<%
/* ★★★★★★ */
	String str="";
/* new String()은 새로운 객체를 만드는 것으로 heap area에 저장이 되고, 
String str = ""; 처럼 리터럴을 이용한 변수 할당은,string constant pool영역에
저장되기 때문에 서로 잠조하고 있는 레퍼런스 주소가 다르다. */
	if(ob.getIdealType() !=null)
	{
		for(String temp : ob.getIdealType()) //ob.getIdealType() 배열의 값을타입이 string인 temp에 담으라는 것
			str +=temp+"    "; //결과값들 사이에 간격 "   "
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr>
</div>

<div>
	<h3>이름 : <%=ob.getName() %></h3>
	<h3>나이 : <%=ob.getAge() %></h3>
	<h3>성별 : <%=ob.getGender() %></h3>
	<h3>이상형 : <%=str %></h3>
</div>


</body>
</html>

