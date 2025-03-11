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
        }
        hr {
            width: 95%;
            margin: 10px 2.5% 2% 2.5%;
        }
        label > select {
            width: 150px;
            height: 30px;
            font-size: 14pt;
        }
        
        label > input {
         	width: 150px;
            height: 28px;
            font-size: 14pt;
        }

        
        
        #menu_bar {
            padding-top: 3%;
            background: #123478;
        }
        .list_input {
            text-align: center;
            margin: 0% 5%;
            padding: 10px 0%;
            width: 90%;
            border: 3px solid #F4EFEA;
        }
        legend {
            border: 0px;
            width: 7%;
            font-size: 15px;
            margin-bottom: 0px;
            padding-left: 2%;
            text-align: left;
        }
        .input_d {
            font-size: 14pt;
            font-weight: 700;
            color: black;
            height: 35px;
        }
        #placename {
            font-size: 14pt;
            text-align: center;
            font-weight: 700;
            width: 150px;
        }
        div > button {
            width: 120px;
            height: 30px;
            margin-left: 5px;
            border: 1px solid black; 
            color: #123478;
            font-size: 14pt;
            font-weight: 700;
        }
        div > button:hover {     
            background: #798cb3;
            border: 1px solid #798cb3;
            color: white; 
        }
        .text-center {
            font-size: 16px;
        }
        .countDATA {
            width: 90%;
            text-align: right;
            color: black;
            margin: 0 auto;
            margin-bottom: 3px;
            font-size: 15pt;
        }
        #table_file {
            width: 90%;
            text-align: center;
            margin: auto;
            max-height: 40%;
            overflow: auto;
        }
        #qr_memo {
            width: 60%;
            text-align: center;
        }
        .del_btn {
            background: transparent;
            border: 0px;
            color: #123478;
            font-size: 20px;
        }
        .NO_list {
            text-align: center;
        }
        #back_div {
            text-align: right;
            padding-right: 2%;
            padding-top: 2%;
        }
        #back_btn {
            float: right;
            background-color: transparent;
            border: 0px;
            color: #123478;
        }
        #table_file {
            -ms-overflow-style: none;
            height: 650px;
        }
        #table_file::-webkit-scrollbar { display: none; }
        #cate_list {
            border-collapse: collapse;
        }
        #cate_list th {
            position: sticky;
            top: 0;
        }
        
		.tabulator-print-header, tabulator-print-footer{
		    text-align:center;
		}        
        
    </style>
</head>

<body data-offset="60" data-target=".navbar" style="overflow-y: hidden">
<div id="wrap">
    <div id="body2">
		<div id="menu_bar">
			<jsp:include page="../include/headerPopup.jsp"/>
		</div>
        <div id="contents">
            <div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;">
                <b style="font-size: 15pt;">작업실적</b> / <label style="font-size: 14pt;">작업일보 인쇄</label>
            </div>
            <hr>
            <fieldset class="list_input">
                <legend style="font-size: 15pt;">검색조건</legend>
                <div class="input_d">
					<!--
					<label> 설비명 : 
					    <select name="placename" id="placename">
					        <option value="">전체</option>
					        <option value="1">1호기</option>
					        <option value="2">2호기</option>
					        <option value="3">3호기</option>
					        <option value="4">4호기</option>
					    </select>
					</label>
					-->


                    <label style="margin-left: 15px;"> 작업일자 : 
					    <input type="text" class="daySet" id="to_date" 
					    name="to_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" placeholder=""/>
					    
					</label>

                    <button id="searchbtn" style="margin-left: 100px;" type="button">조회</button>
                
                    <button id="excelBtn" type="button">엑셀</button>

                </div>
            </fieldset>
            <div id="table_file">
                <div class="countDATA">조회된 데이터 수 : </div>
                <div id="tabulator-table"></div> <!-- Tabulator가 테이블을 렌더링할 div -->
            </div>
        </div>
    </div>
</div>

