<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Utility</title>
<jsp:include page="../include/pluginpage.jsp"/>

<style>

	body {
			text-align: center;
		}

	hr{
		width: 95%;
		margin: 10px 2.5% 2% 2.5%;
	}
	
	#month{
		width: 120px;
		height: 25px;
		text-align: center;
	}
	
	#menu_bar{
		padding-top: 3%;
		background: #123478;
	}
	
	.list_input{
		text-align: center;
		margin: 1% 5% 2% 5%;
		padding: 10px 0%;
		width: 90%;
		border: 3px solid #F4EFEA;
	}
	
	legend{
		border: 0px;
		width: 7%;
		font-size: 17px;
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

	/* 작업일보 버튼 */
	div > button{
		width: 130px;
		font-weight: 700;
		margin-left: 5px;
		border: 1px solid black; 
		color: #123478;
		font-size:14pt;
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
		text-align: center;
		color: black;
		margin-bottom: 3px;
		font-size:15pt;
	}
	
	#auto_cal{
		/* 자동 가동시간 div */
		padding-bottom: 4px;
		border-bottom: 1px dotted #123478;
	}
	
	.mau_time{
		/* 수동 가동시간 div */
		text-align: left;
		margin-bottom: 10px;
	}
	
	.no_time{
		/* 자동 가동시간 계산 */
		text-align: left;
	}
	
	.set_time>label{
		/* 사이클 변경 시간 */
		width: 100px;
		color: red;
	}
	
	#table_file{
		width: 21%;
		text-align: center;
		float:left;
		margin: 0px 2px 0px 0px;
		max-height: 40%;
		overflow:auto;
	}
	
	#LNG02{
		width: 21%;
		color: black;
		float:none;
		margin-right: 2.5%;
		max-height: 40%;
		display:inline-block;
		overflow:auto;
	}
	
	#LNG03{
		width: 21%;
		color: black;
		float:none;
		margin-left: 2.5%;
		max-height: 40%;
		display:inline-block;
		overflow:auto;
	}
	
	#LNG04{
		width: 21%;
		color: black;
		float:right;
		margin: 0% 0% 0% 5px;
		max-height: 40%;
		display:inline-block;
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
	
	#LNG02{
		-ms-overflow-style:none;
		height: 550px;
	}
	
	#LNG02::-webkit-scrollbar { display:none; }
	
	#LNG03{
		-ms-overflow-style:none;
		height: 550px;
	}
	
	#LNG03::-webkit-scrollbar { display:none; }
	
	#LNG04{
		-ms-overflow-style:none;
		height: 550px;
	}
	
	#LNG04::-webkit-scrollbar { display:none; }
	/* 테이블 스크롤 없애기 끝 */
	/* alert창 */

</style>





</head>

<body data-offset="60" data-target=".navbar">
		<div id="menu_bar">
			<jsp:include page="../include/managePopup.jsp"/>
		</div>


	
	<div id="contents">
		<!-- <div style="color: black; font-size: 20px; padding-top: 2%;"> &lt;월별 일자별 LNG 사용량 집계&gt; </div> -->
		<div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;"> <b style="font-size:15pt;">Utility</b> / <label style="font-size:14pt;">월별 일자별 LNG 소요량 집계</label> </div>
		<hr>
		
		<fieldset class="list_input">
			<legend>검색조건</legend>
			<div class="input_d">
				 <label style="margin-left: 15px;font-size: 19px;font-weight: 700;"> 조회설정(월) : 
				 <input type="text"style="font-size: 14pt; font-weight: 700; height:25px; text-align: center; width: 150px;" id="monthPicker" name="month" class="monthSet" placeholder="월 선택"/> </label>
				<!-- <button id="edit_name" hidden><i class="fa fa-pencil" aria-hidden="true"></i></button> -->
				
				 <button id="searchbtn" style="margin-left: 100px; height:34px;">조회</button>
			</div>
		</fieldset>
	
		<div id="uptime_div" style="width: 95%; text-align: center; margin: 0 auto;">
				<div id="table_file" >
					<div class="countDATA">침탄로 1호기</div>
				  <div id="cate_list01"></div>
				</div>
				
				<div id="LNG02">
					<div class="countDATA">침탄로 2호기</div>
			
				  <div id="cate_list02"></div>
				</div>
				
				<div id="LNG03">
					<div class="countDATA">침탄로 3호기</div>
			
				  <div id="cate_list03"></div>
				</div>
				
				<div id="LNG04">
					<div class="countDATA">침탄로 4호기</div>
			
				   <div id="cate_list04"></div>
				</div>
				
		</div>
			
		</div>	
		
<script>
   
// 현재 년도와 월을 가져오는 함수
function setCurrentMonth() {
    var currentDate = new Date();
    var currentYear = currentDate.getFullYear(); 
    var currentMonth = currentDate.getMonth() + 1;
    var formattedMonth = currentYear + "-" + (currentMonth < 10 ? '0' + currentMonth : currentMonth); 
    $("#monthPicker").val(formattedMonth);  // 월 선택 input에 현재 월을 설정
}

