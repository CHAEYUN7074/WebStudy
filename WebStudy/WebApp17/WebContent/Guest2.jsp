<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest2.jsp</title>
<link rel="stylesheet " type="text/css"  href="css/,main.css">
<script type="text/javascript">
	
function sendIt()
	{
		var f = document.myFrom;
		
		f.submit();
	} 

</script>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<form action="Guset_ok.jsp"  method="post" name="myForm">
		<table class="table"  >
			<tr>
			<th>이름</th>
			<td>
				<input type="text" name="userName">
			</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject">
				</td>
			</tr>
			<tr>	
				<th>내용</th>
				<td>
					<textarea rows="5"  cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">	
					<button type="button"  onclick="sendIt()" style="width: 70%;">작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>