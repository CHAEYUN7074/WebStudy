<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
 td ="text-align :  center;"
</style>
</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<h2>회원 명단 출력</h2>
</div>

<div>
<!-- 5명의 이름 전화번호 주소 출력 -->
	<table class="table">
		<tr>
			<th>이　　름</th>
			<th>전화번호</th>
			<th>주　　소</th>
		</tr>
		
		<c:forEach var="dto"  items="${lists }"> <!-- 리스트 수신해서 dto라는 이름으로 하나씩.. -->
			<tr>
				<td>${dto.name }</td> <!-- 이렇게 얻어낸 dto에서 name 속성.. -->
				<td>${dto.tel }</td>
				<td>${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>