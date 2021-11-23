/*===============================
  	   GuestDTO.java
 ===============================*/

package com.test;

public class GuestDTO
{
	// 주요 속성 구성
	private String userName;
	private String subject;		
	private String content;		
	private String created; //날짜		
	
	// getter / setter 구성
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}
	
}