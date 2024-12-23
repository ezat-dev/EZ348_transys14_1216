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
		}

	hr{
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
		height: 25px;
		border: 1px solid black; 
		color: #123478;
		font-size:14pt;
	}
	
		
	div > button:hover {     
		background: #798cb3;
		border: 1px solid #798cb3;
		color: white; 
	}

	.btn_list{
		/* 조회버튼 */
		margin-left: 250px;
	}

	.text-center{
		font-size: 14px;
	}
	
	#table_file{
		width: 95%;
		text-align: center;
		margin: auto;
		height: 950px;
    	white-space: nowrap; /* 테이블 공백 해제 (오버플로우) */
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
		height: 650px;
	}
	
	/*#table_file::-webkit-scrollbar { display:none; } */
	/* 테이블 스크롤 없애기 끝 */
	/* alert창 */

	#cate_list{
		border-collapse: collapse;
	}
    #cate_list {
        width: 95%; /* 전체 너비를 차지하도록 설정 */
        overflow-x: auto; /* 수평 스크롤 활성화 */
        margin-left:55px;
    }
	
	 .tabulator-paginator {
            display: flex;
            justify-content: center; /* 페이지 넘김 버튼을 가운데로 */
            margin-top: 14px; /* 테이블과의 간격 */
        }
	.row_top button {
	    width: 120px;
	    height: 30px;
	    border: 1px solid black; 
	    color: #123478;
	    margin-right: 10px; /* 버튼 간격 조정 */
	    font-size: 14pt;
	    font-weight: 700;
	}
	
	.row_top button:hover {     
	    background: #798cb3;
	    border: 1px solid #798cb3;
	    color: white; 
	}

/* 선택된 행의 스타일 */
.selected {
    background-color: #4d4d4d; /* 진한 회색 */
    color: white; /* 텍스트 색상 */
}


</style>





</head>
		<div id="menu_bar">
			<jsp:include page="../include/PheaderPopup.jsp"/>
		</div>
<body data-offset="60" data-target=".navbar" style="overflow-y:hidden">

<div id="wrap">
    <div id="body2">
        <div id="contents">
            <div style="color: black; font-size: 14px; padding-top: 1%; margin-left: 2.5%; text-align: left;">
                <b style="font-size:15pt;">처리품관리</b> / 
                <label style="font-size:14pt;">처리품 등록</label> 
            </div>
            <hr>
            <fieldset class="list_input">
                <legend>검색조건</legend>
                <div class="input_d">
                   
                    	<div class="row_data" style="display:inline-block; width:800px;">
					<div class="row_top">
					    <button id="searchBtn" onclick="fetchData();">조회</button>
					    <button id="addBtn">입력</button>
					    <button id="modifyBtn">수정</button>               
					    <button id="deleteBtn">삭제</button>
					    <button id="excelBtn">엑셀</button>
					
					</div>
					</div>
                </div>
            </fieldset>
            <div id="table_file">
                <div id="cate_list"></div> <!-- 타뷸레이터 테이블이 여기에 로드됩니다. -->
            </div>
        </div>
    </div>
</div>

<input type="text" id="del_pumcode" name="del_pumcode" style="display:none;" />

