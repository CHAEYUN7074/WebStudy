<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
   //공백이나 개행 방지 꼬리 물기
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
	
   //AjaxTest02_ok.jsp → xml 구성
   //1)넘어오는 데이터를 받아야지
   String name = request.getParameter("name");
   String content = request.getParameter("content");

   //2)xml 렌더링하기 (주의사항-정의 부분에서 공백이나 개행이 있으면 안된다.)
   //서블릿컨테이너에게 이렇게 그려달라고 요구
   response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<!-- XML은 꼭 <list>로 구성할 필요는 없지만 하나의 노드(?)안에 다 들어갈 수 있게 작성해야한다. -->
<list>
	<total_dataCount>5</total_dataCount>
	<%
	for(int i=1; i<5; i++)
	{
	%>
		<comment num="<%=i %>">
			<name><%=name + i %></name>
			<contet><%=content + i %></contet>
		</comment>
	<% 
	}
	%>
</list>



<%-- <?xml version="1.0" encoding="UTF-8"?>
<list>
	<total_dataCount>5</total_dataCount>
	<comment num="1">
		<name>홍길동1</name>
		<content>내용1</content>
	</comment>
		<comment num="2">
		<name>홍길동2</name>
		<content>내용2</content>
	</comment>
		<comment num="3">
		<name>홍길동3</name>
		<content>내용3</content>
	</comment>
		<comment num="4">
		<name>홍길동4</name>
		<content>내용4</content>
	</comment>
		<comment num="5">
		<name>홍길동5</name>
		<content>내용5</content>
	</comment>
</list>
 --%>


