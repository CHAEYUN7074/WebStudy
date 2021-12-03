<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//ScoreInsert.jsp
	
	request.setCharacterEncoding("UTF-8");
	

	String userName = request.getParameter("userName");
	int userKor = Integer.parseInt(request.getParameter("scoreKor"));
	int userEng = Integer.parseInt(request.getParameter("scoreEng"));
	int userMat = Integer.parseInt(request.getParameter("scoreMat"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		score.setName(userName);
		score.setKor(userKor);
		score.setEng(userEng);
		score.setMat(userMat);
		
		dao.add(score);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
		try
		{
			dao.close();
		}
		catch(Exception e) 
		{
			System.out.println(e.toString());	
		}
		
	response.sendRedirect("ScoreList.jsp");
	

%>