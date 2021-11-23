<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="font-size: 9pt;">

<div>
	<table style="width: 400px;" border="1">
		<tr>
			<td colspan="2">
				<!-- Top -->
				<jsp:include page="Top.jsp" flush="false"></jsp:include>
				
<!--- flush 속성은 포함될 페이지로 제어가 이동될 때 현재 포함하는 페이지가 지금까지 출력 버퍼에 저장한 결과를 처리하는 방법을 결정한다.
- flush 속성의 값을 'true' 로 지정하면 포함될 페이지로 제어가 이동될 때 현재 페이지가 지금까지 버퍼에 저장한 내용을 웹 브라우저에 출력하고 버퍼를 비운다.
- flush 속성을 일반적으로 'false' 로 지정하는 것이 좋다. 'true'로 지정하면 일단 출력 버퍼를 웹브라우저에 전송하게 되는데
이때 헤더 정보도 같이 전송된다. 헤더 정보가 일단 웹 브라우저에 전송이 되고 나면 헤더 정보를 추가해도 결과가 반영되지 않는다 -->

			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width: 100px;">
				<!-- Left -->
				<jsp:include page="Left.jsp" flush="false"></jsp:include>
			</td>
			<td>
				메인 화면
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- Bottom -->
				<!-- ★★★★jsp:include -->
				<jsp:include page="Bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</div>


</body>
</html>