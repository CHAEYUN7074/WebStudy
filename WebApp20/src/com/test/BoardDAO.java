/*=================
	BoardDAO.java
===================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 생성자 정의
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내기
	public int getMaxNum()
	{
		int result = 0;
		
		java.sql.Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getInt(1);
			rs.close();
			stmt.close();
		}
		catch (Exception e) 
		{
			System.out.println(e.toString());
		}
	
		
		return result;
		
	}// end getMaxNum()
	
	
	// 게시물 작성 → 데이터 입력
	// 게시물에 모든 속성을 insert 시키려는 거니까 → BoardDTO
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			// hitCount 는 기본값 0 또는 defualt 또는 입력 항목 생략 가능
			// created s는 기본값 sysdate 또는 dault 또는 입력항목 생략 가능
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0 , SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			
		return result;
		
	}// end insertData(BoardDTO dto)
	
	
	// DB 레코드 갯수를 가져오는 메소드 정의
	// 페이징 처리
	// → 검색 기능을 작업하게 되면 수정하게 될 메소드
	/*
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getInt(1);
			
			rs.close();
			stmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end getDataCount()
	*/
	// 					    제목,작성자,내용
	public int getDataCount(String searchKey, String searchValue)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			// CHECK~!!
			searchValue = "%" + searchValue + "%";
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE " + searchKey + " LIKE ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			while (rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
		
	}// end getDataCount(String searchKey, String searchValue)
	
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을
	// 읽어오는 메소드 정의
	// 각페이지에서의 목록 ex) 1페이지에서의 목록 3페이지에서의 목록
	// → 검색 기능을 작업하게 되면 수정하게 될 메소드
	//    검색하면 24 / 35 / 68 이런애들이 한페이지에 되어야하니까
	/*
	public List<BoardDTO> getLists(int start, int end)
	{
		// List는 new List<> 안됨! → <> 은 Vector, ArrayList, LinkedList클래스로 구현됨!
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try
		{
			// sql 문 이렇게 가져오는 것도 방법! → 앞에 띄어쓰기 중요 / 마지막 세미콜론 체크
			sql =  "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED";
			sql += " FROM";
			sql += " (";
			sql += "    SELECT ROWNUM RNUM, DATA.*";
			sql += "    FROM";
			sql += "    (";
			sql += "        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED";
			sql += "        FROM TBL_BOARD";
			sql += "        ORDER BY NUM DESC";
			sql += "    ) DATA";
			sql += " )";
			sql += " WHERE RNUM >= ? AND RNUM <= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);					// check~!!
			pstmt.setInt(2, end);					// check~!!
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}// end getLists(int start, int end)
	*/
	public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue)
	{
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try
		{
			searchValue = "%" + searchValue + "%";	//-- 검색 추가

		    sql =  "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED";
			sql += " FROM";
			sql += " (";
			sql += "    SELECT ROWNUM RNUM, DATA.*";
			sql += "    FROM";
			sql += "    (";
			sql += "        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED";
			sql += "        FROM TBL_BOARD";
			sql += "        WHERE " + searchKey + " LIKE ?" ;		// 추가 구문~!!!
			sql += "        ORDER BY NUM DESC";
			sql += "    ) DATA";
			sql += " )";
			sql += " WHERE RNUM >= ? AND RNUM <= ?";
		    
		    
		    pstmt = conn.prepareStatement(sql);
		    
		    pstmt.setString(1, searchValue); 			//-- 검색 추가
		    pstmt.setInt(2, start);						//-- 인덱스 변경
		    pstmt.setInt(3, end);						//-- 인덱스 변경
		      
		    rs = pstmt.executeQuery();
		      
		    while(rs.next())
		    {
		       BoardDTO dto = new BoardDTO();
		         
		       dto.setNum(rs.getInt("NUM"));
		       dto.setName(rs.getString("NAME"));
		       dto.setSubject(rs.getString("SUBJECT"));
		       dto.setHitCount(rs.getInt("HITCOUNT"));
		       dto.setCreated(rs.getString("CREATED"));
		         
		       result.add(dto);
		    }
		      
		    rs.close();
		    pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
		
	}// end getLists(int start, int end, String searchKey, String searchValue)
	
	
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	// 게시물번호 받아서 쿼리문 수행해서 수행했으면 1 안했으면 0 int 반환하면 됨!
	public int updateHitCount(int num)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();		
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}// end updateHitCount(int num)
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = new BoardDTO();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT"
					+ " , CONTENT, IPADDR, HITCOUNT"
					+ " , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD"
					+ " WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);		// 이거 빠뜨림~!~!~!!
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				// 이부분 check! (이렇게 해도 오류 안나네..?)
				result = new BoardDTO();
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));				
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}// end  getReadData(int num)
	
	
	// 특정 게시물을 삭제하는 기능의 메소드
	public int deleteData(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e)
		{
				System.out.println(e.toString());
		}
		
		
		return result;
		
	}// end deleteData(int num)
	
	
	// 특정 게시물의 내용을 수정하는 메소드 정의
	// 매개변수 int 면 안되는거 체크!!
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD"
					+ " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
					+ " WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6,dto.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	
	}// end updateData(BoardDTO dto)
	
	
	
	// 특정 게시물의 이전 게시물 번호 얻어내느 메소드 정의
	// 지금 게시물번호 받아서 이전의 게시물번호 반환
	// 이전 게시물이 존재하지 않을 경우 -1 반환
	/*
	public int getBeforeNum(int num) throws SQLException
	{
		int result = 0;
	      
	    String sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, num);
	        
	    ResultSet rs = pstmt.executeQuery();
	    while(rs.next())
	    	result = rs.getInt("BEFORENUM");
	         
	    rs.close();
	    pstmt.close();
	     
	    return result;
	 }// end getBeforeNum(int num)
	 */
	
	public int getBeforeNum(int num)
	   {
	      int result = 0;
	      
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "";
	      
	      try
	      {
	    	  /*
	    	  sql = "SELECT NAL(MAX(NUM),-1) AS BEFORENUM"
	                  + " FROM TBL_BOARD"
	                  + " WHERE NUM<?";
	    	  */
	         sql="SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         
	         rs = pstmt.executeQuery();
	         while(rs.next())
	         {
	            result = rs.getInt("BEFORENUM");
	         }
	         rs.close();
	         pstmt.close();
	         
	      } catch (Exception e)
	      {
	         System.out.println(e.toString());
	      }
	      
	      return result;
	      
	      
	   }
	
	// 특정 게시물의 다음 게시물 번호 얻어내는 메소드 정의
	// 다음 게시물이 존재하지 않을 경우 -1 반환
	public int getNextNum(int num) throws SQLException
	{
      int result = 0;

      String sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
            
      ResultSet rs = pstmt.executeQuery();
      while(rs.next())
         result = rs.getInt("NEXTNUM");
         
      rs.close();
      pstmt.close();
      
      return result;
   }// end getNextNum(int num)
	
	
	
	
	
	
	
	
	
}