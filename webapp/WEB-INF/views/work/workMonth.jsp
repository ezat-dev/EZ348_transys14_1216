<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>작업실적 월보</title>

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
            margin: 1% 5%;
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
        }
        #placename {
            font-size: 14pt;
            text-align: center;
            font-weight: 700;
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
                <b style="font-size: 15pt;">작업실적</b> / <label style="font-size: 14pt;">작업월보</label>
            </div>
            <hr>
            <fieldset class="list_input">
                <legend style="font-size: 15pt;">검색조건</legend>
                <div class="input_d">
                   <label> 설비명 : 
					    <select name="placename" id="placename">
					     	<option value="">전체</option>
					        <option value="1">1호기</option>
					        <option value="2">2호기</option>
					        <option value="3">3호기</option>
					        <option value="4">4호기</option>
					    </select>
					</label>

                    <label style="margin-left: 15px;"> 작업일자 : 
					    <input type="text" class="monthSet" id="to_date" name="to_date" 
					    style="font-size: 14pt; font-weight: 700; text-align: center; width: 150px;" placeholder=""/>
					</label>

                    <button id="searchbtn" style="margin-left: 100px;">조회</button>
             
                     <button id="excelBtn">엑셀</button>
                    <button id="previewbtn" style="width: 200px;">인쇄 전 미리보기</button>
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

    var table = new Tabulator("#tabulator-table", {
        height: 650,
        data: tableData, 
        layout:"fitColumns",
        selectable:true,    //로우 선택설정
        tooltips:true,
        selectableRangeMode:"click",
        reactiveData:true,
        headerHozAlign:"center",
        columns: [
            { title: "품명코드", field: "pumcode", width: 345, hozAlign:"center"},
            { title: "품명", field: "pumname", width: 345, hozAlign:"center"},
            { title: "기종", field: "gijong", width: 345, hozAlign:"center"},
            { title: "dobun", field: "dobun", width: 340, hozAlign:"center"},
            { title: "추출량(Tray)", field: "totalout", width: 340, hozAlign:"center"},
        ],
        placeholder: "검색 결과가 없습니다.", 
    });

    // 검색 버튼 클릭 이벤트
    document.getElementById("searchbtn").addEventListener("click", function() {
        // 선택한 날짜와 설비명 가져오기
        var selectedDate = $("#to_date").val().replace(/-/g, "").slice(0, 6); // YYYYMM 형식으로 변경
        var selectedHogi = $("#placename").val() || ""; // 설비명은 공백으로 처리

        // 콘솔에 출력
        console.log("선택한 날짜:", selectedDate);
        console.log("선택한 설비명:", selectedHogi);

        // Ajax 요청
        $.ajax({
            url: "/transys/work/workMonth/list", 
            method: "POST",
            data: {
                date: selectedDate, // 전달할 YYYYMM 형식 날짜
                placename: selectedHogi // 전달할 설비명
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

        // Ajax 요청에 사용될 매개변수 출력
        console.log("서버로 전송할 값:", {
            date: selectedDate,
            placename: selectedHogi
        });
    });

 

    // 페이지 로딩 시 자동으로 오늘 날짜로 설정 (기본값: 해당 월의 첫날)
    $(document).ready(function() {
        var now = new Date();
        var y = now.getFullYear();
        var m = paddingZero(now.getMonth() + 1);
        // 해당 월의 첫날로 설정
        $("#to_date").val(y + "-" + m + "-01"); // 년-월-01 형식으로 설정

        // 페이지 로드 시 자동으로 검색 버튼 클릭
        $("#searchbtn").trigger("click"); // 로드되면 자동으로 검색 실행
    });

    // 2자리 숫자 처리 함수 (1자리 수인 경우 앞에 0을 붙여서 두 자리를 맞춤)
    function paddingZero(num) {
        return num < 10 ? "0" + num : num;
    }


  //엑셀다운로드 - 테스트 후에는 출력
	$("#excelBtn").on("click", function(){
		 var selectedDate = $("#to_date").val().replace(/-/g, "").slice(0, 6); // YYYYMM 형식으로 변경
	     var selectedHogi = $("#placename").val() || ""; // 설비명은 공백으로 처리

		 console.log("엑셀 보내지는 날:", selectedDate);
		 console.log("엑셀 호기:", selectedHogi);
		$.ajax({
			url:"/transys/work/workMonth/excelDownload",
			type:"post",
			dataType:"json",
			data:{
				date: selectedDate, // 전달할 YYYYMM 형식 날짜
                placename: selectedHogi // 전달할 설비명
			},
			success:function(result){
				console.log(result);
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
