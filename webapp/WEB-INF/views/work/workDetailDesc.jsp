<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>작업실적</title>
<jsp:include page="../include/pluginpage.jsp"/>

<style>

	body {
		text-align: center;
		background: #F1F1F1;
	}
	
	#menu_bar{
		padding-top: 5%;
		background: #123478;
	}
	
	.list_input{
		text-align: center;
		margin: 1% 0%;
	}
	
	
	.input_d{
		font-size: 14px;
		font-weight: 600;
		color: black;
	}
	
	#placename{
		/* 설비명 셀렉트 박스 */
		font-size: 14px;
		text-align: center;
	}
	
	.btn_work{
		/* 작업일보 버튼 */
		margin-top: 10px;
	}

	/* 작업일보 버튼 */
	div > button{
		width: 90px;
		height: 30px;
		border: 1px solid #123478; 
		color: #123478;
	}
	
		
	div > button:hover {     
		background: #798cb3;
		border: 1px solid #798cb3;
		color: #123478; 
	}

	.text-center{
		font-size: 16px;
	}
	
	.countDATA{
		/* 조회된 데이터 수 */
		width: 90%;
		text-align: right;
		color: black;
		margin: 0 auto;
		margin-bottom: 3px;
		font-size:15pt;
	}
	
	#table_file{
		width: 90%;
		text-align: center;
		margin: auto;
		max-height: 40%;
		overflow:auto;
	}
	
	#qr_memo{
		width: 60%;
		text-align: center;
	}
	
	.del_btn{
		background: transparent;
		border: 0px;
		color: #123478;
		font-size: 20px;
	}

	.NO_list{
		text-align: center;
	}
	
	#back_div{
		text-align: right;
		padding-right: 2%;
		padding-top: 2%;
	}
	
	#back_btn{
		float: right;
		background-color: transparent;
		border : 0px;
		color : #123478;
	}
	
	/* 테이블 스크롤 없애기 */
	#table_file{
		-ms-overflow-style:none;
		height: 550px;
	}
	
	#table_file::-webkit-scrollbar { display:none; }
	/* 테이블 스크롤 없애기 끝 */
	/* alert창 */

</style>

