/*===============================
  	   FriendDTO.java
       - dto 또는 vo 활용
 ===============================*/


package com.test;

public class FriendDTO
{
	// 주요 속성 구성
	private String name; 		//-- 이름
	private String age;			//-- 나이
	private String gender;		//-- 성별
	private String[] idealType;	//-- 이상형
	//-- 이상형은 여러 개의 데이터가 동시에 전달되므로
	//   (다중 선택이 가능하도록 구성하였기 때문에)
	//   배열로 처리한다.	
	
	// getter / setter 구성
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getAge()
	{
		return age;
	}
	public void setAge(String age)
	{
		this.age = age;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIdealType()
	{
		return idealType;
	}
	public void setIdealType(String[] idealType)
	{
		this.idealType = idealType;
	}
	
	
}