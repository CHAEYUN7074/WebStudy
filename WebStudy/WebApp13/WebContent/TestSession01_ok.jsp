<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// TestSession01_ok.jsp
	
	// 이전 페이지(TestSession01.jsp)로 부터 넘어온 데이터(userId, userPwd) 수신
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// dto 활용 → 로그인 관련 테이블의 데이터와 비교(dao 활용) → 로그인 액션 처리
	// 이 이루어지지만 이부분 생략하고! 진행!
	
	String memberId = "superman";
	String memberPwd = "123456";
	String memberName = "이찬호";
	
	if(userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// 로그인 액션 처리
		session.setAttribute("userId", userId);	//userId - superman
		session.setAttribute("userName",memberName);	// userName - 이찬호
		
		// 로그인 성공했으니 클라이언트가 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("TestSession01.jsp");
	}
	
%>


<h2>로그인 실패~!!!</h2>

<a href="TestSession01.jsp">돌아가기</a>






