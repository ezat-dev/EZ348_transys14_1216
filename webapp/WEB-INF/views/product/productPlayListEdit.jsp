<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>처리품관리</title>
<jsp:include page="../include/pluginpage.jsp"/>
<style>


.row{
	display:flex;
}

.inputSpan{
	/*width:100px;*/
	display:inline-block;
	font-weight:700;
	font-size:14pt;	
}
.left_in{
	font-weight:700;
	font-size:14pt;	
	width:220px;
}

.left{
	border-radius:5px 5px 5px 5px;
	border:1px solid black;
	margin-right:6px;
}

	/* 버튼 */
	button{
		width: 150px;
		height: 35px;
		margin-left: 5px;
		border: 1px solid black; 
		color: firebrick;
		font-size:15pt;
		font-weight:700;
	}
	
		
	button:hover {     
		background: firebrick;
		border: 1px solid firebrick;
		color: white; 
	}


</style>
</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">
	<div id="body2">
		
		<div id="contents">
			<!-- <div style="color: black; font-size: 20px; padding-top: 2%;"> &lt;투입 LIST&gt; </div> -->
			<div style="color: black; font-size: 15pt; font-weight:700; padding-top: 5%; margin-left: 2.5%; text-align: left;"> <b>진행리스트 데이터 편집</b></div>
			<hr>
			<div class="row">
				<fieldset class="left">
					<div class="input_info">
						<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>위치 구분</b></div>
						
						<div class="inputtxt"> <span class="inputSpan">[1] 투입완료 : 탈지로 입구 리프트에 처리품이 위치할 때</span></div>
						<div class="inputtxt"> <span class="inputSpan">[2] 예열장입 : 처리품이 예열실에 도착할 때</span></div>
						<div class="inputtxt"> <span class="inputSpan">[3] 침탄실(1) : 침탄처리 시작위치</span></div>
						<div class="inputtxt"> <span class="inputSpan">[4] 확산실(1) : 침탄처리 종료 및 확산처리 시작위치</span></div>
						<div class="inputtxt"> <span class="inputSpan">[5] 냉각실(1) : 확산처리 종료위치</span></div>
						<div class="inputtxt"> <span class="inputSpan">[6] 소입1실 : 소입처리 시작위치</span></div>
						<div class="inputtxt"> <span class="inputSpan">[7] 소입2실 : 소입2실 추출 처리종료</span></div>
						<div class="inputtxt"> <span class="inputSpan">[8] SALT장입 : SALT처리 시작위치</span></div>
						<div class="inputtxt"> <span class="inputSpan">[9] SALT추출 : 출구리트리버 후퇴정지</span></div>
						<div class="inputtxt"> <span class="inputSpan">[10] 세정장입 : 세정기 DIPS조 처리품</span></div>
						<div class="inputtxt"> <span class="inputSpan">[11] 소려로장입 : 소려로 로내(1) 처리품</span></div>
						<div class="inputtxt"> <span class="inputSpan">[12] 추출완료 : 공통설비 스톡컨베이어에서 자동대차로 적재</span></div>
					</div>
				</fieldset>

				<fieldset class="left">
					<div class="input_info" style="margin-top:20%;">
						<div style="margin: 5% 0%; text-align: center; font-size: 19px;"><b>데이터 수정</b></div>
							<div class="inputtxt"> 
								<span class="inputSpan" style="width:120px;">침탄로 호기 :</span> 
								<input type="text" class="left_in" id="devicecode" readonly="readonly"/>
							</div>
							<div class="inputtxt"> 
								<span class="inputSpan" style="width:120px;">품번 :</span> 
								<input type="text" class="left_in" id="pumbun" readonly="readonly"/>
							</div>
							<div class="inputtxt"> 
								<span class="inputSpan" style="width:120px;">LOTNO :</span> 
								<input type="text" class="left_in" id="lotno" readonly="readonly"/>
							</div>
						
						
							<div class="inputtxt"> 
								<span class="inputSpan" style="width:120px;">위치 :</span> 
<!-- 								<input type="text" class="left_in" id="cur_location"/> -->

								<select id="cur_location" class="left_in" style="width:228px;">
									<option value="1">[1] 투입완료</option>
									<option value="2">[2] 예열장입</option>
									<option value="3">[3] 침탄실(1)</option>
									<option value="4">[4] 확산실(1)</option>
									<option value="5">[5] 냉각실(1)</option>
									<option value="6">[6] 소입1실</option>
									<option value="7">[7] 소입2실</option>
									<option value="8">[8] SALT장입</option>
									<option value="9">[9] SALT추출</option>
									<option value="10">[10] 세정장입</option>
									<option value="11">[11] 소려로장입</option>
									<option value="12">[12] 추출완료</option>
								</select>
							</div>
							<div class="inputtxt"> 
								<span class="inputSpan" style="width:120px;">참고사항 :</span> 
								<input type="text" class="left_in" id="remark"/>
							</div>

							<div class="btnaddpage" style="margin-top: 3%;">
								<button id="saveBtn" type="button">저장</button>
								<button id="closeBtn" type="button">닫기</button>
							</div>
					</div>
				</fieldset>				
			</div>
		</div>
	</div>
</div>

			
	<script>
	//전역변수
	var productList;
	
	var productListlotNo;
	var productListPumbun;
	var productListDevicecode;
	var productListCurLocation;
	var productListRemark;
	
	//로드
	$(function () {
		
		productListlotNo = localStorage.getItem("productListlotNo");
		productListPumbun = localStorage.getItem("productListPumbun");
		productListDevicecode = localStorage.getItem("productListDevicecode");
		productListCurLocation = localStorage.getItem("productListCurLocation");
		productListRemark = localStorage.getItem("productListRemark");
		
		$("#devicecode").val(productListDevicecode);
		$("#pumbun").val(productListPumbun);
		$("#lotno").val(productListlotNo);
		
		
		$("#cur_location").val(productListCurLocation);
		
		if(productListRemark != null &&
				productListRemark != "null"){
			$("#remark").val(productListRemark);
		}
	});
	// 로드 끝
	
	/*이벤트*/
	$("#saveBtn").on("click", function(){
		setProductListEdit();
	});
	
	$("#closeBtn").on("click", function(){
		window.close();
	});
	
	/*함수*/
	function setProductListEdit(){
		
		$.ajax({
			url:"/transys/product/productPlayListEdit/save",
			type:"post",
			dataType:"json",
			data:{
				"lotno":$("#lotno").val(),
				"pumbun":$("#pumbun").val(),
				"devicecode":$("#devicecode").val(),
				"cur_location":$("#cur_location").val(),
				"remark":$("#remark").val(),
			},success:function(result){
				window.close();
				opener.getProduct();				
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
