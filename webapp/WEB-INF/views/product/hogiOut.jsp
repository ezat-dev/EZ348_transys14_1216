<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/pluginpage.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>처리품관리</title>

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
		width: 110px;
		height: 35px;
		margin-left: 5px;
		border: 1px solid black; 
		color: firebrick;
	}
	
		
	div > button:hover {     
		background: firebrick;
		border: 1px solid firebrick;
		color: white; 
	}

	#contents{
		color: black;
	}
	
	.release_btn{
		margin-top: 9%;
	}
	
	.hogi{
		margin-bottom: 4%;
		font-size:15pt;
		font-weight:700;
	}
</style>



</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">

	
	<div id="body2">
		
	<div id="contents">
		<!-- <div style="color: black; font-size: 20px; padding-top: 2%;"> &lt;투입 LIST&gt; </div> -->
		<div style="color: black; font-size: 14px; padding-top: 5%; margin-left: 2.5%; text-align: left;"> <b style="font-size:15pt;">처리품관리</b> / <label style="font-size:15pt;">투입 LIST - 출고요청</label> </div>
		<hr>
		
		<div class="release_btn">
			<div class="hogi">침탄 1호기 <button id="hogi1_out" type="button"><b>출고요청</b></button> </div>
			<div class="hogi">침탄 2호기 <button id="hogi2_out" type="button"><b>출고요청</b></button> </div>
			<div class="hogi">침탄 3호기 <button id="hogi3_out" type="button"><b>출고요청</b></button> </div>
			<div class="hogi">침탄 4호기 <button id="hogi4_out" type="button"><b>출고요청</b></button> </div>
		</div>
	</div>
</div>
</div>
	<script>
	
	//로드

	
	
		
		$("#hogi1_out").on("click", function() {
	    $.ajax({
	        url: "/transys/product/dayList/popup/insert",
	        type: "post",
	        dataType: "text",
	        data: { "device_code": "1" },
	        success: function(result) {
	            alert("1호기 출고 요청 성공");
	            window.close();
	        },
	        error: function(xhr, status, error) {
	            console.error("1호기 출고 요청 실패:", status, error);
	            alert("1호기 출고 요청 실패: " + error);
	        }
	    });
	});
	
	$("#hogi2_out").on("click", function() {
	    $.ajax({
	        url: "/transys/product/dayList/popup/insert",
	        type: "post",
	        dataType: "text",
	        data: { "device_code": "2" },
	        success: function(result) {
	            alert("2호기 출고 요청 성공");
	            window.close();
	        },
	        error: function(xhr, status, error) {
	            console.error("2호기 출고 요청 실패:", status, error);
	            alert("2호기 출고 요청 실패: " + error);
	        }
	    });
	});
	
	$("#hogi3_out").on("click", function() {
	    $.ajax({
	        url: "/transys/product/dayList/popup/insert",
	        type: "post",
	        dataType: "text",
	        data: { "device_code": "3" },
	        success: function(result) {
	            alert("3호기 출고 요청 성공");
	            window.close();
	        },
	        error: function(xhr, status, error) {
	            console.error("3호기 출고 요청 실패:", status, error);
	            alert("3호기 출고 요청 실패: " + error);
	        }
	    });
	});
	
	$("#hogi4_out").on("click", function() {
	    $.ajax({
	        url: "/transys/product/dayList/popup/insert",
	        type: "post",
	        dataType: "text",
	        data: { "device_code": "4" },
	        success: function(result) {
	            alert("4호기 출고 요청 성공");
	            window.close();
	        },
	        error: function(xhr, status, error) {
	            console.error("4호기 출고 요청 실패:", status, error);
	            alert("4호기 출고 요청 실패: " + error);
	        }
	    });
	});

	</script>

</body>
</html>
