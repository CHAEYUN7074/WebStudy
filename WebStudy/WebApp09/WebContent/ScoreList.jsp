<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str ="";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select 조회하는 것 )
	String sql = "SELECT SID, NAME, KOR, ENG, MAT , (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG" 
					+ " FROM TBL_SCORE ORDER BY SID";
	
	// 쿼리문 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// ResultSet 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr><th>번호</th>";
	str += "<th>이름</th>";
	str += "<th>국어점수</th>";
	str += "<th>영어점수</th>";
	str += "<th>수학점수</th>";
	str += "<th>총점</th>";
	str += "<th>평균</th></tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		/* 우측정렬 하려고 별도의 클래스 구성 */
		str += "<td class='txtNum'>" + rs.getString("KOR") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("ENG") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("MAT") + "</td>";
		str += "<td class='txtNum'>" + rs.getString("TOT") + "</td>";
		str += "<td class='txtNum'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>"; /* getDouble!! check~!!!! */
		str += "</tr>";
	}
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg {font-size:small; color: red; display: none;}	/* 밑에 none 써줘도 display 속성써야함~!!! check~!!! */
	.txtNum {text-align: right;}
</style>

<script type="text/javascript">
	
	//폼에 조건들
	function checkForm()
	{
		// 확인
		//alert("함수 호출 확인");
		
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("scoreKor");
		var uEng = document.getElementById("scoreEng");
		var uMat = document.getElementById("scoreMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var endMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		
		// 이름 필수 입력 사항
		if (uName.value == "")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}

		
		
		// 					--------------- 숫자 형태인지 아닌지
		if (uKor.value=="" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
		{
			//alert(korMsg.style.display);
			//korMsg.style.dispaly = "inline";	// 아~~~~~ ㅊ앚았다... ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
			korMsg.style.display = "inline";
			//alert(korMsg.style.display);
			uKor.focus();
			return false;
		}
		
		if (uEng.value=="" ||  isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		
		if (uMat.value=="" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
		
		return true;
		
	}
	
</script>
</head>
<body>

<!--  
	○ WebApp09
	  
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계상하여 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP 로 구성할 수 있도록 한다.
	     
	   데이터베이스 연결 및 데이터 처리
	   ---------------------------------------------------------------
	   성적 처리
	   
	   이름(*)	[ textbox ] → 이름 입력 확인	   
	   국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인	   
	   영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인	   
	   수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인	   
	   
	   < 성적 추가 > → button
	   
	   번호		이름	국어점수	영어점수	수학점수	총점	평균
	    1	   이다영      90		   80           70      xxx	     xx.x
	    2	   윤유동      80		   70           60      xxx	     xx.x
	    3	   최수지      70		   86           50      xxx	     xx.x

	○ WebApp09_scott.sql
	   ScoreList.jsp
	   ScoreInsert.jsp
	   con.util.DBConn.java
-->

<div>
	<h1>데이터베이스 연결 빛 데이터 처리</h1>
	<hr>
</div>

<div>
	<!-- 입력 폼 구성 -->
	<p>성적 입력</p>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return checkForm();">
		<!-- table로 했지만 가급적 <div>로 하자! -->
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="userName" id="userName">
					<span class="errMsg" id="nameMsg">이름을 입력하세요</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" class="txt" name="scoreKor" id="scoreKor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수 입력!!!</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" class="txt" name="scoreEng" id="scoreEng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수 입력!!!</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" class="txt" name="scoreMat" id="scoreMat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수 입력!!!</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<button type="submit" class="btn" id="btnAdd" value="성적 추가" 
					style="width: 50%; height: 50px;font-weight: bold;">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<!-- 리스트 구성 -->
	<p>성적 정보 리스트</p>
	<%=str %>
</div>

</body>
</html>





