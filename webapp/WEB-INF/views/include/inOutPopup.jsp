<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>열처리 열전출고, 열후입고 이력</title>
<jsp:include page="../include/pluginpage.jsp"/>

<style>
#wrap{
	position:absolute;
	z-index:20005;
	background-color:white;
    top:200px;
    left:200px;
    border-radius:10px 10px 10px 10px;
    border:1px solid black;
}

.row{
	display:flex;
}

.inputSpan{
	width:100px;
	display:inline-block;
	font-weight:700;
	font-size:14pt;	
}
.left_in{
	font-weight:700;
	font-size:14pt;
	background-color: #eef;
	width:220px;
}

.left{
	border-radius:5px 5px 5px 5px;
	border:1px solid black;
	margin-right:6px;
}

.inOutModal{
    position:absolute;
    display:none;
    
    justify-content: center;

    width:80%;
    height:70%;

    background-color: rgba(0,0,0,0.4);
}
.inOutModalClose{
	position:absolute;
	width:50px;
	height:30px;
	font-size:14pt;
	font-weight:700;
	text-align:center;
	top:10px;
	left:1480px;
    border-radius:5px 5px 5px 5px;
    border:1px solid black;
    cursor:pointer;
    background-color: #eee;
}
</style>

</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap" class="inOutModal">
	<div id="contents">
		<div style="color: black; font-size: 14px; margin-left: 2.5%; text-align: left;"> 
			<b style="font-size:15pt;">열처리 열전출고 이력</b> 
		</div>
		<hr>
		<div class="row">
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 1호기 출고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht1_out_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht1_out_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht1_out_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht1_out_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht1_out_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht1_out_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht1_out_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht1_out_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 2호기 출고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht2_out_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht2_out_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht2_out_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht2_out_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht2_out_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht2_out_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht2_out_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht2_out_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 3호기 출고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht3_out_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht3_out_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht3_out_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht3_out_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht3_out_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht3_out_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht3_out_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht3_out_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 4호기 출고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht4_out_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht4_out_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht4_out_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht4_out_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht4_out_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht4_out_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht4_out_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht4_out_gijong"/> </div>
				</div>
			</fieldset>
		</div>
		<hr style="margin-top:2%;" />
		<!-- 입고 -->
		<div style="color: black; font-size: 14px; margin-left: 2.5%; text-align: left;"> 
			<b style="font-size:15pt;">열처리 열후입고 이력</b> 
		</div>
		
		<div class="row">
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 1호기 입고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht1_in_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht1_in_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht1_in_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht1_in_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht1_in_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht1_in_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht1_in_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht1_in_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 2호기 입고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht2_in_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht2_in_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht2_in_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht2_in_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht2_in_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht2_in_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht2_in_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht2_in_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 3호기 입고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht3_in_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht3_in_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht3_in_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht3_in_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht3_in_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht3_in_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht3_in_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht3_in_gijong"/> </div>
				</div>
			</fieldset>
			
			<fieldset class="left">
				<div class="input_info">
					<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>열처리 4호기 입고</b></div>
					
					<div class="inputtxt"> <span class="inputSpan">순번 :</span> <input type="text" class="left_in" id="ht4_in_pumbun" /></div>
					<div class="inputtxt"> <span class="inputSpan">시간 :</span> <input type="text" class="left_in" id="ht4_in_tdatetime" /> </div>
					<div class="inputtxt"> <span class="inputSpan">LOTNO :</span> <input type="text" class="left_in" id="ht4_in_lotno" /> </div>
					<div class="inputtxt"> <span class="inputSpan">MES코드 :</span> <input type="text" class="left_in" id="ht4_in_dobun"/></div>
					<div class="inputtxt"> <span class="inputSpan">약어 :</span> <input type="text" class="left_in" id="ht4_in_pumcode"/> </div>
					<div class="inputtxt"> <span class="inputSpan">품명 :</span> <input type="text" class="left_in" id="ht4_in_pumname"/> </div>
					<div class="inputtxt"> <span class="inputSpan">적재수량 :</span> <input type="text" class="left_in" id="ht4_in_loadcnt"/> </div>
					<div class="inputtxt"> <span class="inputSpan">기종 :</span> <input type="text" class="left_in" id="ht4_in_gijong"/> </div>
				</div>
			</fieldset>
		</div>
		
	</div>
	<div class="inOutModalClose">닫 기</div>
</div>		

	
<script>
	//로드
	$(function () {
		getInoutData();
	});
	// 로드 끝
		
	
	// 처리품 상세정보
	function getInoutData(){
			
		$.ajax({
			url:"/transys/work/workInOutPopup/data",
			type:"post",
			dataType:"json",
			success:function(result){
				var data = result.data;
				
				for(let key in data){
					
					var rows = data[key];
//					console.log(rows.out_devicecode);
					//출고
					console.log(rows);
					if(rows.out_devicecode >= '1'){
						var device = rows.out_devicecode;
						$("#ht"+device+"_out_pumbun").val(rows.out_pumbun);
						$("#ht"+device+"_out_tdatetime").val(rows.out_tdatetime);
						$("#ht"+device+"_out_lotno").val(rows.out_lotno);
						$("#ht"+device+"_out_dobun").val(rows.out_dobun);
						$("#ht"+device+"_out_pumcode").val(rows.out_pumcode);
						$("#ht"+device+"_out_pumname").val(rows.out_pumname);
						$("#ht"+device+"_out_loadcnt").val(rows.out_loadcnt);
						$("#ht"+device+"_out_gijong").val(rows.out_gijong);
					}
					
					if(rows.in_devicecode >= '1'){
						var device = rows.in_devicecode;
						$("#ht"+device+"_in_pumbun").val(rows.in_pumbun);
						$("#ht"+device+"_in_tdatetime").val(rows.in_tdatetime);
						$("#ht"+device+"_in_lotno").val(rows.in_lotno);
						$("#ht"+device+"_in_dobun").val(rows.in_dobun);
						$("#ht"+device+"_in_pumcode").val(rows.in_pumcode);
						$("#ht"+device+"_in_pumname").val(rows.in_pumname);
						$("#ht"+device+"_in_loadcnt").val(rows.in_loadcnt);
						$("#ht"+device+"_in_gijong").val(rows.in_gijong);
					}
				}
			}
		});
	}

	
	</script>
	
	<form name=parmForm method="post">
		<input type="hidden" id="chk1" name="chk1"/>
		<input type="hidden" id="tdate1" name="tdate1" />
		<input type="hidden" id="pcode1" name="pcode1"/>
	</form>

</body>
</html>
