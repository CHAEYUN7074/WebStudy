<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>


<!-- Send10.jsp → Send10_re.jsp → Receive10.jsp	-->
<!-- Send10.jsp → Send10_for.jsp → Receive10.jsp	-->

<!-- 사용자 최초 요청 페이지 -->
<!-- http://localhost:8090/WebApp07/Send10.jsp -->


<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>

<div>
	<form action="" mehod="post">
		이름 <input type="text" name="userName" class="txt">
		<br><br>
		
		<button type="submit" class="btn" style="width: 150px;"
		onclick="this.form.action='Send10_re.jsp'">리다이렉트</button>
		<!-- this.form.action : 버튼 객체의 포함된 폼의 액션 속성  -->
		
		<button type="submit" class="btn" style="width: 150px;"
		onclick="this.form.action='Send10_for.jsp'">포워드</button>
	</form>
</div>


</body>
</html>