</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">
			
			<!-- 상세 정보 -->	
					
				<!-- 현재위치 -->	
				<span
				style="position:fixed; left:30px; top:45px; font-weight:700; font-size:15pt; 
				text-align:center; color: black; cursor:pointer;">MESLOT</span>
				
				<span class="meslot" id="meslot"
				style="position:fixed; left:150px; top:45px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
				color:darkblue; background:WHITE; cursor:pointer;"></span>			
							
				<!-- LOT NO -->	
				<span
				style="position:fixed; left:920px; top:45px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">LOT NO</span>
				
				<span class="lotno" id="lotno"
				style="position:fixed; left:1020px; top:45px; font-weight:700; font-size:15pt; text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
						
					
					
				<!-- 품명코드 -->	
				<span
				style="position:fixed; left:30px; top:80px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">품명코드</span>
				
				<span class="pumcode" id="pumcode"
				style="position:fixed; left:150px; top:80px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>			
						
				<!-- 품번 -->	
				<span
				style="position:fixed; left:920px; top:80px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">품번</span>
				
				<span class="pumbun" id="pumbun"
				style="position:fixed; left:1020px; top:80px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
					
				<!-- 설비 -->	
				<span
				style="position:fixed; left:920px; top:115px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">설비</span>
				
				<span class="devicecode" id="devicecode"
				style="position:fixed; left:1020px; top:115px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
					
					
					
				<!-- 품명 -->	
				<span
				style="position:fixed; left:30px; top:115px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">품명</span>
				
				<span class="pumname" id="pumname"
				style="position:fixed; left:150px; top:115px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>			
							
				<!-- 기종 -->	
				<span
				style="position:fixed; left:480px; top:115px; font-weight:700; font-size:15pt; 
				text-align:left; color: black; width: 100px; 
					cursor:pointer;">기종</span>		
				
				<span class="gijong" id="gijong"
				style="position:fixed; left:580px; top:115px; font-weight:700; font-size:15pt; 
				text-align:center; width: 320px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
				
					 			
				
					
				<!-- 적재량 -->	
				<span
				style="position:fixed; left:30px; top:175px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">적재량</span>
				
				<span class="cnt" id="cnt"
				style="position:fixed; left:150px; top:175px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
							
				<!-- 구분 -->	
				<!-- <span
				style="position:fixed; left:430px; top:175px; font-weight:700; font-size:15pt; text-align:left; color:darkblue; width: 100px; 
					cursor:pointer;">구분</span>		
						
				<span
				style="position:fixed; left:530px; top:175px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">침탄</span>
					 		
				<span
				style="position:fixed; left:175px; top:175px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">확산</span>		
					 		
				<span
				style="position:fixed; left:690px; top:175px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">소입1</span>		
					 		
				<span
				style="position:fixed; left:770px; top:175px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: #123478; width: 80px;  
					 cursor:pointer;">SALT</span>		 -->
					
				<!-- 투입완료 -->	
				<span
				style="position:fixed; left:920px; top:175px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">투입완료</span>
				
				<span class="starttime" id="starttime"
				style="position:fixed; left:1020px; top:175px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
							
					
					
				<!-- 재질 -->	
				<span
				style="position:fixed; left:30px; top:210px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">재질</span>
				
				<span class="material" id="material"
				style="position:fixed; left:150px; top:210px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
							
				<!-- 설정온도 -->	
				<!-- <span
				style="position:fixed; left:430px; top:210px; font-weight:700; font-size:15pt; text-align:left; color:darkblue; width: 100px; 
					 border-right: 1px solid white; cursor:pointer;">설정온도 (℃)</span>		
						
				<span
				style="position:fixed; left:530px; top:210px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478; cursor:pointer;">0</span>
					 		
				<span
				style="position:fixed; left:610px; top:210px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;
					border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:690px; top:210px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:770px; top:210px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					 cursor:pointer;">0</span>	 -->
					
				<!-- 예열장입 -->	
				<span
				style="position:fixed; left:920px; top:210px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">예열장입</span>
				
				<span class="startcarb" id="startcarb"
				style="position:fixed; left:1020px; top:210px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>		
					
					 	
					 	
				<!-- 단중량 -->	
				<span
				style="position:fixed; left:30px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">단중량</span>
				
				<span class="danjung" id="danjung"
				style="position:fixed; left:150px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>
								
				<!-- 처리온도 -->	
				<!-- <span
				style="position:fixed; left:430px; top:245px; font-weight:700; font-size:15pt; text-align:left; color:darkblue; width: 100px; 
					 border-right: 1px solid white; cursor:pointer;">처리온도 (℃)</span>		
						
				<span
				style="position:fixed; left:530px; top:245px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478; cursor:pointer;">0</span>
					 		
				<span
				style="position:fixed; left:610px; top:245px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;
					border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:690px; top:245px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478;  cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:770px; top:245px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					 cursor:pointer;">0</span>	 -->
					
				<!-- 처리온도 / 처리CP삭제 버전  -->
				<span
				style="position:fixed; left:480px; top:245px; font-weight:700; font-size:15pt; 
				text-align:left; color: black; width: 130px; 
					cursor:pointer;">구분</span>		
						
				<span
				style="position:fixed; left:580px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: white; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">침탄</span>
					 		
				<span
				style="position:fixed; left:660px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: white; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">확산</span>		
					 		
				<span
				style="position:fixed; left:740px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: white; background: #123478; width: 80px;  
					 border-right: 1px solid white; cursor:pointer;">소입1</span>		
					 		
				<span
				style="position:fixed; left:820px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: white; background: #123478; width: 80px;  
					 cursor:pointer;">SALT</span>	
					 
				<!-- 소입2추출 -->	
				<span
				style="position:fixed; left:920px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">소입2추출</span>
				
				<span class="endcarb" id="endcarb"
				style="position:fixed; left:1020px; top:245px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>		
					
					 	
					 	
				<!-- 경화깊이 -->	
				<span
				style="position:fixed; left:30px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">경화깊이</span>
				
				<span class="deep" id="deep"
				style="position:fixed; left:150px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>
								
				<!-- 설정CP -->	
				<!-- <span
				style="position:fixed; left:430px; top:280px; font-weight:700; font-size:15pt; text-align:left; color:darkblue; width: 100px; 
					 border-right: 1px solid white; cursor:pointer;">설정CP (%)</span>		
						
				<span
				style="position:fixed; left:530px; top:280px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478; cursor:pointer;">0</span>
					 		
				<span
				style="position:fixed; left:610px; top:280px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;
					border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:690px; top:280px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478;  cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:770px; top:280px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					 cursor:pointer;">0</span>	 -->
					
					
				<!-- 처리온도 / 처리CP삭제 버전  --> 
				<span
				style="position:fixed; left:450px; top:280px; font-weight:700; font-size:15pt; 
				text-align:left; color: black; width: 130px; 
					 border-right: 1px solid white; cursor:pointer;">설정온도 (℃)</span>		
				
				<!-- 침탄 -->	
				<span class="set_tmp1" id="set_tmp1"
				style="position:fixed; left:580px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>
				
				<!-- 확산 -->	 		
				<span class="set_tmp2" id="set_tmp2" 
				style="position:fixed; left:660px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- 소입1 -->	 		
				<span class="set_tmp3" id="set_tmp3"
				style="position:fixed; left:740px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478;  cursor:pointer;"></span>		
				
				<!-- SALT -->	 		
				<span class="set_tmp4" id="set_tmp4"
				style="position:fixed; left:820px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 cursor:pointer;"></span>	
					
				<!-- SALT추출 -->	
				<span
				style="position:fixed; left:920px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">SALT추출</span>
				
				<span class="endsalt" id="endsalt"
				style="position:fixed; left:1020px; top:280px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
					
							
					
				<!-- 표면경도 -->	
				<span
				style="position:fixed; left:30px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">표면경도</span>
				
				<span class="surfhard" id="surfhard"
				style="position:fixed; left:150px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
								
				<!-- 처리CP -->	
				<!-- <span
				style="position:fixed; left:430px; top:315px; font-weight:700; font-size:15pt; text-align:left; color:darkblue; width: 100px; 
					 border-right: 1px solid white; cursor:pointer;">처리CP (%)</span>		
						
				<span
				style="position:fixed; left:530px; top:315px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					border-right: 1px solid #123478; cursor:pointer;">0</span>
					 		
				<span
				style="position:fixed; left:610px; top:315px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;
					border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:690px; top:315px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					 border-right: 1px solid #123478; cursor:pointer;">0</span>		
					 		
				<span
				style="position:fixed; left:770px; top:315px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px;  
					 cursor:pointer;">0</span>	 -->
				
				<!-- 처리온도 / 처리CP삭제 버전  --> 	 
				<span
				style="position:fixed; left:450px; top:315px; font-weight:700; font-size:15pt; 
				text-align:left; color: black; width: 130px; 
					 border-right: 1px solid white; cursor:pointer;">설정CP (%)</span>		
				
				<!-- 침탄 -->	
				<span class="set_cp1" id="set_cp1"
				style="position:fixed; left:580px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>
				
				<!-- 확산 -->		 		
				<span class="set_cp2" id="set_cp2"
				style="position:fixed; left:660px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- 소입1 -->		 		
				<span class="set_cp3" id="set_cp3"
				style="position:fixed; left:740px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- SALT -->	 		 		
				<span class="p_sascp" id="p_sascp"
				style="position:fixed; left:820px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 cursor:pointer;"></span>	
					
				<!-- 세정장입 -->	
				<span
				style="position:fixed; left:920px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">세정장입</span>
				
				<span class="startwash" id="startwash"
				style="position:fixed; left:1020px; top:315px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>		
					
					
					
				<!-- 치저부 경도 -->	
				<span
				style="position:fixed; left:30px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">치저부 경도</span>
				
				<span class="inshard" id=""
				style="position:fixed; left:150px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>
									
				<!-- 설정시간 -->	
				<span
				style="position:fixed; left:450px; top:350px; font-weight:700; font-size:15pt; 
				text-align:left; color: black; width: 130px; 
					 border-right: 1px solid white; cursor:pointer;">설정시간</span>		
				
				<!-- 침탄 -->	
				<span class="p_csti" 
				style="position:fixed; left:580px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>
				
				<!-- 확산 -->	 		
				<span class="p_dsti" 
				style="position:fixed; left:660px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- 소입1 -->	 		
				<span class="p_so1sti" 
				style="position:fixed; left:740px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478;  cursor:pointer;"></span>		
				
				<!-- SALT -->	 		
				<span class="p_sasti" 
				style="position:fixed; left:820px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 cursor:pointer;"></span>	
					
				<!-- 건조로장입 -->	
				<span
				style="position:fixed; left:920px; top:350px; font-weight:700; font-size:15pt; 
				text-align:center; color: black;
					  cursor:pointer;">건조로장입</span>
				
				<span class="endwash" id=""
				style="position:fixed; left:1020px; top:350px; font-weight:700; font-size:15pt; text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>			
						
							
					
				<!-- CYCLE TIME -->	
				<span
				style="position:fixed; left:30px; top:385px; font-weight:700; font-size:15pt; text-align:center; color: black;
					  cursor:pointer;">CYCLE TIME</span>
				
				<span class="cycletime" id=""
				style="position:fixed; left:150px; top:385px; font-weight:700; font-size:15pt; text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>	
								
				<!-- 처리시간 -->	
				<span
				style="position:fixed; left:450px; top:385px; font-weight:700; font-size:15pt; text-align:left; color: black; width: 130px; 
					 border-right: 1px solid white; cursor:pointer;">처리시간</span>		
									
				<!-- 침탄 -->		
				<span class="cyc1_time"
				style="position:fixed; left:580px; top:385px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>

									
				<!-- 확산 -->	 		
				<span class="cyc2_time"
				style="position:fixed; left:660px; top:385px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- 소입1 -->		 		
				<span class="cyc3_time"
				style="position:fixed; left:740px; top:385px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 border-right: 1px solid #123478; cursor:pointer;"></span>		
				
				<!-- SALT -->	 		
				<span class="cyc4_time"
				style="position:fixed; left:820px; top:385px; font-weight:700; font-size:15pt; text-align:center; color:darkblue; background: white; width: 80px; height:30px;
					 cursor:pointer;"></span>	
					
				<!-- 추출완료 -->	
				<span
				style="position:fixed; left:920px; top:385px; font-weight:700; font-size:15pt; text-align:center; color: black;
					  cursor:pointer;">추출완료</span>
				
				<span class="endtime" id=""
				style="position:fixed; left:1020px; top:385px; font-weight:700; font-size:15pt; text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"></span>		
					
				<!-- 창고입고 예상시간 	
				<span
				style="position:fixed; left:920px; top:420px; font-weight:700; font-size:15pt; text-align:center; color: black;
					  cursor:pointer;">창고입고</span>
				
				<span class="mch_in" id=""
				style="position:fixed; left:1020px; top:420px; font-weight:700; font-size:15pt; text-align:center; width: 280px; height: 30px; border-bottom: 1px dotted #132478;
					color:darkblue; background:WHITE; cursor:pointer;"> 0 </span>		
				-->
