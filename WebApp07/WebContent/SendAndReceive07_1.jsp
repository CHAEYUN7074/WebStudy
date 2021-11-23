<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년 월 일 받아오고
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 받은걸 최초페이지 요청시 표시해 줘야하니까
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지가 최초 요청이 아닐 시 받아온 값 넣어줘야 하니까
	if( sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 year select option 구성
	String yOptions ="";
	for(int year=(selectYear-10); year<=(selectYear+10);year++)
	{
		if(sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else if(sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	}
	
	// 확인한 날짜로 month select option 구성
	String mOptions="";
	for(int month=1; month<=12; month++)
	{
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</option>";
	}
	
	// 만년 달력그리기
	int[] months = {31, 28, 31, 30, 31,30,31,31,30,31,30,31};
	
	// 2월 윤년인날 정해주기
	if(selectYear%4==0 && selectYear%100!=0 ||  selectYear%400==0)
	{
		months[1]=29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 구성
	String[] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 입력받은 년도의 이전 년도 까지의 날 수 연산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 입력받은 월의 이전 월 까지의 날 수 추가 연산
	for(int i=0; i<selectMonth-1;i++)
		nalsu +=months[i];
	
	nalsu++;
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
				
	
	
	// 달력 그리기
	String calStr = "";
	calStr +="<table border=1>";
	calStr += "<tr>";
	for(int i=0; i<weekNames.length; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else
			calStr += "<th>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	// 빈칸 공백 td발생
	for(int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		
		//calStr += "<td>" + i + "</td>";
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
			
		
		// 일요일일 때마다 개행
		if(week%7==0)
		{
			calStr += "</tr><tr>"; 
		}
	}
	
	// 끝나고도 빈칸 공백 td 발생
	for(int i=0; i<week; i++,week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
		
	calStr += "</table>";
	
	
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color:blue;}
	td.sun {color:red;}
</style>
<script type="text/javascript">

	function formCalendar(obj)
	{
		obj.submit();
	}

</script>

</head>
<body>

<!--  
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월일 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재 년도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	   - 월 구성을 1월 부터 12월 까지로 구성한다.
	   
	   [ 2021 ▼ ] 년 [ 10 ▼ ] 월
	   
	   ---------------------------
	   ---------------------------
	   
	   - 연도 select 나 월 select 의 내용 변화 시
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요정 주소는
	     http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	     
	○ SendAndReceive07.jsp
	
-->




<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>


<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option>2021</option> -->
			<%=yOptions %>
		</select>년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<!-- <option>10</option> -->
			<%=mOptions %>
		</select>월
	</form>
</div>
<br>


<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>