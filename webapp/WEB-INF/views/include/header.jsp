<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <title>Menu</title>
	<jsp:include page="pluginpage.jsp"/>
	<jsp:include page="inOutPopup.jsp"/>
<style>

#topMenu {            
		height: 60px; 
		width: 100%;
		margin: 0 auto;
		justify-content: center;
		text-align: left;
		font-size: 18px;
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
        width: 160px;       
        height: 35px;     
		padding-top: 5px;               
        font-size: 19px;                           
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
	<nav id="topMenu">
		<ul>
		<!-- 
			<li><a class="menuLink" href="OVERVIEW.jsp">오버뷰</a></li>
 		-->
			<li><a class="menuLink" href="/transys/ccf/ccf01_02">침탄1,2호기</a></li>

			<li><a class="menuLink" href="/transys/ccf/ccf03_04">침탄3,4호기</a></li>

			
			<li><a class="menuLink" href="/transys/cm/cm01">공통 1호기</a></li>			
	
			
			<li><a class="menuLink" href="/transys/popup_data"  style="" >MENU</a></li>
			
			
			<li><a id="inOutList" class="menuLink" style="cursor:pointer;" >입출고이력</a></li>
			
			<li><a class="menuLink" href="/transys/alarm/alarmList">경보이력</a></li>
		</ul>
	</nav>
<script>

$("#inOutList").on("click",function(e){
	console.log("asd");
	$(".inOutModal").css("display","flex");
	
/*	
	var width = window.screen.width-250;
	var height = 800;
	
	var popupx = 0;
	var popupy = 300;
	
	openWin = window.open('/transys/work/workInOutPopup', '', 'status=no, width='+width+', height='+height+', menubar=1, left='+popupx+',top='+ popupy+', screenX='+popupx+', screenY='+popupy);
*/	
});

$(".inOutModalClose").on("click", function(){
	$(".inOutModal").css("display","none");
});

</script>	
</body>
</html>