<script>
    var selectedRowData = null; // 선택된 행의 데이터를 저장할 변수

    var table = new Tabulator("#cate_list", {
    	   height:"640px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    tooltips:true,
		    selectableRangeMode:"click",
		    reactiveData:true,
		    headerHozAlign:"center",
        columns: [
            { title: "NO", field: "idx", hozAlign: "center", width: 80 },
            { title: "품명 코드", field: "pumcode", hozAlign: "center", width: 200 },
            { title: "품명", field: "pumname", hozAlign: "center", width: 200 },
            { title: "기종", field: "gijong", hozAlign: "center", width: 180 },
            { title: "품번", field: "dobun", hozAlign: "center", width: 200 },
            { title: "수량", field: "cnt", hozAlign: "center", width: 120 },
            { title: "CYCLE NO", field: "cycleno", hozAlign: "center", width: 120 },
            { title: "아지테이터 RPM", field: "agitate_rpm", hozAlign: "center", width: 150 },
            { title: "공통설비 투입 호기", field: "common_device", hozAlign: "center", width: 160 },
            { title: "등록일", field: "insertday", hozAlign: "center", width: 150 },
            { title: "수정일", field: "updateday", hozAlign: "center", width: 150 },
        ],
        rowClick: function(e, row) {
            selectedRowData = row.getData(); // 선택된 행의 데이터를 저장
            console.log("Row data:", selectedRowData);
			$("#cate_list .tabulator-tableHolder > .tabulator-table > .tabulator-row").each(function(index, item){
				
				if($(this).hasClass("row_select")){							
					$(this).removeClass('row_select');
					row.getElement().className += " row_select";
				}else{
					$("#cate_list div.row_select").removeClass("row_select");
					row.getElement().className += " row_select";	
				}
			});
        },
        movableColumns: true,
        resizableColumns: true,
    });

    table.setData([]);

    $(document).ready(function() {
        fetchData();

        $("#searchbtn").click(function() {
            fetchData();
        });

        // 삭제 버튼 클릭 시
        $("#deleteBtn").click(function() {
            if (selectedRowData && selectedRowData.dobun) {
                deleteRow(selectedRowData.dobun); // 선택된 행의 dobun 값을 전달
            } else {
                alert("삭제할 행을 선택하세요.");
            }
        });
    });

    function fetchData() {
        $.ajax({
            url: '/transys/product/productList/data',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            success: function(response) {
                console.log("받아온 데이터:", response);
                table.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("데이터 가져오기 실패:", error);
            }
        });
    }

    // 선택된 dobun 값을 서버로 보내서 삭제하는 함수
   function deleteRow(dobun) {
	   $.ajax({
		    url: '/transys/product/productList/delete',
		    type: 'POST',
		    contentType: 'application/json',
		    dataType: 'text', // 변경된 부분
		    data: JSON.stringify({ dobun: dobun }),
		    success: function(response) {
		        console.log("삭제 성공:", response);
		        alert(response); // 서버에서 반환한 메시지를 표시
		        fetchData(); // 데이터 새로 불러오기
		    },
		    error: function(xhr, status, error) {
		        console.error("삭제 실패:", error);
		        alert("삭제 실패했습니다.");
		    }
		});

}


   $("#addBtn").click(function() {
	    var url = "http://localhost:9090/transys/product/productAdd"; 
	    var width = 1200; 
	    var height = 900; 
	    var left = (screen.width / 2) - (width / 2); 
	    var top = (screen.height / 2) - (height / 2);

	    window.open(url, "_blank", "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left); 
	});

   $("#modifyBtn").click(function() {
	    if (selectedRowData && selectedRowData.dobun) {
	        var dobun = selectedRowData.dobun; 
	        var url = "http://localhost:9090/transys/product/productModify?dobun=" + dobun; 
	        var width = 1200; 
	        var height = 900; 
	        var left = (screen.width / 2) - (width / 2); 
	        var top = (screen.height / 2) - (height / 2);

	        window.open(url, "_blank", "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left); 
	    } else {
	        alert("수정할 행을 선택하세요.");
	    }
	});

	$("#excelBtn").on("click", function(){
	
		$.ajax({
			url:"/transys/product/productList/excelDownload",
			type:"post",
			dataType:"json",
			success: function(response) {
                console.log("받아온 데이터:", response);
                table.setData(response);
            },
            error: function(xhr, status, error) {
                console.error("데이터 가져오기 실패:", error);
            }
		});

	});



</script>


<form name=parmForm method="post">
    <input type="hidden" id="chk1" name="chk1"/>
    <input type="hidden" id="tdate1" name="tdate1" />
    <input type="hidden" id="pcode1" name="pcode1"/>
</form>

</body>
</html>