<script>
    // Tabulator 테이블 설정
    var tableData = []; 
    var selectedDate = "";  // selectedDate를 글로벌 변수로 선언

    //검사값 합계
    var chkRowSum = 0;
    //가동시간값 합계
    var trayTimeSum = 0;
    
    //최종합
    var trayTimeFinalSum = 0;
    var trayFinalSum = 0;
    var loadCntFinalSum = 0;
    var chkCntFinalSum = 0;
    var totalCntFinalSum = 0;
    
    var table = new Tabulator("#tabulator-table", {
        height: 550,
        data: tableData, 
        layout:"fitColumns",
        selectable:true,    //로우 선택설정
        tooltips:true,
        selectableRangeMode:"click",
        reactiveData:true,
        headerHozAlign:"center",
        columns: [
            { title: "호기", field: "devicecode", width: 320, hozAlign:"center", visible:false},
            { title: "호기", field: "p_DATE", width: 320, hozAlign:"center", visible:false},
            { title: "호기", field: "date_feat", width: 320, hozAlign:"center", visible:false},
            { title: "품명", field: "pumname", width: 320, hozAlign:"center",headerSort:false},
            { title: "품명코드", field: "pumcode", width: 320, hozAlign:"center",headerSort:false},
            { title: "기종", field: "gijong", width: 220, hozAlign:"center",headerSort:false},
            { title: "Cycle", field: "cycleno", width: 120, hozAlign:"center",headerSort:false},
            { title: "가동시간", field: "tray_time", width: 120, hozAlign:"center",headerSort:false},
            { title: "Tray", field: "cnt", width: 120, hozAlign:"center",headerSort:false},
            { title: "생산수량", field: "loadcnt", width: 120, hozAlign:"center",headerSort:false},
            { title: "검사", field: "check_cnt", width: 120, hozAlign:"center",headerSort:false,
            	
            	
            	
/*				editable: function(cell) {
					// 현재 셀의 행 데이터 가져오기
					var rowData = cell.getRow().getData();
					var rowPumcode = rowData.pumcode;
					console.log(rowPumcode);
					// 행의 '합계' 값 여부 체크
					return rowPumcode !== "합계";
				},*/
				editor:true,
				cellEdited:function(cell){
					var workDate = $("#to_date").val();
					var rowData = cell.getRow().getData();
					var cellData = cell.getData();
					//devicecode
					//lotno, 앞자리8개
					//품코드
					//검사값		
					var deviceCode = rowData.devicecode;
					var lotDate = workDate.replace("-","").replace("-","");
					var pumCode = rowData.pumcode;

					var checkCnt = cellData.check_cnt;
					
					if(pumCode !== "합계" && checkCnt != null){
						dayPrintCheckCntSet(deviceCode, lotDate, pumCode, checkCnt);
						//생산수량
						//검사값
						var setVal = rowData.loadcnt - rowData.check_cnt;
						
						cell.getRow().getCell("total_cnt").setValue(setVal);
											
					}
//					getWorkDataPrintList();
					return false;
				}
			},
            { title: "합계", field: "total_cnt", width: 145, hozAlign:"center",headerSort:false
				},
        ],
	    rowFormatter:function(row){
	    	row.getElement().style.fontWeight = "700";
	    	row.getElement().style.backgroundColor = "#FFFFFF";
//	    	console.log(row.getData());
	    	
	    	var pumCode = row.getData().pumcode;
	    	var pumName = row.getData().pumname;
	    	var chkVal = row.getData().check_cnt;
	    	if(chkVal != 0 && chkVal != "" && pumCode != "합계"){	    		
		    	chkRowSum = chkRowSum + chkVal;
	    	}
	    	
	    	if(pumCode == "합계"){
	    		row.getCell("check_cnt").setValue(chkRowSum);
				var setVal = row.getData().loadcnt - row.getData().check_cnt;
				
				row.getCell("total_cnt").setValue(setVal);
				row.getCell("tray_time").setValue(trayTimeSum);
				
				//제일 아래 최종합계 구하기
			    trayTimeFinalSum = trayTimeFinalSum + trayTimeSum;	//가동시간
			    trayFinalSum = trayFinalSum + row.getData().cnt;		//tray
			    loadCntFinalSum = loadCntFinalSum + row.getData().loadcnt;	//생산수량
			    chkCntFinalSum = chkCntFinalSum + row.getData().check_cnt;		//검사
			    totalCntFinalSum = totalCntFinalSum + row.getData().total_cnt;	//합계
				
				//검사값 합, 가동시간값 합 초기화
	    		chkRowSum = 0;
	    		trayTimeSum = 0;
	    		row.getElement().style.backgroundColor = "#FAF4C0";
	    	}else{
	    		if(row.getCell("tray_time") != 0 && row.getCell("tray_time") != "" && pumCode != ""){
	    			trayTimeSum = trayTimeSum + row.getData().tray_time;	    			
	    		}
	    		
	    		//품명 "", 품명코드 "" 일때 최종합계값 적용
	    		if(pumCode === "" && pumName === ""){
	    			
	    			row.getCell("tray_time").setValue(trayTimeFinalSum);
	    			row.getCell("cnt").setValue(trayFinalSum);
	    			row.getCell("loadcnt").setValue(loadCntFinalSum);
	    			row.getCell("check_cnt").setValue(chkCntFinalSum);
	    			row.getCell("total_cnt").setValue(totalCntFinalSum);
	    			
	    			trayTimeFinalSum = 0;
	    			trayFinalSum = 0;
	    			loadCntFinalSum = 0;
	    			chkCntFinalSum = 0;
	    			totalCntFinalSum = 0;
	    			
	    			row.getElement().style.backgroundColor = "#CEFBC9";
	    		}
	    	}
	    	
	    	

	    	if(pumName.indexOf("호기") != -1){
	    		row.getCell("tray_time").setValue(null);
	    		row.getCell("cnt").setValue(null);
	    		row.getCell("loadcnt").setValue(null);
	    		row.getCell("check_cnt").setValue(null);
	    		row.getCell("total_cnt").setValue(null);
	    	}


	    	//맨 밑 합계값 구하기
		},
		rowClick:function(e, row){
			$(".tabulator-table > .tabulator-row").each(function(index, item){
				
				if($(this).hasClass("row_select")){							
					$(this).removeClass('row_select');
					row.getElement().className += " row_select";
				}else{
					$("div.row_select").removeClass("row_select");
					row.getElement().className += " row_select";

				}
			});			
		},
        placeholder: "검색 결과가 없습니다.", 
    });
    
	//2025-01-15 추가(검사값 수정)
	function dayPrintCheckCntSet(deviceCode, lotDate, pumCode, checkCnt){
		$.ajax({
			url:"/transys/work/dayPrint/checkCntSet",
			type:"post",
			dataType:"json",
			data:{
				"deviceCode":deviceCode,
				"lotDate":lotDate,
				"pumCode":pumCode,
				"checkCnt":checkCnt
			},
			success:function(result){
//				console.log(result);
//				getWorkDataPrintList();
//				table.replaceData();
			}
		});
		
	}
    
    // 검색 버튼 클릭 이벤트
    document.getElementById("searchbtn").addEventListener("click", function() {
    	getWorkDataPrintList();
    });

	function getWorkDataPrintList(){
        // 선택한 날짜와 설비명 가져오기
        selectedDate = $("#to_date").val();  // selectedDate를 글로벌 변수로 설정
        var selectedHogi = $("#placename").val() || ""; // 설비명이 비어있을 경우 빈 문자열로 설정
     
        // Ajax 요청
        $.ajax({
            url: "/transys/work/dayPrint/list", 
            method: "POST",
            data: {
                p_DATE: selectedDate // 전달할 날짜
            },
            success: function(response) {
                // 서버 응답에서 data 배열만 추출하여 Tabulator에 전달
                table.replaceData(response.data); 
                document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + response.data.length;
//                console.log("서버에서 받아온 데이터:", response.data);
            },
            error: function() {
                alert("데이터를 가져오는 데 실패했습니다.");
            }
        });
	}
    
 // 페이지 로딩 시 자동으로 하루 전 날짜로 설정
    $(document).ready(function() {
        var now = new Date();
        now.setDate(now.getDate() - 1);  // 하루 전 날짜로 설정

        var y = now.getFullYear();
        var m = paddingZero(now.getMonth() + 1);
        var d = paddingZero(now.getDate());  // 하루 전 날짜의 일자

        // 해당 날짜로 설정 (년-월-일 형식)
        $("#to_date").val(y + "-" + m + "-" + d);
        $("#to_date").val("2025-01-22");
        // 페이지 로드 시 자동으로 검색 버튼 클릭
//        $("#searchbtn").trigger("click"); // 로드되면 자동으로 검색 실행
        getWorkDataPrintList();
    });

    // 2자리 숫자 처리 함수 (1자리 수인 경우 앞에 0을 붙여서 두 자리를 맞춤)
    function paddingZero(num) {
        return num < 10 ? "0" + num : num;
    }


 // 엑셀 다운로드 버튼 클릭 이벤트
    $("#excelBtn").on("click", function () {
    	//2025-02-26변경
//		table.print("active", true, {columnGroups:false});
//    	table.print(false, true);
//		console.log(table.getData());
//		console.log(typeof table.getData());

		var printData = table.getData();
		
		var objParams = {
			"printList":printData
		};

		var jsonData = JSON.stringify(objParams);
		jQuery.ajaxSettings.traditional = true;
		
        $.ajax({
            url: "/transys/work/dayPrint/excelDownloadJson",
            type: "post",
            dataType: "json",
            data:{"jsonData" : jsonData},
            success: function (result) {
//                console.log(result);

        
                alert("D:\\생산일지\\일간생산일지 저장 완료되었습니다.");
            },
            error: function (xhr, status, error) {
               
                alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
//                console.error("Error:", error);
            }
        });

    });

</script>




<form name="parmForm" method="post">
    <input type="hidden" id="chk1" name="chk1"/>
    <input type="hidden" id="tdate1" name="tdate1"/>
    <input type="hidden" id="pcode1" name="pcode1"/>
</form>
</body>
</html>