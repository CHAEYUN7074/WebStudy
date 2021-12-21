<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
   .txtNum
   {
      width: 100px;
      text-align: right;
   }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	/* $.get(url,date,callBack)
	★매개변수로 전달받은 URL을 사용하여 서버에 대한 GET 요청을 전송한다. */
   
	$("#sendButton").click(function())
	{
		var su1 = $("#su1").val(); //.val()은 form의 값을 가져오거나 값을 설정하는 메소드이다.
		var su2 = $("#su2").val();
		var oper = $("#oper").val();
		
		$.get("GetTest01_ok.jsp")
		,{
			su1: su1
			,su2: su2
			,oper:oper}
		,function(args) //args(argument(전달인자)--함수와 메소드의 입력 값(value))
		                //parameter(매개변수...함수와 메서드의 입력 변수 명)
		{
			$("#result").html(args)
			
		});
		//--data 구성 {이름 : 값, 이름 : 값, ....}
		//$.get("GetTest01_ok.jsp", {su1:su1}, function(args){$("result").html(args)})
		//$.get("요청 url", {이름:값}, function(넘겨받은 값){$("선택자").html(넘겨받은값)})
		
		}
	}
</script>
</head>
<body>

<div>
   <input type="text" id="su1" class="txt txtNum"/>
   
   <select id="oper">
      <option value="add">덧셈</option>
      <option value="sub">뺄셈</option>
      <option value="mul">곱셈</option>
      <option value="div">나눗셈</option>
   </select>
   
   <input type="text" id="su2" class="txt txtNum" />
   
   <input type="button" value=" = "  id="sendButton" class="btn"/>
   
</div>
<br>

<div id="result">

</div>
<br>

<div>
   <input type="radio" name="rdo"/>rd1
   <input type="radio" name="rdo"/>rd2
</div>
<br>

<div>
   <input type="text" />
</div>

</body>
</html>