$(document).ready(function() {
    setCurrentMonth(); // 페이지 로드 시 현재 년도와 월 설정

    // Tabulator로 테이블 초기화
    var table1 = new Tabulator("#cate_list01", {
        layout: "fitColumns",
        columns: [
            {title: "번호", field: "id", width: 70, hozAlign: "center"},
            {title: "작성시간", field: "WRITEDAYTIME", hozAlign: "center"},
            {title: "LNG 합계", field: "LNG_SUM", hozAlign: "center"},
        ],
        placeholder: "데이터가 없습니다." 
    });

    var table2 = new Tabulator("#cate_list02", {
        layout: "fitColumns",
        columns: [
            {title: "번호", field: "id", width: 70, hozAlign: "center"},
            {title: "작성시간", field: "WRITEDAYTIME", hozAlign: "center"},
            {title: "LNG 합계", field: "LNG_SUM", hozAlign: "center"},
        ],
        placeholder: "데이터가 없습니다." 
    });

    var table3 = new Tabulator("#cate_list03", {
        layout: "fitColumns",
        columns: [
            {title: "번호", field: "id", width: 70, hozAlign: "center"},
            {title: "작성시간", field: "WRITEDAYTIME", hozAlign: "center"},
            {title: "LNG 합계", field: "LNG_SUM", hozAlign: "center"},
        ],
        placeholder: "데이터가 없습니다." 
    });

    var table4 = new Tabulator("#cate_list04", {
        layout: "fitColumns",
        columns: [
            {title: "번호", field: "id", width: 70, hozAlign: "center"},
            {title: "작성시간", field: "WRITEDAYTIME", hozAlign: "center"},
            {title: "LNG 합계", field: "LNG_SUM", hozAlign: "center"},
        ],
        placeholder: "데이터가 없습니다." 
    });

    // '조회' 버튼 클릭 이벤트
    $('#searchbtn').click(function() {
        var selectedMonth = $("#monthPicker").val(); 
        var yearMonthArray = selectedMonth.split("-");
        var lngYear = parseInt(yearMonthArray[0]);
        var lngMonth = parseInt(yearMonthArray[1]);
        console.log("선택된 년: " + lngYear);
        console.log("선택된 월: " + lngMonth);

        // 데이터를 가져오는 함수 호출
        LNGList01(lngYear, lngMonth);

        setTimeout(function() {
            LNGList02(lngYear, lngMonth);
        }, 100);

        setTimeout(function() {
            LNGList03(lngYear, lngMonth);
        }, 200);

        setTimeout(function() {
            LNGList04(lngYear, lngMonth);
        }, 300);
    });

    // 각 장비에 대한 데이터 요청 함수들
    function LNGList01(lngYear, lngMonth) {
        $.ajax({
            type: "POST",
            url: "/transys/util/lngMonth/list",
            dataType: "json",
            data: {'deviceCode': '1', 'lngYear': lngYear, 'lngMonth': lngMonth},
            success: function(rsJson) {
                if (rsJson && rsJson.status == "ok") {
                    var rsAr = rsJson.rows;
                    var tableData = rsAr.map(function(item, index) {
                        return { id: index + 1, WRITEDAYTIME: item.WRITEDAYTIME, LNG_SUM: item.LNG_SUM };
                    });
                    table1.setData(tableData); // Tabulator에 데이터 추가
                }
            },
            error: function(req, status) {
                console.error("Error:", req, status);
            }
        });
    }

    function LNGList02(lngYear, lngMonth) {
        $.ajax({
            type: "POST",
            url: "/transys/util/lngMonth/list",
            dataType: "json",
            data: {'deviceCode': '2', 'lngYear': lngYear, 'lngMonth': lngMonth},
            success: function(rsJson) {
                if (rsJson && rsJson.status == "ok") {
                    var rsAr = rsJson.rows;
                    var tableData = rsAr.map(function(item, index) {
                        return { id: index + 1, WRITEDAYTIME: item.WRITEDAYTIME, LNG_SUM: item.LNG_SUM };
                    });
                    table2.setData(tableData);
                }
            },
            error: function(req, status) {
                console.error("Error:", req, status);
            }
        });
    }

    function LNGList03(lngYear, lngMonth) {
        $.ajax({
            type: "POST",
            url: "/transys/util/lngMonth/list",
            dataType: "json",
            data: {'deviceCode': '3', 'lngYear': lngYear, 'lngMonth': lngMonth},
            success: function(rsJson) {
                if (rsJson && rsJson.status == "ok") {
                    var rsAr = rsJson.rows;
                    var tableData = rsAr.map(function(item, index) {
                        return { id: index + 1, WRITEDAYTIME: item.WRITEDAYTIME, LNG_SUM: item.LNG_SUM };
                    });
                    table3.setData(tableData);
                }
            },
            error: function(req, status) {
                console.error("Error:", req, status);
            }
        });
    }

    function LNGList04(lngYear, lngMonth) {
        $.ajax({
            type: "POST",
            url: "/transys/util/lngMonth/list",
            dataType: "json",
            data: {'deviceCode': '4', 'lngYear': lngYear, 'lngMonth': lngMonth},
            success: function(rsJson) {
                if (rsJson && rsJson.status == "ok") {
                    var rsAr = rsJson.rows;
                    var tableData = rsAr.map(function(item, index) {
                        return { id: index + 1, WRITEDAYTIME: item.WRITEDAYTIME, LNG_SUM: item.LNG_SUM };
                    });
                    table4.setData(tableData);
                }
            },
            error: function(req, status) {
                console.error("Error:", req, status);
            }
        });
    }

    // 페이지 로드 후 자동으로 조회 실행
    $('#searchbtn').click();
});
</script>

	

</body>
</html>
