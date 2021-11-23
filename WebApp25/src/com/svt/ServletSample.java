/*==================
	ServletSample.java
===================== */

package com.svt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletSample  extends HttpServlet
{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException
	{
		process(requset, response);
	}

	@Override
	protected void doPost(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException
	{
		process(requset, response);
	}
	
	protected void process(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException
	{
	}
	
}