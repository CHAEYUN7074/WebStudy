/**
 * myMenu.js
 */

/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/


function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if(status == 1)
	{
		//메뉴 보이기
		//alert("메뉴 보이기");
		menu.style.display = "block";
	}
	else
	{
		//메뉴 감추기
		//alert("메뉴 감추기");
		menu.style.display = "none";
	}
}




























