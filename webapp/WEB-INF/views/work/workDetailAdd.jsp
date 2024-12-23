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
	
		
	div > button:hover {     
		background: firebrick;
		border: 1px solid firebrick;
		color: white; 
	}

	#contents{
		color: black;
	}
	
	#manage{
		width: 150px;
		height: 25px;
		font-size: 14px;
		padding: 2px;
		text-align: center;
		
	}
	
	/* 테이블 */
	#table_file{
		width: 60%;
		height: 600px;
		text-align: center;
		float:left;
		overflow:auto;
	}
	
	.add_box{
		width: 35%;
		text-align: left;
		max-height: 40%;
		overflow:auto;
	}
	
	.add_text{
		margin-bottom: 5px;
		font-size:15pt;
		font-weight:700;
		width:60%;
	}

	.add_text > label{
		font-size:14pt;
		font-weight:700;
		width: 180px;
		display:inline-block;
	}
	
	
	.countDATA{
		text-align: left;
		font-size:15pt;
	}
	
	div > input{
		width: 180px;
		height: 30px;
		font-size:14pt;
	}
	
	div > select{
		width: 180px;
		height: 30px;
		font-size:14pt;
	}
	
</style>
</head>

<body data-offset="60" data-target=".navbar">
<div id="wrap">
	<div id="body2">
		
		<div id="contents">
			<div style="color: black; font-size: 14px; padding-top: 5%; margin-left: 2.5%; text-align: left;"> <b style="font-size:15pt;">처리품관리</b> / <label style="font-size:14pt;">투입 LIST - 열처리 투입 리스트 등록</label> </div>
			<hr>
			<div id="table_file" style="margin-left: 3%;" >
				<div id="productList" style="width:90%;"></div>
			</div>
			
			<div style="text-align: center; font-size:15pt; margin-left:25%;">작업데이터</div>
			
			<form id="workDataAddForm" name="workDataAddForm" method="post">
				<div class="add_box" style="margin-top: 5%;" >
					<div class="add_text"><label>처리품 코드 : </label><input type="text" id="pumcode" name="pumcode"/></div>
					<div class="add_text"><label>침탄로 :</label>
						<select id="devicecode" name="devicecode" >
							<option value="1">1호기</option>
							<option value="2">2호기</option>
							<option value="3">3호기</option>
							<option value="4">4호기</option>
						</select>
					</div>
					<div class="add_text"><label>작업번호 : </label><input type="text" id="seq" name="seq"/></div>
					<div class="add_text"><label>공통설비 호기 : </label><input type="text" id="common_device" name="common_device"/></div>
					<div class="add_text"><label>적재수량 : </label><input type="text" id="cnt" name="cnt"/></div>
		
					<div class="add_text" style="margin-top: 2%;"><label>Cycle NO : </label><input type="number" id="cycleno" name="cycleno"/></div>
					<div class="add_text"><label>아지테이터 RPM : </label><input type="number" id="agitate_rpm" name="agitate_rpm"/></div>
					<div class="add_text"><label>MES LOT : </label><input type="text" id="meslot" name="meslot"/></div>
				</div>
			</form>
		</div>
		
		<div class="btnaddpage" style="margin-top: 15%;">
			<button id="saveBtn" type="button">저장</button>
			<button id="closeBtn" type="button">닫기</button>
		</div>
	</div>
</div>		
	<script>

	//로드
	$(function () {
		getProductDataInit();
		getProductList();
	});
	// 로드 끝

	/*이벤트*/
	
	$("#closeBtn").on("click", function(){
		window.close();
	});
	$("#saveBtn").on("click", function(){
		setWorkDetailAddDataSave();
	});
    
	/*함수*/
	function getProductDataInit(){
		//처리품 추가정보 중 작업번호(seq), 공통로호기(common_device) 초기화
		$("#common_device").val("1");
		$("#seq").val(0);
		$("#pumcode").val("");
		$("#loadcnt").val(0);
		$("#cycleno").val(0);
		$("#agitate_rpm").val(0);
		$("#meslot").val("");
	}
	
	
	function getProductList(){
		
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
		    ajaxParams:{},
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
		        {title:"품명코드", field:"dobun", sorter:"string", width:160,
		        	hozAlign:"center"},
		        {title:"품명", field:"pumname", sorter:"string", width:200,
		        	hozAlign:"center"},
		        {title:"기종", field:"gijong", sorter:"string", width:150,
		        	hozAlign:"center"},
		        {title:"적재량", field:"cnt", sorter:"string", width:150,
		        	hozAlign:"center"},
		        {title:"CYCLE NO.", field:"cycleno", sorter:"string", width:160,
		        	hozAlign:"center"},
		        {title:"아지테이터RPM", field:"agitate_rpm", sorter:"string", width:180,
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
				
				$("#pumcode").val(rowData.dobun);
				$("#cnt").val(rowData.cnt);
				$("#cycleno").val(rowData.cycleno);
				$("#agitate_rpm").val(rowData.agitate_rpm);
			}
		});
	}	
	
	function setWorkDetailAddDataSave(){
		var workData2 = new FormData($("#workDataAddForm")[0]);
		
		$.ajax({
			url:"/transys/work/workDetail/addDataSave",
			type:"post",
			contentType: false,
			processData: false,
			dataType: "json",
			data:workData2,
			success:function(result){
				console.log(result);
				
				var data = result.data;
				
				if(data == "OK"){
					opener.getProduct();
					window.close();					
				}else{
					alert(data);
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
