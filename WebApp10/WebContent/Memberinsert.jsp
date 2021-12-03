<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// Memberinsert.jsp
	//-- 데이터 입력 액션 처리 페이지
	
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지에서 받아온 데이터 수신
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		// MemberDTO 구성 없으면 호출 못함!! check~!!!
		MemberDTO member = new MemberDTO();
		member.setName(userName);
		member.setTel(userTel);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		// insert 액션의 정상 처리여부 확인 후 추가 코드 구성 가능~~!!!
		
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
	
	// URL 주소가 기록되어 있는 쪽지를 사용자에게 전달(→ sendRedirect() 메소드 활용)
	// (여기를 찾아가렴~)
	response.sendRedirect("MemberList.jsp");
	
	
	
%>



















