<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로부터 데이터(userName, userTel) 수신
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// 추가~!!!
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
	
	//@ Session01 에서 전달한 내용은 02에서 사용 후 사라지므로, 03에 전달되지 못한다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		var f = document.forms[0];		//  이름을 정의해 주지 않는다면 다음과 같이 폼을 참조
		
		if(!f.userId.value)
		{	
			alert("아이디 입력~!!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{	
			alert("패스워드 입력~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}

</script>

</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jps)</h1>
	<hr />
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" class="txt" />
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<!-- <input type="text" name="userTel" class="txt" />  값 정확히 받아오자!!! -->	
					<input type="text" name="userPwd" class="txt" />			
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()"
					style="width: 400px; height: 40px; font-size: 17pt;"
					>다음 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>


</body>
</html>