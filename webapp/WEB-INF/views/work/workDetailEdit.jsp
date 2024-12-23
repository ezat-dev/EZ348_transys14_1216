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

	body {
			text-align: center;
			scroll:no;
			overflow: hidden;
			color: black;
		}

	hr{
		width: 95%;
		margin: 10px 2.5% 2% 2.5%;
	}
	
	/* 버튼 */
	div > button{
		width: 150px;
		height: 35px;
		margin-left: 5px;
		border: 1px solid black; 
		color: firebrick;
		font-size:15pt;
		font-weight:700;
	}
	
	.offBtn{
		color: lightgray !important;
	}
	
	.offBtn:hover{
		background: gray !important;
		border: 1px solid black;
		color: white; 
	}
	
		
	div > button:hover {     
		background: firebrick;
		border: 1px solid firebrick;
		color: white; 
	}

	#contents{
		color: black;
	}
	
	#hogi{
		width: 150px;
		height: 25px;
		font-size: 14px;
		padding: 2px;
		text-align: center;
		
	}
	
	/* 테이블 */
	#table_file{
		width: 50%;
		height: 600px;
		text-align: center;
		float:left;
		overflow:auto;
	}
	
	.add_box{
		width: 20%;
		text-align: left;
/*		overflow:auto;*/
		display:inline-block;
	}
	
	.add_text{
		width:90%;
		margin-bottom: 1px;
	}
	
	.countDATA{
		text-align: left;
		font-size:15pt;
	}
	
	div > input{
		width: 220px;
		height: 25px;
		font-size:15pt;
		font-weight:700;
	}

	.add_text > label{
		font-size:14pt;
		font-weight:700;
		width: 100px;
		display:inline-block;
	}
	
</style>
</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">
	<div id="body2">
		
		<div id="contents">
			<!-- <div style="color: black; font-size: 20px; padding-top: 2%;"> &lt;투입 LIST&gt; </div> -->
			<div style="color: black; font-size: 15pt; font-weight:700; padding-top: 5%; margin-left: 2.5%; text-align: left;"> <b>열처리 투입 데이터 편집</b></div>
			<hr>
			<div id="table_file" style="margin-left: 3%;" >
				<div id="productList"></div>
			</div>
			
			<div style="text-align: center; font-size:15pt; margin-left:25%;">작업구분</div>
			
			<form method="post" id="workEditForm" name="workEditForm">
				<div class="add_box" style="margin-top: 1%;" >
					<!-- 라디오박스 -->
					<div class="add_text"><label>호기 :</label> <input type="text" id="devicecode" name="devicecode" readonly="readonly" style="background-color:white;"/></div>
					<div class="add_text"><label>품번 :</label> <input type="text" id="pumcode" name="pumcode" readonly="readonly" style="background-color:white;"/></div>
					<div class="add_text"><label>기종 :</label> <input type="text" id="gijong" name="gijong"/></div>
					
					
					<div class="add_text"><label>투입시간 :</label> <input type="text" id="starttime" name="starttime"/></div>
					<div class="add_text"><label>SALT추출 :</label> <input type="text" id="endsalt" name="endsalt"/></div>
					<div class="add_text"><label>MES LOT :</label> <input type="text" id="meslot" name="meslot"/></div>
				</div>
				
				<div class="add_box" style="margin-top: 1%;" >
					<!-- 라디오박스 -->						
					
					<div class="add_text"><label>LotNo :</label> <input type="text" id="lotno" name="lotno" readonly="readonly" style="background-color:white;"/></div>
					<div class="add_text"><label>품명코드 :</label> <input type="text" id="pumname" name="pumname"/></div>
					<div class="add_text"><label>적재량 :</label> <input type="text" id="loadcnt" name="loadcnt"/></div>
					
					<div class="add_text"><label></label> <input type="text" id="ssss" name="ssss" readonly="readonly"/></div>
					<div class="add_text"><label>추출완료 :</label> <input type="text" id="endtime" name="endtime"/></div>
					<div class="add_text"><label>참고사항 :</label> <input type="text" id="remark" name="remark"/></div>
				</div>
			</form>
		</div>
	</div>
		
	<div class="btnaddpage" style="margin-top: 3%;">
		<button id="saveBtn" type="button">저장</button>
		<button id="closeBtn" type="button">닫기</button>
	</div>
</div>
			
	<script>
	//전역변수
	var productList;
	
	//로드
	$(function () {
		//제품리스트 호출
		getProductList();
		//LotNo기준 수정데이터 조회
		getWorkDetailEditData();
	});
	// 로드 끝
	
	/*이벤트*/
	$("#saveBtn").on("click", function(){
		setWorkDetailEditDataSave();
	});
	
	$("#closeBtn").on("click", function(){
		window.close();
	});
	
	/*함수*/
	function getProductList(){
		var lotNo = localStorage.getItem("lotNo");
		
		productList = new Tabulator("#productList", {
		    height:"550px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/transys/work/workDetail/productList",
		    ajaxProgressiveLoad:"scroll",			    			    
		    ajaxParams:{
		    },
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
		        //url - the URL of the request
		        //params - the parameters passed with the request
		        //response - the JSON object returned in the body of the response.
				$("#productList .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    columns:[
		        {title:"제품 - 품번", field:"dobun", sorter:"string", width:200,
		        	hozAlign:"center"},
		        {title:"제품 - 기종", field:"gijong", sorter:"string", width:120,
		        	hozAlign:"center"},
		        {title:"제품 - 품명코드", field:"pumcode", sorter:"string", width:200,
		        	hozAlign:"center"},
		        {title:"제품 - 품명", field:"pumname", sorter:"string", width:300,
		        	hozAlign:"center"},
		    ],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#productList .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
					
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#productList div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();

				//행 선택시 세션에 LOTNO전송
				var gijong = rowData.gijong;
				
				$("#gijong").val(gijong);
				
			}
		});
	}
	
	function getWorkDetailEditData(){
		var lotNo = localStorage.getItem("lotNo");
		
		$.ajax({
			url:"/transys/work/workDetail/editData",
			type:"post",
			dataType:"json",
			data:{"lotNo":lotNo},
			success:function(result){
				console.log(result);
				var devicecode = result.data.devicecode;
				var pumcode = result.data.pumcode;
				var gijong = result.data.gijong;
				var starttime = result.data.starttime;
				var endsalt = result.data.endsalt;
				var meslot = result.data.meslot;
				var lotno = result.data.lotno;
				var pumname = result.data.pumname;
				var loadcnt = result.data.loadcnt;
				var endtime = result.data.endtime;
				var remark = result.data.remark;
				
				$("#devicecode").val(devicecode);				
				$("#pumcode").val(pumcode);				
				$("#gijong").val(gijong);				
				$("#starttime").val(starttime);				
				$("#endsalt").val(endsalt);				
				$("#meslot").val(meslot);				
				$("#lotno").val(lotno);				
				$("#pumname").val(pumname);				
				$("#loadcnt").val(loadcnt);				
				$("#endtime").val(endtime);				
				$("#remark").val(remark);				
			}
		});
	}
	
	function setWorkDetailEditDataSave(){
		var workData = new FormData($("#workEditForm")[0]);
		$.ajax({
			url:"/transys/work/workDetail/editDataSave",
			type:"post",
			contentType: false,
			processData: false,
			dataType: "json",
			data:workData,
			success:function(result){
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
