/*===========================================
 MVCSample01.java
 * - Controller 역할을 수행할 서블릿 클래스
===========================================*/

package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.MVCSample02Model;

public class MVCSample02 extends HttpServlet
{
   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      process(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      process(request, response);
   }
   
   protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      // 서블릿 관련 코딩
      
      // 모델 객체 생성 및 결과 수신(View 정보)
	  MVCSample02Model model = new MVCSample02Model();
	  String view = model.actionCount(request, response);
	  
	  
      RequestDispatcher rd = request.getRequestDispatcher(view);
      rd.forward(request, response);
      
   }
}
