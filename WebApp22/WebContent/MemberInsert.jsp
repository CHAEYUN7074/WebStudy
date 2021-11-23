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
	
	for(int i=0; i<name.length; i++)
	{
		dto = new MemberDTO(name[i], tel[i], addr[i]);
		lists.add(dto);		
	}
request.setAttribute("lists", lists);
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
