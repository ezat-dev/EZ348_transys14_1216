<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jQuery -->
<script type="text/javascript" src="/transys/js/jquery-3.7.1.min.js"></script>

<!-- Tabulator -->
<script type="text/javascript" src="/transys/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/transys/css/tabulator/tabulator_simple.css">

<!-- HighChart -->
<script type="text/javascript" src="/transys/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/transys/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/transys/js/highchart/export-data.js"></script>
<!--  
<script type="text/javascript" src="/donghwa/js/highchart/data.js"></script>
-->

<!-- Air Datepicker -->
<script type="text/javascript" src="/transys/js/airdatepicker/datepicker.min.js"></script>
<script type="text/javascript" src="/transys/js/airdatepicker/datepicker.ko.js"></script>
<link rel="stylesheet" href="/transys/css/airdatepicker/datepicker.min.css"> 

<style>
	

.row_select{
	background-color:#9ABCEA !important;
}
	
</style>
	
<script>

function paddingZero(value){
	var rtn = "";

	if(value < 10){
		rtn = "0"+value;
	}else{
		rtn = value;
	}

	return rtn;
}


$(function() {

	//날짜 : 일

	 $(".daySet").datepicker({
    	language: 'ko',
    	autoClose: true,
    }); 
	    
	//날짜 : 월
   $(".monthSet").datepicker({
	    language: 'ko',           // 한국어 설정
	    view: 'months',           // 월만 표시
	    minView: 'months',        // 월만 선택 가능
	    dateFormat: 'yyyy-mm',    // 연도-월 형식 지정
	    autoClose: true,          // 월 선택 후 자동 닫힘
	});
   

    //날짜 : 년
	 $(".yearSet").datepicker({
	  language: 'ko',
      view: 'years',          // 연도만 표시
      minView: 'years',       // 연도만 표시하여 날짜 선택 비활성화
      dateFormat: 'yyyy',     // 연도 형식 지정
      autoClose: true,        // 연도 선택 후 자동 닫힘
      language: 'ko'          // 한국어 설정
  });
});


</script>
