/*=================================
 		MemberDTO.java
 - 객체 전용 (데이처 보관 및 전송)
===================================*/

package com.test;

public class MemberDTO 
{
	private String sid, name, tel;

	// getter / setter
	public String getSid() 
	{
		return sid;
	}

	public void setSid(String sid) 
	{
		this.sid = sid;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
	}

	public String getTel() 
	{
		return tel;
	}

	public void setTel(String tel) 
	{
		this.tel = tel;
	}
	
	
}
