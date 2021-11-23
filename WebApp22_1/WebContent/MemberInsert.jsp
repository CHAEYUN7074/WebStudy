<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ajax.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//MemberInsert.jsp
	//5명분 데이터 수신 →객체 구성→ 자료구조 구성→ setArribute()
	//                    MemberDTO
	
	//MemberList.jsp를 요청할 수 있도록 안내
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	String name[] = request.getParameterValues("name");
	String tel[] = request.getParameterValues("tel");
	String addr[ ]= request.getParameterValues("addr");
	
	
	MemberDTO dto = null;
	
	for(int i=1; i<=5; i++)
	{
		MemberDTO ob = new MemberDTO(
							request.getParameter("name"+i)
							,request.getParameter("tel"+i)
							,request.getParameter("addr"+i));
		lists.add(ob);		
	}
request.setAttribute("lists", lists); /* 리스트라는 이름으로 넘겨주도록 한다 */
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
