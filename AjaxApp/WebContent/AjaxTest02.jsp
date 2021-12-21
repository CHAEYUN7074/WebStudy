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
<title>AjaxTest02</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css"> 
<style type = "text/css">
	.short
	{
		width:50px
		text-align : right;
	}

</style>

</head>
<body>

<div>
	<h1>AjaxTest02.jsp</h1>
</div>

<input type="text" id="num1">
+
<input type="text" id="num2">
<input type="button" value=" = ">
<input type="text" id="result">

<br><br>
<h2>같은 페이지에 있는 기타 다른 요소들</h2>

<input type="text">
<br>

<input type="checkbox" name="check" value="check1">체크1
<input type="checkbox" name="check" value="check2">체크2

<input type="radio" name="rdo" value="rdo1">라디오1
<input type="radio" name="rdo" value="rdo2">라디오2



</body>


</html>