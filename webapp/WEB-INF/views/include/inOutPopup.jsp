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

	body {
		text-align: center;
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
	<div id="contents">
		<div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;"> 
			<b style="font-size:15pt;">열처리 열전출고, 열후입고 이력</b> 
		</div>
		<hr>
		
		<div id="inOutData"></div>
	
	</div>


</div>		
	
<script>
	//로드
	$(function () {
		getInoutData();
	});
	// 로드 끝
		
	// 처리품 상세정보
	function getInoutData(){
			
		var p_devicecode = "";

		var p_date = $("#wdate").val();
		
//		p_date = "2015-01-08";
		
			
	/* 작업일보 상세 */
		alarmHistory = new Tabulator("#inOutData", {
		    height:"200px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
		    ajaxLoader:false,
		    ajaxURL:"/transys/work/workInOutPopup/data",
		    ajaxProgressiveLoad:"scroll",			    			    
		    ajaxParams:{
		    },
		    placeholder:"조회된 데이터가 없습니다.",
		    paginationSize:20,
		    ajaxResponse:function(url, params, response){
		        //url - the URL of the request
		        //params - the parameters passed with the request
		        //response - the JSON object returned in the body of the response.	        
				$("#inOutData .tabulator-col.tabulator-sortable").css("height","29px");
		        return response; //return the response data to tabulator
		    },
		    
		    columns:[
		        {title:"호기", field:"out_devicecode", sorter:"string", width:60,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-순번", field:"out_pumbun", sorter:"string", width:80,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-시간", field:"out_tdatetime", sorter:"string", width:180,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-LOTNO", field:"out_lotno", sorter:"string", width:120,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-MES 코드", field:"out_dobun", sorter:"string", width:140,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-약어", field:"out_pumcode", sorter:"string", width:140,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-품명", field:"out_pumname", sorter:"string", width:140,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-적재수량", field:"out_loadcnt", sorter:"string", width:100,
		        	hozAlign:"center", headerSort:false},
		        {title:"출고-기종", field:"out_gijong", sorter:"string", width:100,
		        	hozAlign:"center", headerSort:false},
			        {title:"입고-순번", field:"in_pumbun", sorter:"string", width:80,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-시간", field:"in_tdatetime", sorter:"string", width:180,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-LOTNO", field:"in_lotno", sorter:"string", width:120,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-MES 코드", field:"in_dobun", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-약어", field:"in_pumcode", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-품명", field:"in_pumname", sorter:"string", width:140,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-적재수량", field:"in_loadcnt", sorter:"string", width:100,
			        	hozAlign:"center", headerSort:false},
			        {title:"입고-기종", field:"in_gijong", sorter:"string", width:100,
			        	hozAlign:"center", headerSort:false},
		        	],
		    rowFormatter:function(row){
			    var data = row.getData();
			    
			    row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick:function(e, row){

				$("#inOutData .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
						
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("#inOutData div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});

				var rowData = row.getData();
				//행 선택시 세션에 LOTNO전송
				localStorage.setItem("lotNo",rowData.lotno);
				localStorage.setItem("pumbun",rowData.pumbun);
					
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

	</script>
	
	<form name=parmForm method="post">
		<input type="hidden" id="chk1" name="chk1"/>
		<input type="hidden" id="tdate1" name="tdate1" />
		<input type="hidden" id="pcode1" name="pcode1"/>
	</form>

</body>
</html>
