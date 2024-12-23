<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>TM 열처리 데이터 관리</title>
<style>
body{
	margin-top: 10%;

}

nav{
	text-align: center;
}

ul{
	padding-left: 0px;
}

#topMenu {            
		height: 40px; 
		width: 100%;
		margin: 0 auto;
		justify-content: center;
		text-align: center;
		font-size: 18px;
		list-style-type: none;
}

#topMenu li {    
	list-style: none;          
       color: #123478;                         
       line-height: 30px;        
       vertical-align: middle;   
       text-align: center;               
	   display: inline-block;
}

#topMenu .menu_head {          
        width: 200px;                             
        text-decoration:none;         
        color: #123478;                 
        display: block;                            
        font-size: 24px;                           
        font-weight: bold;          
}


/* 메뉴들 */
.Menu {            
		height: 40px; 
		width: 100%;
		margin: 0 auto;
		justify-content: center;
		text-align: center;
		font-size: 18px;
		list-style-type: none;   
}

.Menu li {    
	list-style: none;          
       color: white;             
       background-color: #123478;             
       line-height: 38px;        
       vertical-align: middle;   
       text-align: center;               
	   display: inline-block;
}

.Menu .menuLink {          
        width: 200px;                             
        text-decoration:none;         
        color: white;                 
        display: block;                            
        font-size: 18px;                           
        font-weight: bold;   
}

.Menu .menuLink:hover {     
	background: lightslategray; 
}
</style>
</head>
<body>
	<nav id="topMenu" >
		<ul>
			<li><a class="menu_head">작업실적</a></li>

			<li><a class="menu_head">경보</a></li>
			
			<li><a class="menu_head">처리품관리</a></li>

			<li><a class="menu_head">Utility</a></li>
		</ul>
	</nav>
	
	<nav class="Menu" >
		<ul>		
			<li><a class="menuLink" href="/transys/work/workDetail">작업일보상세</a></li>

			<li><a class="menuLink" href="/transys/alarm/alarmList">발생경보조회</a></li>
			
			<li><a class="menuLink" href="/transys/product/productList">처리품 등록</a></li>

			<li><a class="menuLink" href="/transys/util/lngMonth">LNG 사용량 (월)</a></li>
		</ul>
	</nav>
	
	<nav class="Menu" >
		<ul>		
			<li><a class="menuLink" href="/transys/work/workDay">작업일보</a></li>

			<li><a class="menuLink" href="/transys/alarm/alarmSum">발생경보누계</a></li>
	
			<li><a class="menuLink" href="/transys/product/dayList">투입 LIST</a></li>

			<li><a class="menuLink" href="/transys/util/lngYear">LNG 사용량 (년)</a></li>
		</ul>
	</nav>
	
	<nav class="Menu" >
		<ul>		
			<li><a class="menuLink" href="/transys/work/workMonth">작업월보</a></li>

			<li><a class="menuLink" href="/transys/alarm/alarmSum">경보정보</a></li>
			
			<li><a class="menuLink" href="/transys/product/productPlayList">진행 LIST</a></li>

			<li><a class="menuLink" href="/transys/util/electricMonth">전력 사용량 (월)</a></li>
		</ul>
	</nav>
	
	<nav class="Menu" >
		<ul>		
			<li><a class="menuLink" href="/transys/work/workYear">작업년보</a></li>

			<li><a class="menuLink"></a></li>
			
			<li><a class="menuLink"></a></li>

			<li><a class="menuLink" href="/transys/util/lngYear">전력 사용량 (년)</a></li>
		</ul>
	</nav>
	
	

	


	
	<nav class="Menu"  style="margin-top: 3%;" >
		<ul>		
			<li><a class="menuLink" href="/transys/ccf/ccf01_02" style="width:820px;">닫 기</a></li>
		</ul>
	</nav>
</body>
</html>