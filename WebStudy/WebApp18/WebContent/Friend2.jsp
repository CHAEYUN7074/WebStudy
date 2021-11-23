<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myForm;
		
		if(!f.name.value)
		{
			alert("이름을 입력하세요")
			f.name.focus();
			return; // return을 해줘야 한번더 입력할 기회를 준다.
			            // 이거 없으면 결과창으로 null인 상태로 friend_ok 페이지 보여준다.
		}
		f.submit(); //값이 있으면 submit 해주고
	}
</script>

</head>

<body>
<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<div>
	<form action="Friend_ok2.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="age">
				</td>
			</tr>
			<tr>	
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" id="male" value="남자">남자
					</label> 
					<label>
						<input type="radio" name="gender" id="female" value="여자">여자
					</label>
				</td>
			</tr>
			<tr>	
				<th>이상형</th>
				<td>	
					<label>
						<input type="checkbox" name="idealType" id="idealType1" value="조정석">조정석
					</label>
					<label>
						<input type="checkbox" name="idealType" id="idealType2" value="공유">공유
					</label>
					<label>
						<input type="checkbox" name="idealType" id="idealType3" value="강다니엘">강다니엘
					</label>
					<label>
						<input type="checkbox" name="idealType" id="idealType4" value="아이유">아이유
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="font-size: 16px; width: 100%;">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>