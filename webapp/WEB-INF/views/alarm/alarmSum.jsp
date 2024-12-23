<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>경보</title>
<jsp:include page="../include/pluginpage.jsp"/>


<style>

	body {
			text-align: center;
		}

	hr{
		width: 95%;
		margin: 10px 2.5% 2% 2.5%;
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
	
	#to_date{
		width: 120px;
		height: 25px;
	}
	
	#from_date{
		width: 120px;
		height: 25px;
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
		font-size: 15pt;
		margin-bottom: 0px;
		padding-left: 2%;
		text-align: left;
	}
	
	.input_d{
		font-size: 14pt;
		font-weight: 600;
		color: black;
	}
	
	#placename{
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

	.text-center{
		font-size: 16px;
	}
	
	.countDATA{
		/* 조회된 데이터 수 */
		width: 100%;

		color: black;
		margin-left: 400px;
		margin-bottom: 3px;
		font-size:15pt;
	}
	
	#table_file{
		width: 100%;
		text-align: center;
		margin: auto;
		max-height: 40%;
		overflow:auto;
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
		height: 900px;
		width: 100%;
		margin-left: 100px;
	}
	
	#table_file::-webkit-scrollbar { display:none; }
	/* 테이블 스크롤 없애기 끝 */
	/* alert창 */

</style>

</head>

<body data-offset="60" data-target=".navbar">
    <div id="menu_bar">
        <jsp:include page="../include/AheaderPopup.jsp"/>
    </div>

    <div id="contents">
        <div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;">
            <b style="font-size:15pt;">경보</b> / <label style="font-size:15pt;">발생경보누계</label> 
        </div>
        <hr>

        <fieldset class="list_input">
            <legend>검색조건</legend>
            <div class="input_d">
                <label> 설비명 : 
                    <select name="placename" id="placename"style="font-weight: 100; text-align: center; width: 150px;">
                         <option value="">전체</option>
                        <option value="CCF1_ALARM">1 호기</option>
                        <option value="CCF1_ALARM">2 호기</option>
                        <option value="CCF1_ALARM">3 호기</option>
                        <option value="CCF1_ALARM">4 호기</option>
                        <option value="CCF1_ALARM">5 호기</option>
                        <option value="CCF1_ALARM">6 호기</option>
                        <option value="CCF1_ALARM">7 호기</option>
                        <option value="CCF1_ALARM">공통 1 호기</option>
                        <option value="CCF1_ALARM">공통 2 호기</option>
                        
                    </select> 
                </label>
                
                 <label style="margin-left: 15px;"> 작업년도 : 
					    <input type="text" class="yearSet" id="to_date" name="to_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" placeholder=""/>
					</label>

                    <button id="searchbtn" style="margin-left: 60px;">조회</button>
                    <button id="excelBtn"style="margin-left: 20px;">엑셀</button>
            </div>
        </fieldset>

         	<div id="table_file">
                <div class="countDATA">조회된 데이터 수 : </div>
                <div id="tabulator-table"style="width: 90%;margin-left:5px;" ></div> <!-- Tabulator가 테이블을 렌더링할 div -->
            </div>
    </div>

 <script>

 var tableData = []; 

 var table = new Tabulator("#tabulator-table", {
	    height: 650,
	    data: tableData, 
	    layout: "fitColumns",
	    selectable: true,    //로우 선택설정
	    tooltips: true,
	    selectableRangeMode: "click",
	    reactiveData: true,
	    headerHozAlign: "center", // 헤더 중앙 정렬
	    columns: [
	        { title: "설비명", field: "alarmGroupLabel", width: 88, hozAlign: "center" },
	        { title: "PLC주소", field: "tagName", width: 180, hozAlign: "center" },
	        { title: "경보내용", field: "alarmDesc", width: 230, hozAlign: "center" },         
	        { title: "1월", field: "m01", width: 100, hozAlign: "center" },
	        { title: "2월", field: "m02", width: 100, hozAlign: "center" },
	        { title: "3월", field: "m03", width: 100, hozAlign: "center" },
	        { title: "4월", field: "m04", width: 100, hozAlign: "center" },
	        { title: "5월", field: "m05", width: 100, hozAlign: "center" },
	        { title: "6월", field: "m06", width: 100, hozAlign: "center" },
	        { title: "7월", field: "m07", width: 100, hozAlign: "center" },
	        { title: "8월", field: "m08", width: 100, hozAlign: "center" },
	        { title: "9월", field: "m09", width: 100, hozAlign: "center" },
	        { title: "10월", field: "m10", width: 100, hozAlign: "center" },
	        { title: "11월", field: "m11", width: 100, hozAlign: "center" },
	        { title: "12월", field: "m12", width: 100, hozAlign: "center" },
	    ],
	    placeholder: "검색 결과가 없습니다.", 
	});


 $(document).ready(function() {
     var now = new Date();
     var y = now.getFullYear();  
     $("#to_date").val(y);

     // 자동으로 검색 수행
     $("#searchbtn").click();
 });


 $("#searchbtn").click(function() {
   
     var time = $("#to_date").val();
     var alarmgroup = $("#placename").val() || ""; 

  

     $.ajax({
         url: "/transys/alarm/alarmSum/list", 
         method: "POST",
         data: {
        	 time: time,
        	 alarmgroup: alarmgroup 
         },
         success: function(data) {
             table.setData(data); 
             document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + data.length;
             console.log("서버에서 받아온 데이터:", data);
         },
         error: function() {
             alert("데이터를 가져오는 데 실패했습니다.");
         }
     });
 });

 // 엑셀 다운로드 버튼 클릭 이벤트
 $("#excelBtn").on("click", function(){
     var selectime = $("#to_date").val().replace(/-/g, "").slice(0, 6); // YYYYMM 형식으로 변경
     var selectalarmgroup = $("#placename").val() || ""; // 설비명은 공백으로 처리

     
     $.ajax({
         url: "/transys/alarm/alarmSum/excelDownload",
         type: "post",
         dataType: "json",
         data: {
        	 time: selectime,
        	 alarmgroup: selectalarmgroup 
         },
         success: function(data) {
        	    table.setData(data); // Tabulator 테이블에 데이터를 설정
        	    document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + data.length;
        	    console.log("서버에서 받아온 데이터:", data); // 서버에서 받아온 데이터 콘솔에 출력
        	},

         error: function() {
             alert("엑셀 다운로드에 실패했습니다.");
         }
     });


     console.log("서버로 전송할 값:", {
    	 time: selectime,
    	 alarmgroup: selectalarmgroup 
     });
 });

	
</script>


</body>




</html>
