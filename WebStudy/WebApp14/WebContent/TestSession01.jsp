<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.userName.value)
		{
			alert("이름 입력~!!!");
			f.userName.focus();
			return;
		}
		
		if(!f.userTel.value)
		{
			alert("전화번호 입력~!!!");
			f.userTel.focus();
			return;
		}
		
		f.submit();
		
	}
	
</script>
</head>
<body>
<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp 로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp 로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 전화번호를 함께 전송
	   
		TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
		
		01 →→→→→→ 02 →→→→→→→→→ 03
		이름, 전화		아이디, 패스워드	  이름, 전화, 아이디, 패스워드
		입력			입력				  출력
		
					- getParameter		- getAttribute
					
	※ 즉, 01 에서 02 로 넘겨받을 땐 getParameter
	   02 에서 03 으로 넘겨받을 땐 getParameter 와 getAttribute 로 세션 활용
	   01 에서 03 으로 넘겨줄 수 없기 때문에 세션(Session)에 저장
	   
	※ Session 외에 hidden 태그를 이용한 정보 전달 가능
-->	


<div>
	<h1>이름과 전화번호(TestSession01.jsp)</h1>
	<hr>
</div>

<div>
	<form action="TestSession02.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName" class="txt">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					style="width: 400px; height: 40px; font-size: 17pt;"
					>다름 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>




















