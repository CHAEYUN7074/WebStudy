<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(MemberSelect.jsp)로부터 데이터(sid) 수신
	
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();
	
	try
	{	
		// 데이터베이스 연결
		dao.connection();
		
		MemberDTO member = dao.searchMember(sid);
		name = member.getName();
		tel = member.getTel();
		
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
<title>MemberUpdateForm.jsp</title>

<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">
	function memberSubmit()
	{
		//alert("함수호출확인");
		
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		
		//form 을 직접 지정하여 submit액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		// form을 직접 지정하여 rest 액션 수행
		memberForm.reset();
		uName.focus();
	}
</script>

</head>
<body>

<!-- http://localhost:8090/WebApp10/MemberInsertForm.jsp -->
<div>
	<h1>회원 <span style="color: red;">명단</span> 관리 
		및 <span style="color: blue;">수정</span> 페이지</h1>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<br>


<div>
	<!-- 회원 정보 수정 폼 구성 -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName" 
					value="<%=name %>">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="uTel" name="uTel" 
					value="<%=tel %>">
				</td>
				<td>	
				</td>
			</tr>
		</table>
		
		<br>
		
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>


</body>
</html>