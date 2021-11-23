<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(MemberScoreSelect.jsp)로부터 데이터(sid) 수신
	String sid = request.getParameter("sid");
	String name = "";
	
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid 를 통해 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	
	function memberScoreSubmit()
	{
		// 확인
		//alert("확인쓰");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(Number(kor.value)>100 || Number(kor.value)<0 || kor.value=="" || isNaN(kor.value))
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		if(Number(eng.value)>100 || Number(eng.value)<0 || eng.value=="" || isNaN(eng.value))
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		if(Number(mat.value)>100 || Number(mat.value)<0 || mat.value=="" || isNaN(mat.value))
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberScoreForm.submit();
		
	}// end memberScoreSubmit()
	
	
	
	function memberScoreReset()
	{
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var uKor = document.getElementById("kor");
		var uEng = document.getElementById("eng");
		var uMat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		memberScoreForm.reset();
		uKor.focus();
		
	}
	
</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: red;">성적</span> 관리 
		  및 <span style="color: red;">입력</span> 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
</div>


<div>
	<!-- 회원 성적 데이터 입력 폼 구성 -->
	<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<%=sid %>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<%=name %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore">
				</td>
				<td>
					<span class="errMsg" id="korMsg">0~100 사이의 국어점수를 입력</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore">
				</td>
				<td>
					<span class="errMsg" id="engMsg">0~100 사이의 영어점수를 입력</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore">
				</td>
				<td>
					<span class="errMsg" id="matMsg">0~100 사이의 수학점수를 입력</span>
				</td>
			</tr>
		</table>
		<br>
		
		<a href="javascript:memberScoreSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>
	
	
</div>

</body>
</html>