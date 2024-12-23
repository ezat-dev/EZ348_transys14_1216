<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <title>Document</title>
<style>

.menuLink{
width: 300px;

}

#topMenu {            
		height: 40px; 
		width: 100%;
		margin: 0 auto;
		justify-content: center;
		text-align: center;
		font-size: 12px;
		list-style-type: none;
}

#topMenu li {    
	list-style: none;          
       color: white;             
       background-color: #123478;              
       line-height: 30px;        
       vertical-align: middle;   
       text-align: center;               
	   display: inline-block;
	    display: inline-block;
}

#topMenu .menuLink {          
        text-decoration:none;         
        color: white;                 
        display: block;                            
        width: 220px;                             
        font-size: 13pt;                           
        font-weight: bold;    
              
}

#topMenu .menuLink:hover {     
	background: lightslategray; 
}

ul{
	padding-top: 0px;
}


</style>
</head>
<body>
	<nav id="topMenu" >
		<ul>
			<li><a class="menuLink" href="/transys/product/productList">처리품 등록</a></li>
			
			<li><a class="menuLink" href="/transys/product/dayList">일자별투입 LIST</a></li>
			
			<li><a class="menuLink" href="/transys/product/productPlayList">진행리스트</a></li>
			
			
			<li><a class="menuLink" href="/transys/popup_data">MENU</a></li>
		</ul>
	</nav>
			
</body>
</html>