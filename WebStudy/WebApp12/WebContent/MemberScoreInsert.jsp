<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// MemberScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지로부터  데이터 수신
	String sid = request.getParameter("sid");				// check~!! 앞에서는 sid를 표현식으로 했기 때문에
	//String name = request.getParameter("name");			// memberScoreInsertForm 에서 ?sid=표현식 이렇게해서 값을 받아와야함!!!!
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신된 데이터로 MemberScoreDTO 구성 → add 메소드의 매개변수
		int kor = Integer.parseInt(korStr);
		int eng = Integer.parseInt(engStr);
		int mat = Integer.parseInt(matStr);
		
		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		//score.setName(name);
		score.setKor(kor);								// 국영수 int 값 check~!! (여기서 형변환 해도됨!)
		score.setEng(eng);								// score.setEng(Integer.parseInt(eng));	
		score.setMat(mat);
		
		// dao 의 add() 메소드 호출 → 데이터 입력(insert 수행)
		dao.add(score);
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	// check~!!
	// 새로운 페이지 요청할 수 있도록 안내
	response.sendRedirect("MemberScoreSelect.jsp");
	
%>
