<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// MemberDelete.jsp
	
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	// 상황에 따라 다른 주소값을 보내야 하기 때문에
	String strAddr = "";
	
	
	try
	{
		dao.connection();
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고다 하는 데이터의
		//	 SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		
		if(checkCount == 0)			//-- 제거 가능
		{
			dao.remove(sid);
			// 다시 리스트로 보내고
			strAddr = "MemberSelect.jsp";
		}	
		else						//-- 제거 불가
		{
			//dao.remove(sid);
			//-- TBL_MEMBERSCORE 테이블의 데이터가
			//	 TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우로
			//	 삭제가 불가능한 상황
			//-- 제거하지 못하는 사유를 안내하는 페이지로 이동
			//	 + 리스트로 돌아가는 버튼
			
			strAddr = "Notice.jsp";
			
		}
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
	
	// 상황별로 요청 페이비 다르니까!
	response.sendRedirect(strAddr);
	
	
	
	
%>
