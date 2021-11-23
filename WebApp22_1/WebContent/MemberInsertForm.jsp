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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet"  type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<h2>회원 명단 출력</h2>
</div>

<div>
	<form action = "MemberInsert.jsp" method="post"> <!-- 요청해야하는 페이지 -->
	<!-- 이름 전화번호 주소 5명 분 -->
	<table class="table">
		<tr>
			<th>이름</th>
			<td>
			<c:set var="i"  value="1"></c:set> <!--  i변수 선언해서 1로 초기화 -->
			<c:forEach var="a" begin="1" end="5" step="1">
				<input type="text" name="name${i }"> <!--  input element 각각이 만들어지며(?) name1,2,3,4,5 -->
				<c:set var="i"  value="${i+1 }"></c:set> <!-- 반복문 도는 동안 i 값은 1씩 증가 -->
			</c:forEach>
			</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td>
			<c:set var="i" value="1"></c:set>
			<c:forEach var="a" begin="1" end="5" step="1">
				<input type="text" name="tel ${i }">
				<c:set var="i" value="${i+1 }"></c:set>
			</c:forEach>
			</td>
		</tr>	
		
		<tr>
			<th>주소</th>
			<td>
			<c:set var="i" value="1"></c:set>
			<c:forEach var="a" begin="1" end="5" step="1">
				<input type="text" name="addr${i }">
				<c:set var="i" value="${i+1 }"></c:set>
			</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<button type =  "submit"  class="btn"  style="width: 100%;"> 입력</button>
	</table>	
	</form>
</div>

</body>
</html>