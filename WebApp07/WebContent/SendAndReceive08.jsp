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
	
	//-----------------------------------------------------------------------------
	// ◀ 누르면 month-1
	int preYear = selectYear;
	int preMonth = selectMonth -1;
	
	// 연도 월에서 2021년 1월에서 오른편 클릭햇을 때 2020년 12월!!
	if(preMonth<1)
	{
		preYear = selectYear -1;
		preMonth = 12;
	}
	
	// ▶ 누르면 month+1
	int nextYear = selectYear;
	int nextMonth = selectMonth +1;
	
	// 연도 월에서 2021년 12월에서 왼편 클릭햇을 때 2022년 1월!
	if(nextMonth>12)
	{
		nextYear = selectYear +1;
		nextMonth = 1;
	}
	
	//-----------------------------------------------------------------------------
	
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
		calStr +="<table>";
		calStr += "<tr>";
		for(int i=0; i<weekNames.length; i++)
		{
			if(i==0)
				calStr += "<th style='color:red; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==6)
				calStr += "<th style='color:purple; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==1)
				calStr += "<th style='color:orange; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==2)
				calStr += "<th style='color:yellow; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==3)
				calStr += "<th style='color:#00FF00; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==4)
				calStr += "<th style='color:blue; background-color:#eeffee;'>" + weekNames[i] + "</th>";
			else if(i==5)
				calStr += "<th style='color:navy; background-color:#eeffee;'>" + weekNames[i] + "</th>";
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
			else if(week%7==2)
				calStr += "<td class='mon'>" + i + "</td>";
			else if(week%7==3)
				calStr += "<td class='tue'>" + i + "</td>";
			else if(week%7==4)
				calStr += "<td class='wed'>" + i + "</td>";
			else if (week%7==5)
				calStr += "<td class='thu'>" + i + "</td>";
			else if (week%7==6)
				calStr += "<td class='fri'>" + i + "</td>";
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
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td { text-align: right;}
	td.nowSat {background-color:#6495ED; font-weight: bold; color: blue;}
	td.nowSun {background-color:#6495ED; font-weight: bold; color: red;}
	td.now { background-color:#6495ED; font-weight: bold; color: white;}
	td.sat {color: purple;}
	td.sun {color: red;}
	td.mon {color: orange;}
	td.tue {color: yellow;}
	td.wed {color: #00FF00; }
	td.thu {color: blue; }
	td.fri {color: navy; }
</style>

<script type="text/javascript">
	
	function formChange(obj)
	{
		obj.submit();
	}
	
</script>

</head>
<body>

<!--  
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   
	   <a>태그 링크 사용			
	   ---								// 2021년 1월에서 오른편 클릭햇을 때 2020년 12월!!
	   ◀ 2021년 10월 ▶				// 2021년 12월에서 왼편 클릭햇을 때 2022년 1월!!
	   
	   ------------------------------
	   ------------------------------
	   
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	       
	   - 사용자 최초 요정 주소는
	     http://localhost:8090/WebApp07/SendAndReceive08.jsp 로 한다.
	     
	○ SendAndReceive08.jsp   

-->

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>



<div>
	<form action="" method="get">
		<input type="text" class="txt" name="year" id="year">년
		<input type="text" class="txt" name="month" id="month" onchange="formChange(this.form)">월
		<br>
		<a href="http://localhost:8090/WebApp07/SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth%>">◀</a>
		<%=selectYear %>년 <%=selectMonth %>월
		<!-- 
		<select id="year" name="year" onchange="formChange(this.form)">
		</select>년
		<select id="month" name="month" onchange="formChange(this.form)">
		</select>월
		 -->
		<a href="http://localhost:8090/WebApp07/SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth%>">▶</a>
		<br>
	</form>
</div>


<%-- 
<div>
   <!-- form 의 action 속성 값 생략 -> 요청 페이지 / 데이터의 수신처는 자기 자신 -->
   <form action="" method="post" name="frm">
      <a href="javascript:document.frm.submit();" id="prev" name="prev" class="button" onclick="prevMonth();">◀️</a>
      
      <input type="text" name="year" id="year" value='<%=selectYear %>' onchange="formCalendar(this.form)">년 
      <input style="width: 30px;" type="text" name="month" id="month" value='<%=selectMonth %>' onchange="formCalendar(this.form)">월 
      
      <a href="javascript:document.frm.submit();" id="next" name="next" class="button" onclick="nextMonth();">▶️</a> 
   </form>
</div>
--%>


<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>