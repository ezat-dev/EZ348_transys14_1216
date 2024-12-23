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
            <b style="font-size:15pt;">경보</b> / <label style="font-size:15pt;">발생경보조회</label> 
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
                
                <label style="margin-left: 15px;"> 시작일자 : 
                    <input type="text" class="daySet" id="from_date" 
                           name="from_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" 
                           placeholder="2024-11-01" />
                </label>
                
                <label style="margin-left: 15px;"> 종료일자 : 
                    <input type="text" class="daySet" id="to_date" 
                           name="to_date" style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" 
                           placeholder="2024-11-08" />
                </label>

                <button id="searchbtn" style="margin-left: 60px;">조회</button>
                <button id="excelBtn"style="margin-left: 20px;">엑셀</button>
            </div>
        </fieldset>

        <div id="table_file">
            <div class="countDATA">발생된 경보 수 : </div>
                   <div id="cate_list" style="width: 74%; margin-left:100px;"></div>
        </div>
    </div>

<script>
$(document).ready(function() {
    var today = new Date();
    var lastWeek = new Date(today);
    lastWeek.setDate(today.getDate() - 7); 

    function formatDate(date) {
        var year = date.getFullYear();
        var month = ('0' + (date.getMonth() + 1)).slice(-2); 
        var day = ('0' + date.getDate()).slice(-2);
        return year + '-' + month + '-' + day;
    }

    // 시작일자 7일 전, 종료일자 오늘 날짜로 설정
    $("#from_date").val(formatDate(lastWeek));
    $("#to_date").val(formatDate(today));

    $("#searchbtn").click(); 
});

var table = new Tabulator("#cate_list", {
    layout: "fitColumns",
    columns: [
        {title: "설비명", field: "alarmGroupLabel", width: 260, hozAlign: "center"},
        {title: "PLC ADDR", field: "tagName", width: 260, hozAlign: "center"},
        {title: "경보내용", field: "alarmDesc", width: 410, hozAlign: "center"},
        {title: "발생시간", field: "time", width: 250, hozAlign: "center"},
        {title: "해제시간", field: "lead_alarmtime", width: 250, hozAlign: "center"}
    ],
    placeholder: "검색 결과가 없습니다.",
    data: []  
});

$("#searchbtn").click(function() {
    console.log("검색 버튼 클릭됨");
    getProduct();
});

function getProduct() {
    // 서버로 전송할 데이터 콘솔에 출력
    console.log("Sending data to server:", {
        alarmgroup: $("#placename").val(),
        sDate: $("#from_date").val(),
        eDate: $("#to_date").val()
    });

    // 기존 데이터 지우기
    table.clearData();

    $.ajax({
        type: "POST",
        url: "/transys/alarm/alarmList/list",
        cache: false,
        dataType: "json",
        data: {
            'alarmgroup': $("#placename").val(),
            'sDate': $("#from_date").val(),
            'eDate': $("#to_date").val()
        },
        success: function(rsJson) {
            console.log("서버 응답:", rsJson);  // 서버에서 받은 전체 응답을 출력
            if (rsJson && rsJson.status === "success") {
                var rsAr = rsJson.data;
                var n_cnt = rsAr.length;

                $(".countDATA").text("발생된 경보 수 : " + n_cnt);

                // 서버에서 받은 데이터 콘솔에 출력
                console.log("서버에서 받은 데이터:", rsAr);

                // 데이터를 테이블에 맞게 변환
                table.setData(rsAr.map(function(item, index) {
                    return {
                        no: index + 1,
                        alarmGroupLabel: item.alarmGroupLabel, 
                        tagName: item.tagName,  
                        alarmState: item.alarmState || '상태 미정',  
                        alarmDesc: item.alarmDesc || '경보 내용 없음',  
                        time: item.time || '시간 미정',  
                        lead_alarmtime: item.lead_alarmtime || '해제 시간 미정'  
                    };
                }));
            } else {
                $(".countDATA").text("발생된 경보 수 : 0");
            }
        },

        error: function(req, status) {
            if (req.status == 0 || status === "timeout") {
                alert("네트워크 연결 확인 후 다시 시도해주세요.");
            } else {
                alert("처리중 예외가 발생하였습니다. 브라우저를 완전히 종료 후 다시 시도해 보시기 바랍니다.");
            }
        }
    });
}

// 엑셀 다운로드 버튼 클릭 이벤트
$("#excelBtn").on("click", function(){
    var selectedDate = $("#to_date").val().replace(/-/g, "").slice(0, 6); // YYYYMM 형식으로 변경
    var selectedHogi = $("#placename").val() || ""; // 설비명은 공백으로 처리

    console.log("엑셀 보내지는 날:", selectedDate);
    console.log("엑셀 호기:", selectedHogi);

    $.ajax({
        url: "/transys/alarm/alarmlist/excelDownload",
        type: "post",
        dataType: "json",
        data: {
            'alarmgroup': $("#placename").val(),
            'sDate': $("#from_date").val(),
            'eDate': $("#to_date").val()
        },
        success: function(result) {
            console.log(result);
        },
        error: function() {
            alert("엑셀 다운로드에 실패했습니다.");
        }
    });  
});
</script>



</body>




</html>
