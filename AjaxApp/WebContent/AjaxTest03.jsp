<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#result
	{
		display : inline-block;
		width: 250px;
		color: #F33;
	}
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
	function check()
	{
		// 데이터 수집 
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" + id;
		
		// Ajax객체 = XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정 (『open("메소드방식", "URL", 동기/비동기)』)
		//동기면 false
		ajax.open("GET", url, true);
		//--일을 수행하라고 명령
		//readystate값이 변경(change)될때마다 
		ajax.onreadystatechange = function name()
		{
			if (ajax.readyState==4 && ajax.status==200 ) //값이 4일때 응답받기 & 올바른 응답일때
			{
					// 업무처리(외부로 추출)
					callBack(); //외부로 추출할 함수의 이름이 콜백
			}
		}
		
		ajax.send(""); //아무것도 안 넘겨준다고해도 "" 빈 문자는 입력해줘야지
	}
	
	//업무처리를 밖으로 뺌(외부로 추출된 업무 처리 내용 구성)
	// 아이디 중복검사의 결과를 통보받아 사용자에 메시지 출력
	// → span → result	
	function callBack() //위에 적은 함수 이름
	{
		
		var data = ajax.responseText; //단일 데이터 받을 때
		//responseXML - 다량 데이터 받을때
		
		data = parseInt(data);
		
		if (data==0)
			document.getElementById("result").innerText = "사용가능한 아이디입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
	}
	
</script>
</head>
<body>

<div>
	<h1>회원가입</h1>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>
	<p>- Test03OK.jsp</p>
	<p>- web.xml</p>
	<p>URL : test03.do</p>
	<p>자료구조 활용 → superman, batman, admin</p>
	<hr>
</div>


<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" >
			<input type="button" value="중복검사" class="control" onclick="check()">
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control" />
		</td>
	</tr>
</table>

</body>
</html>