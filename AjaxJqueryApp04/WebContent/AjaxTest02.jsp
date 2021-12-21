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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

//※Xml DOM을 기반으로 해서 요소들에 접근하고 데이터 바인딩하는 실습


//xml을 바인딩하는 형태로 처리
$(function()
{
	$("#sendBtn").click(function()
	{
		//alert("확인");
		
		var params = "name=" + $.trim($("name").val()) 
					+ "&content=" +$.tirm("#contnet").val());
		//여러개의 속성 값을 이름과 값으로 매칭시켜서 구성하는걸 JSON 형식이라고 한다.
		$.ajax(
		{
			type : "POST"
			, url : "AjaxTest02_ok.jsp"
			, data : params
			//여기서 넘겨주는 속성은 넣을 수도 있고 뺄 수도 있고..꼭 다 사용해야하는거 아님
			//, async : false //default 값이 기본적으로 비동기인데, 이렇게 false로 하면 동기방식으로 쓰겠다는거
			, dataType : "xml" //기본적으로는 텍스트이지만 이 jsp에서는 xml로 쓰기로 했으니..
			//질문) xml로 넘겨준 데이터를 어떻게 바인딩 해야할까
			, success : function(args)//args라는 이름으로 xml 매개변수를 넘겨받는다. //ok 페이지에서 정의한 xml에 따라 넘겨받는다
			{
				var out ="";
			 	out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>"; //$(args) --제이쿼리 선택자 --제이쿼리 선택자에서 지정한 args는 xml document 객체(ok페이지 하단)이다
 					                                                        //tatal_datacount에서 text 즉 5를 가져와라
 					                                                        
 					                                                        
 				$(args).find("comment").each(function()
 				{
 					var item = $(this);
 					var num = item.attr("num"); //문자열 형태니가 ""로 감싸기
 					var name = item.find("name").text();
 					var content = item.find("content").text();
 				
 					out += "<br>===================";
 					out += "<br>번호 : " + num;
 					out += "<br>이름 : " + name;
 					out += "<br>내용 : " + content;
 					out += "<br>===================";
 				
 				});
			 	
			 	$("#resulDiv").html(out);
			 	
			 	$("#name").val(""); //name 비우고
			 	$("#content").val(""); //content 비우고
			 	$("#name").focus("");
			}
			, beforSend : //success다음엔 beforSend 하기
			, error : function(e)
			{
				alert(e.responseText);
			}
		});
	});	
});

function showRequest()
{
 if(!$.trim($("#name").val()))
 {
	 alert("이름을 입력해야합니다");
	 $("#name").focus();
	 return false;
 }
 if(!$.trim($("#content").val()))
 {
	 alert("내용을 입력해야합니다");
	 $("#content").focus();
	 return false;	 
 }
 return true;
}


</script>
</head>
<body>
<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<p>xml 기반의 컨트롤</p>
	<hr/>
	
</div>

<div>
	이름 : <input type="text" id="name" class="txt"><br><br>
	내용 
	<textarea row="3" cols="50" id="content"></textarea>
	<br><br>
	<input type="button" value="등록하기" id="sendBtn"/>
	</div>
	<br><br>
	
	<div id="resultDiv"> </div>

</body>
</html>