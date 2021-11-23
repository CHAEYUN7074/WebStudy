var ajax = null;

//ajax 객체 생성 함수
function createAjax()
{	
	/*
	if(window.ActiveXObject)
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
		//이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환하라
		// (ActiveXObject 객체 -> XMLHttpRequest 객체의 대리 객체)
		
	}
	else //그 외의 브라우저
	{
		if(window.XMLHttpRequest) //XMLHttpRequest 지원 브라우저
		{
			return new XMLHttpRequest();
			//이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환하라
		}
		else
		{
			return null;
		}
	}
	*/
	
	if(window,XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
		//return new ActiveXObject("Msxm12.XMLHTTP");
		return new ActiveXObject("Microsoft.XMLHTTP");
	}	
	else
	{
		return null;
	}
	
}