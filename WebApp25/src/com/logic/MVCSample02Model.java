/*=================================
 	MVCSample02Model.java
 	- Model 역할을 수행할 클래스
=================================*/

package com.logic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCSample02Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		// 1부터 100까지의 수를 객체(컬렉션)에 저장하는 과정
		// 리스트를 제네릭으로 스트링으로 만들었기 때문에 i를 String 으로 바꿔줘야함
		List<String> lists = new ArrayList<String>();
		for(int i=1; i<=100; i++)
			lists.add(String.valueOf(i));
		
		request.setAttribute("lists", lists);
		
		result = "WEB-INF/view/MVCSample02.jsp";
		
		return result;
	}
}