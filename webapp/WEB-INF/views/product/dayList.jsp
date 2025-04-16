<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>열처리 1~4호기</title>
<jsp:include page="../include/pluginpage.jsp"/>
<style>

	body {
			text-align: center;
		}

	hr{
		width: 95%;
		margin: 10px 2.5% 2% 2.5%;
	}
	
	label{
		font-size:14pt;
	}
    label > select {
        width: 150px;
        height: 29px;
        font-size: 14pt;
    }
        
    label > input {
        width: 150px;
        height: 27px;
        font-size: 14pt;
    }
	
	#menu_bar{
		padding-top: 3%;
		background: #123478;
	}
	
	.list_input{
		text-align: center;
		margin: 1% 5%;
		padding: 10px 0%;
		width: 90%;
		border: 3px solid #F4EFEA;
	}
	
	legend{
		border: 0px;
		width: 7%;
		font-size: 14pt;
		margin-bottom: 0px;
		padding-left: 2%;
		text-align: left;
	}
	
	.input_d{
		font-size: 14pt;
		font-weight: 600;
		color: black;
	}
	
	#devicecode{
		/* 설비명 셀렉트 박스 */
		font-size: 14pt;
		text-align: center;
	}
	
	.btn_work{
		/* 작업일보 버튼 */
		margin-top: 10px;
	}

	/* 작업일보 버튼 */
	div > button{
		width: 120px;
		height: 30px;
		border: 1px solid black; 
		color: #123478;
		font-size:14pt;
		font-weight:700;
		cursor:pointer;
	}
	
		
	div > button:hover {     
		background: #798cb3;
		border: 1px solid #798cb3;
		color: white; 
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
		max-height: 70%;
		overflow:auto;
	}
	
	/*수정 테이블*/
	#edit_table{
		width: 90%;
		text-align: center;
		margin: auto;
		margin-top: 1.5%;
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
		
	td > input[type=text]{
		width: 100%;
		background: transparent;
		text-align: center;
		border: 0px;
	}
	
	input[type="text"]:disabled {
	  color: #c3c3c3;
	}

</style>
</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">
	
	<div id="body2">
		<div id="menu_bar">
			<jsp:include page="../include/PheaderPopup.jsp"/>
		</div>
	
	<div id="contents">
		<div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;width:350px;"> 
		<b style="font-size:15pt;">처리폼관리</b> / <label style="font-size:14pt;">일자별 투입 LIST</label> </div>
		<hr>
		
		<fieldset class="list_input">
			<legend style="font-size:15pt;">검색조건</legend>
			<div class="input_d">
				<div class="row_label" style="display: inline-block; position: absolute; top:260px; left:530px;">
					<label> 설비명 : 
						<select style="font-weight:100; font-size: 14pt; text-align: center;" 
							name="devicecode" id="devicecode" >
							<option value="">전체</option>
							<option value="1">1호기</option>
							<option value="2">2호기</option>
							<option value="3">3호기</option>
							<option value="4">4호기</option>
						</select>
					</label>
				
					<label style="margin-left: 15px;"> 작업일자 : 
					<input type="text" class="daySet" id="wdate" name="wdate" 
					style=" font-weight:700; font-size: 14pt; text-align: center; width:150px;" placeholder="" /></label>
				
				</div>

				<div class="row_data"  style="margin-left: 44%;">
					<div class="row_top">
						<button style="margin-left: 0;" id="searchBtn" onclick="getProduct();">조회</button>
						
						<button id="addBtn">추가</button>				
						<button id="deleteBtn">삭제</button>
						
					</div>
					
					<div class="row_bottom" style="margin-top:1%;">			
						<button style="margin-left:0;" id="endSaltBtn">SALT추출</button>

						<button id="outBtn">출고 요청</button>
						<button id="excelBtn">엑셀</button>
					</div>
				</div>
			</div>
		</fieldset>
		<div class="countDATA">조회된 데이터 수 : </div>
		<div id="workDetailList" style="margin-left: 110px;"></div>

	</div>