<!-- color:#123478; -->								
					
			</div>		
	
	<script>
	//로드
	$(function () {
		getWorkDetailDesc();
	});
	// 로드 끝
		
	// 처리품 상세정보
	function getWorkDetailDesc(){
		var lotNo = localStorage.getItem("lotNo");
		
		$.ajax({
			type : "POST",
			url : "/transys/work/workDetailDesc/data",
			cache : false,
			dataType : "json",
			data : {'time':new Date().getTime(),
				'lotNo':lotNo},
				success:function(result){

					if(result.data != null){
						console.log(result.data);
						
						var devicecode = result.data.devicecode;				//로트번호
						var lotno = result.data.lotno;				//로트번호
						var pumcode = result.data.pumcode;			//제품코드
						var pumname = result.data.pumname;			//제품명
						var gijong = result.data.gijong;				//기종
						var pumbun = result.data.pumbun;				//품번
						var cnt = result.data.cnt;					//적재량
						var material = result.data.material;			//재질
						var danjung = result.data.danjung;			//단중량
						var deepl = result.data.deepL;				//경화깊이-로우
						var deeph = result.data.deepH;				//경화깊이-상
						var surfhard = result.data.surfhard;			//표면경도
						var inshard = result.data.inshard;			//치저부경도
						var cycletime = result.data.cycletime;		//사이클타임
						var starttime = result.data.starttime;		//투입완료
						var startcarb = result.data.startcarb;		//예열장입
						var endcarb = result.data.endcarb;			//소입2추출
						var endsalt = result.data.endsalt;			//SALT 추출
						var startwash = result.data.startwash;		//세정장입
						var endwash = result.data.endwash;			//건조로장입
						var endtime = result.data.endtime;			//추출완료
						var set_tmp1 = result.data.set_tmp1;			//침탄-설정온도
						var set_tmp2 = result.data.set_tmp2;			//확산-설정온도
						var set_tmp3 = result.data.set_tmp3;			//소입1-설정온도
						var set_tmp4 = result.data.set_tmp4;			//salt-설정온도
						var action_tmp1 = result.data.action_tmp1;	//침탄
						var action_tmp2 = result.data.action_tmp2;	//확산
						var action_tmp3 = result.data.action_tmp3;	//소입1
						var action_tmp4 = result.data.action_tmp4;	//salt
						var set_cp1 = result.data.set_cp1;			//침탄
						var set_cp2 = result.data.set_cp2;			//확산
						var set_cp3 = result.data.set_cp3;			//소입1
						var action_cp1 = result.data.action_cp1;		//침탄
						var action_cp2 = result.data.action_cp2;		//확산
						var action_cp3 = result.data.action_cp3;		//소입1
						var cyc1_time = result.data.cyc1_time;		//침탄-처리시간(분)
						var cyc2_time = result.data.cyc2_time;		//확산-처리시간(분)
						var cyc3_time = result.data.cyc3_time;		//소입1-처리시간(분)
						var cyc4_time = result.data.cyc4_time;		//SALT-처리시간(분)
						var meslot = result.data.meslot;				//MESLOT
						
						var mch_in = result.data.mch_in;				//MESLOT
	
						$(".meslot").text(meslot);
						$(".lotno").text(lotno);
						$(".pumcode").text(pumcode);
						$(".pumname").text(pumname);
						$(".gijong").text(gijong);
						$(".pumbun").text(pumbun);
						$(".devicecode").text(devicecode);
						$(".cnt").text(cnt);
						$(".material").text(material);
						$(".danjung").text(danjung);
						$(".deep").text(deepl+" ~ "+deeph);
						$(".surfhard").text(surfhard);
						$(".inshard").text(inshard);
						$(".cycletime").text(cycletime);
						$(".set_tmp1").text(set_tmp1);
						$(".set_tmp2").text(set_tmp2);
						$(".set_tmp3").text(set_tmp3);
						$(".set_tmp4").text(set_tmp4);
						$(".set_cp1").text(set_cp1);
						$(".set_cp2").text(set_cp2);
						$(".set_cp3").text(set_cp3);
						$(".cyc1_time").text(cyc1_time);
						$(".cyc2_time").text(cyc2_time);
						$(".cyc3_time").text(cyc3_time);
						$(".cyc4_time").text(cyc4_time);
						$(".starttime").text(starttime);
						$(".startcarb").text(startcarb);
						$(".endcarb").text(endcarb);
						$(".endsalt").text(endsalt);
						$(".startwash").text(startwash);
						$(".endwash").text(endwash);
						$(".endtime").text(endtime);
						$(".mch_in").text(mch_in);
					}
				}, // success 끝
				error: function(req, status) {
					if (req.status == 0 || status == "timeout") {
						alert("네트워크 연결 확인 후 다시 시도해주세요.");
					} else {
						alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
					}
				},
			})
	}

	</script>
	
	<form name=parmForm method="post">
		<input type="hidden" id="chk1" name="chk1"/>
		<input type="hidden" id="tdate1" name="tdate1" />
		<input type="hidden" id="pcode1" name="pcode1"/>
	</form>

</body>
</html>
