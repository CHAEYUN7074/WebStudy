<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.test.MemberDAO"%>
<%
	// MemberDelete.jsp
	
	String sid = request.getParameter("sid");
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		// 이 메소드 호출시 리턴시 connection을 반환한다.
		// → Connection conn = dao.connection(); 이어야 한다. 
		// 그러나 변수를 선언했을 때 할당받는 메모리와 메소드를 호출했을 때 반환받는 메모리는 다르다.
		// 메소드 호출시 반환받는 메모리가 다르기 때문에... 
		// 대표적으로 add() remove() modify() 는 int 형을 반환하는데, 그래서 에러페이지 분기가 가능한데, 생략하고 진행할 수 있었던 이유는
		// 메소드 호출시 반환값을 어딘가 적재해두지 않고, 그냥 두면 휘발된다. 
		
		//dao.remove(sid);
		// 이렇게 들어갈 수 없다. 참조관계 때문에
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고자 하는 데이터의 
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		if (checkCount==0)
		{
			// checkCoun==0 은 자식 테이블의 참조 관계가 없다는 의미
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else
		{
			strAddr = "Notice.jsp";
			//-- 제거하지 못하는 사유를 안내하는 페이지...
			//   + 리스트로 돌아가기 버튼
			//-- TBL_MEMBERSCORE 테이블의 데이터가 
			//   TBL_MEMBER 테이블의 SID 를 참조하고 있는 ruddnsms 
			//   삭제가 불가능한 경우 
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
				System.out.println(e.toString());
		}
	}
	
	response.sendRedirect(strAddr);
	
%>