</div>
</div>
	<script>

	//로드
	$(function () {
		var now = new Date();
		var y = now.getFullYear();
		var m = paddingZero(now.getMonth()+1);
		var d = paddingZero(now.getDate());
		$("#wdate").val(y+"-"+m+"-"+d);
		getProduct();
	});
	// 로드 끝
	
	$("#closeBtn").on("click", function(){
		window.close();
	});

	// 삭제 버튼 클릭 시	
	$('#deleteBtn').on("click",function(){
		var lotNo = localStorage.getItem("lotNo");
		
		if(confirm("LotNo : "+lotNo+"를 \n삭제하시겠습니까?")){
			setWorkDetailDelete();
		}
	});
	
	//SALT추출
	$("#endSaltBtn").on("click",function(){
		var lotNo = localStorage.getItem("lotNo");
		
		if(confirm("LotNo : "+lotNo+"의 \nSALT추출시간을 수정하시겠습니까?")){
			setWorkDetailEndSalt();
		}
	});
	
	//전체완료
	$("#endTimeBtn").on("click",function(){
		var lotNo = localStorage.getItem("lotNo");
		
		if(confirm("LotNo : "+lotNo+"의 \nSALT완료시간을 수정하시겠습니까?")){
			setWorkDetailEndTime();
		}
	});
	
	// 출고요청
	$("#outBtn").on("click", function() {
	    var lotNo = localStorage.getItem("lotNo");
	    var pumbun = localStorage.getItem("pumbun");

	    // 팝업창 열기
	    window.open("/transys/product/dayList/popup", "popupWindow", "width=800,height=600,scrollbars=yes");

	   
	});

	

	

	
	$("#addBtn").on("click", function(){
		getPopupDetailAdd();
	});



	//SALT추출
	function setWorkDetailEndSalt(){
		var lotNo = localStorage.getItem("lotNo");

		$.ajax({
			url:"/transys/work/workDetail/endSalt",
			type:"post",
			dataType:"json",
			data:{"lotNo":lotNo},
			success:function(result){
				alert(result.data);
				getProduct();
			}
		});	
	}




	function getProduct() {
	    var p_devicecode = "";
	    var p_date = $("#wdate").val();
	    p_date = p_date.replace(/-/g, ""); // "YYYYMMDD" 형식으로 변환

		
	    
	    /* 작업일보 상세 */
	    alarmHistory = new Tabulator("#workDetailList", {
	        height: "550px",
	        layout: "fitColumns",
	        selectable: true,
	        tooltips: true,
	        selectableRangeMode: "click",
	        reactiveData: true,
	        headerHozAlign: "center",
	        ajaxConfig: "POST",
	        ajaxLoader: false,
	        ajaxURL: "/transys/product/dayList/list",
	        ajaxProgressiveLoad: "scroll",
	        ajaxParams: {
	            "p_devicecode": $("#devicecode").val(),
	            "p_date": p_date
	        },
	        paginationSize:20,

	        // Ajax 응답 처리 함수
	        ajaxResponse: function(url, params, response) {
	            console.log("Ajax 응답 URL: ", url);
	            console.log("Ajax 응답 파라미터: ", params);
	            console.log("Ajax 응답 데이터: ", response);
				
				document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + response.data.length;
				
	            return response; // 응답 데이터 출력
	        },
	        
	        placeholder: "조회된 데이터가 없습니다.",
	        columns: [
	            {title:"Lot NO", field:"lotno", sorter:"string", width:160, hozAlign:"center"},
	            {title:"침탄로 호기", field:"devicecode", sorter:"string", width:120, hozAlign:"center"},
	            {title:"품번", field:"pumbun", sorter:"string", width:100, hozAlign:"center"},
	            {title:"공통설비 호기", field:"common_device", sorter:"string", width:140, hozAlign:"center"},
	            {title:"품명코드", field:"pumcode", sorter:"string", width:180, hozAlign:"center"},
	            {title:"품명", field:"pumname", sorter:"string", width:180, hozAlign:"center"},
	            {title:"기종", field:"gijong", sorter:"string", width:110, hozAlign:"center"},
	            {title:"적재량", field:"loadcnt", sorter:"string", width:110, hozAlign:"center"},
	            {title:"투입구분", field:"status", sorter:"string", width:110, hozAlign:"center"},
	            {title:"데이터발생", field:"datastatus", sorter:"string", width:110, hozAlign:"center"},
	            {title:"MES LOT", field:"meslot", sorter:"string", width:195, hozAlign:"center"},
	            {title:"참고사항", field:"remark", sorter:"string", width:195, hozAlign:"center"},
	        ],
	        rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#workDetailList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#workDetailList div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				//행 선택시 세션에 LOTNO전송
				localStorage.setItem("lotNo",rowData.lotno);
				localStorage.setItem("pumbun",rowData.pumbun);
				localStorage.setItem("deviceCode", rowData.devicecode);

				 	console.log("Selected Row Data:");
				    console.log("Lot No: ", rowData.lotno);
				    console.log("Device Code: ", rowData.devicecode);
				    console.log("Common Device: ", rowData.common_device);
				    console.log("Pum Code: ", rowData.pumcode);
				    console.log("Pum Name: ", rowData.pumname);
				    console.log("Gijong: ", rowData.gijong);
				    console.log("Load Count: ", rowData.loadcnt);
				    console.log("Status: ", rowData.status);
				    console.log("Data Status: ", rowData.datastatus);
				    console.log("MES Lot: ", rowData.meslot);
				    console.log("Remark: ", rowData.remark);		
			},
			rowDblClick: function(e, row){

				var rowData = row.getData();

				//행 선택시 세션에 LOTNO전송
				localStorage.setItem("lotNo",rowData.lotno);
				localStorage.setItem("pumbun",rowData.pumbun);
				getPopupDetailEdit();
			}
		});
	}
	//추가화면 팝업창
	function getPopupDetailAdd(){
		var width = window.screen.width;
		var height = window.screen.height;
		
		var popupx = 0;
		var popupy = 0;
		
		openWin = window.open('/transys/work/workDetailAdd', 'detail_edit', 'status=no, width='+width+', height='+height+', menubar=1, left='+popupx+',top='+ popupy+', screenX='+popupx+', screenY='+popupy);
		
	}	
	
	function setWorkDetailDelete(){
		var lotNo = localStorage.getItem("lotNo");
			
		$.ajax({
			url:"/transys/work/workDetail/inlineDelete",
			type:"post",
			dataType:"json",
			data:{"lotNo":lotNo},
			success:function(result){
				getProduct();
			}
		});
	}
		
	</script>
</body>
</html>
