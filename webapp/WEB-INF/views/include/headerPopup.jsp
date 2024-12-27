<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <title>Document</title>
<style>

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
}

#topMenu .menuLink {          
        text-decoration:none;         
        color: white;                 
        display: block;                            
        width: 120px;                             
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
			<li><a class="menuLink" href="/transys/work/workDetail">작업일보상세</a></li>
			
			<li><a class="menuLink" href="/transys/work/workDay">작업일보</a></li>
			
			<li><a class="menuLink" href="/transys/work/workMonth">작업월보</a></li>
			
			<li><a class="menuLink" href="/transys/work/workYear">작업연보</a></li>
			
			<!--<li><a class="menuLink" href="/transys/work/dayPrint">작업일보 인쇄</a></li>
			
			<li><a class="menuLink" href="/transys/work/monthPrint">작업월보 인쇄</a></li>
			
			<li><a class="menuLink" href="/transys/work/yearPrint">작업년보 인쇄</a></li>-->
			

			
			<li><a class="menuLink" href="/transys/popup_data">MENU</a></li>
		</ul>
	</nav>
			
</body>
</html>