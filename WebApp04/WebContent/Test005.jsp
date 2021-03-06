<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ form 태그의 action 속성은 데이터 전송 및 페이지 요청을 해야하는
	        대상 페이지를 등록하는 기능을 수행한다.
	        (생략 시 데이터 전송 및 페이지 요청을 하게 되는 대상은 자기 자신)  
	     ※ form 태그의 method 속서에는 get 또는 post 를 등록(생략 시 get)
	        이는 데이터 전송 및 페이지 요청 방식에 해당한다.	-->
	<form action="/WebApp04/login" method="post">
	<!-- 서버에 넘기게 되는 데이터는 name="" 이다. -->
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<!-- jsp 에서는 name 은 필수! 이걸로 값 넘김 -->
					<input type="text" name="userId" size="10" maxlength="10" class="txt">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="userPwd" size="10" class="pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn control" style="width: 90px;">
					<input type="reset" value="다시입력" class="btn control" style="width: 90px;">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>