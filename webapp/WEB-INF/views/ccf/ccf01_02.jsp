<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>경보</title>
	<jsp:include page="../include/pluginpage.jsp"/>
	<jsp:include page="../include/header.jsp"/>
	<link rel="stylesheet" href="/transys/css/ccf01_02/ccf01_02.css">
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   }
        .footer{
  	 margin-top:85px;
   }
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
   </style>
  <title>Document</title>
</head>
<body>
  <div class="t-overview-2">
    <div class="t-group-1">
      
      <div class="t-main"></div>
       </div>
       <div class="t-group-3">
    <img class="t-ccf-1" src="/transys/image/ccf01_02/ccf-10.png" />
      <div class="t-ccf-1-text">침탄로 1호기</div>
<!--      <div class="t-ccf-1-ship"></div>
     <div class="b-ccf-1-ship-text">1호기 출고요청</div> -->
      <!-- <img class="t-tong-0" src="/transys/image/ccf01_02/tong-00.png" />
      <div class="t-v-0-tong-1"></div>
      <div class="t-v-0-tong-2"></div>
      <div class="t-v-0-tong-3"></div> -->
      <img class="t-tong-1" src="/transys/image/ccf01_02/tong-10.png" />
      <div class="t-v-1-tong-1"></div>
      <div class="t-v-1-tong-2"></div>
      <div class="t-v-1-tong-3"></div>
      <img class="t-tong-2" src="/transys/image/ccf01_02/tong-20.png" />
      <div class="t-v-2-tong-1"></div>
      <div class="t-v-2-tong-2"></div>
      <div class="t-v-2-tong-3"></div>
      <img class="t-tong-3" src="/transys/image/ccf01_02/tong-30.png" />
      <div class="t-v-3-tong-1"></div>
      <div class="t-v-3-tong-2"></div>
      <div class="t-v-3-tong-3"></div>
      <img class="t-tong-4" src="/transys/image/ccf01_02/tong-40.png" />
      <div class="t-v-4-tong-1"></div>
      <div class="t-v-4-tong-2"></div>
      <div class="t-v-4-tong-3"></div>
      <img class="t-tong-5" src="/transys/image/ccf01_02/tong-50.png" />
      <div class="t-v-5-tong-1"></div>
      <div class="t-v-5-tong-2"></div>
      <div class="t-v-5-tong-3"></div>
      <img class="t-tong-6" src="/transys/image/ccf01_02/tong-60.png" />
      <div class="t-v-6-tong-1"></div>
      <div class="t-v-6-tong-2"></div>
      <div class="t-v-6-tong-3"></div>
      <img class="t-tong-7" src="/transys/image/ccf01_02/tong-70.png" />
      <div class="t-v-7-tong-1"></div>
      <div class="t-v-7-tong-2"></div>
      <div class="t-v-7-tong-3"></div>
      <img class="t-tong-8" src="/transys/image/ccf01_02/tong-80.png" />
      <div class="t-v-8-tong-1"></div>
      <div class="t-v-8-tong-2"></div>
      <div class="t-v-8-tong-3"></div>
      <img class="t-tong-9" src="/transys/image/ccf01_02/tong-90.png" />
      <div class="t-v-9-tong-1"></div>
      <div class="t-v-9-tong-2"></div>
      <div class="t-v-9-tong-3"></div>
      <img class="t-tong-10" src="/transys/image/ccf01_02/tong-100.png" />
      <div class="t-v-10-tong-1"></div>
      <div class="t-v-10-tong-2"></div>
      <div class="t-v-10-tong-3"></div>
      <img class="t-tong-11" src="/transys/image/ccf01_02/tong-110.png" />
      <div class="t-v-11-tong-1"></div>
      <div class="t-v-11-tong-2"></div>
      <div class="t-v-11-tong-3"></div>
      <img class="t-tong-12" src="/transys/image/ccf01_02/tong-120.png" />
      <div class="t-v-12-tong-1"></div>
      <div class="t-v-12-tong-2"></div>
      <div class="t-v-12-tong-3"></div>
      <img class="t-tong-13" src="/transys/image/ccf01_02/tong-130.png" />
      <div class="t-v-13-tong-1"></div>
      <div class="t-v-13-tong-2"></div>
      <div class="t-v-13-tong-3"></div>
      <img class="t-tong-14" src="/transys/image/ccf01_02/tong-140.png" />
      <div class="t-v-14-tong-1"></div>
      <div class="t-v-14-tong-2"></div>
      <div class="t-v-14-tong-3"></div>
      <img class="t-tong-15" src="/transys/image/ccf01_02/tong-150.png" />
      <div class="t-v-15-tong-1"></div>
      <div class="t-v-15-tong-2"></div>
      <div class="t-v-15-tong-3"></div>
      <img class="t-tong-16" src="/transys/image/ccf01_02/tong-160.png" />
      <div class="t-v-16-tong-1"></div>
      <div class="t-v-16-tong-2"></div>
      <div class="t-v-16-tong-3"></div>
      <img class="t-tong-17" src="/transys/image/ccf01_02/tong-170.png" />
      <div class="t-v-17-tong-1"></div>
      <div class="t-v-17-tong-2"></div>
      <div class="t-v-17-tong-3"></div>
      <img class="t-tong-18" src="/transys/image/ccf01_02/tong-180.png" />
      <div class="t-v-18-tong-1"></div>
      <div class="t-v-18-tong-2"></div>
      <div class="t-v-18-tong-3"></div>
      <img class="t-tong-19" src="/transys/image/ccf01_02/tong-190.png" />
      <div class="t-v-19-tong-1"></div>
      <div class="t-v-19-tong-2"></div>
      <div class="t-v-19-tong-3"></div>
      <img class="t-tong-20" src="/transys/image/ccf01_02/tong-200.png" />
      <div class="t-v-20-tong-1"></div>
      <div class="t-v-20-tong-2"></div>
      <div class="t-v-20-tong-3"></div>
      <img class="t-tong-21" src="/transys/image/ccf01_02/tong-210.png" />
      <div class="t-v-21-tong-1"></div>
      <div class="t-v-21-tong-2"></div>
      <div class="t-v-21-tong-3"></div>
      <img class="t-tong-22" src="/transys/image/ccf01_02/tong-220.png" />
      <div class="t-v-22-tong-1"></div>
      <div class="t-v-22-tong-2"></div>
      <div class="t-v-22-tong-3"></div>
      <img class="t-tong-23" src="/transys/image/ccf01_02/tong-230.png" />
      <div class="t-v-23-tong-1"></div>
      <div class="t-v-23-tong-2"></div>
      <div class="t-v-23-tong-3"></div>
      <img class="t-tong-24" src="/transys/image/ccf01_02/tong-240.png" />
      <div class="t-v-24-tong-1"></div>
      <div class="t-v-24-tong-2"></div>
      <div class="t-v-24-tong-3"></div>
      <img class="t-tong-25" src="/transys/image/ccf01_02/tong-250.png" />
      <div class="t-v-25-tong-1"></div>
      <div class="t-v-25-tong-2"></div>
      <div class="t-v-25-tong-3"></div>
      <img class="t-tong-26" src="/transys/image/ccf01_02/tong-260.png" />
      <div class="t-v-26-tong-1"></div>
      <div class="t-v-26-tong-2"></div>
      <div class="t-v-26-tong-3"></div>
      <img class="t-tong-27" src="/transys/image/ccf01_02/tong-270.png" />
      <div class="t-v-27-tong-1"></div>
      <div class="t-v-27-tong-2"></div>
      <div class="t-v-27-tong-3"></div>
      <img class="t-tong-28" src="/transys/image/ccf01_02/tong-280.png" />
      <div class="t-v-28-tong-1"></div>
      <div class="t-v-28-tong-2"></div>
      <div class="t-v-28-tong-3"></div>
      <!-- <img class="t-tong-29" src="/transys/image/ccf01_02/tong-290.png" />
      <div class="t-v-29-tong-1"></div>
      <div class="t-v-29-tong-2"></div>
      <div class="t-v-29-tong-3"></div> -->
      <img class="t-red-left-1" src="/transys/image/ccf01_02/red-left-10.png" />
      <img class="t-red-right-1" src="/transys/image/ccf01_02/red-right-10.png" />
      <img class="t-yellow-left-1" src="/transys/image/ccf01_02/yellow-left-10.png" />
      <img class="t-yellow-right-1" src="/transys/image/ccf01_02/yellow-right-10.png" />
      <img class="t-red-left-2" src="/transys/image/ccf01_02/red-left-20.png" />
      <img class="t-red-right-2" src="/transys/image/ccf01_02/red-right-20.png" />
      <img class="t-yellow-left-2" src="/transys/image/ccf01_02/yellow-left-20.png" />
      <img class="t-yellow-right-2" src="/transys/image/ccf01_02/yellow-right-20.png" />
      <img class="t-red-left-3" src="/transys/image/ccf01_02/red-left-30.png" />
      <img class="t-red-right-3" src="/transys/image/ccf01_02/red-right-30.png" />
      <img class="t-yellow-left-3" src="/transys/image/ccf01_02/yellow-left-30.png" />
      <img class="t-yellow-right-3" src="/transys/image/ccf01_02/yellow-right-30.png" />
      <img class="t-red-left-4" src="/transys/image/ccf01_02/red-left-40.png" />
      <img class="t-red-right-4" src="/transys/image/ccf01_02/red-right-40.png" />
      <img class="t-yellow-left-4" src="/transys/image/ccf01_02/yellow-left-40.png" />
      <img class="t-yellow-right-4" src="/transys/image/ccf01_02/yellow-right-40.png" />
      <img class="t-red-left-5" src="/transys/image/ccf01_02/red-left-50.png" />
      <img class="t-red-right-5" src="/transys/image/ccf01_02/red-right-50.png" />
      <img class="t-yellow-left-5" src="/transys/image/ccf01_02/yellow-left-50.png" />
      <img class="t-yellow-right-5" src="/transys/image/ccf01_02/yellow-right-50.png" />
      <img class="t-red-left-6" src="/transys/image/ccf01_02/red-left-60.png" />
      <img class="t-red-right-6" src="/transys/image/ccf01_02/red-right-60.png" />
      <img class="t-yellow-left-6" src="/transys/image/ccf01_02/yellow-left-60.png" />
      <img class="t-yellow-right-6" src="/transys/image/ccf01_02/yellow-right-60.png" />
      <!-- <img class="t-bar-green-1" src="/transys/image/ccf01_02/bar-green-10.png" />
      <img class="t-bar-red-1" src="/transys/image/ccf01_02/bar-red-10.png" /> -->
      <!-- <img class="t-con-off-0" src="/transys/image/ccf01_02/con-off-00.png" />
      <img class="t-con-on-0" src="/transys/image/ccf01_02/con-on-00.png" />
      <img class="t-con-off-1" src="/transys/image/ccf01_02/con-off-10.png" />
      <img class="t-con-on-1" src="/transys/image/ccf01_02/con-on-10.png" /> -->
      <img class="t-con-off-2" src="/transys/image/ccf01_02/con-off-20.png" />
      <img class="t-con-on-2" src="/transys/image/ccf01_02/con-on-20.png" />
      <img class="t-con-off-3" src="/transys/image/ccf01_02/con-off-30.png" />
      <img class="t-con-on-3" src="/transys/image/ccf01_02/con-on-30.png" />
      <img class="t-con-off-4" src="/transys/image/ccf01_02/con-off-40.png" />
      <img class="t-con-on-4" src="/transys/image/ccf01_02/con-on-40.png" />
      <img class="t-con-off-5" src="/transys/image/ccf01_02/con-off-50.png" />
      <img class="t-con-on-5" src="/transys/image/ccf01_02/con-on-50.png" />
      <img class="t-con-off-6" src="/transys/image/ccf01_02/con-off-60.png" />
      <img class="t-con-on-6" src="/transys/image/ccf01_02/con-on-60.png" />
      <img class="t-con-off-7" src="/transys/image/ccf01_02/con-off-70.png" />
      <img class="t-con-on-7" src="/transys/image/ccf01_02/con-on-70.png" />
      <img class="t-con-off-8" src="/transys/image/ccf01_02/con-off-80.png" />
      <img class="t-con-on-8" src="/transys/image/ccf01_02/con-on-80.png" />
      <img class="t-con-off-9" src="/transys/image/ccf01_02/con-off-90.png" />
      <img class="t-con-on-9" src="/transys/image/ccf01_02/con-on-90.png" />
      <img class="t-con-off-10" src="/transys/image/ccf01_02/con-off-100.png" />
      <img class="t-con-on-10" src="/transys/image/ccf01_02/con-on-100.png" />
      <img class="t-con-off-11" src="/transys/image/ccf01_02/con-off-110.png" />
      <img class="t-con-on-11" src="/transys/image/ccf01_02/con-on-110.png" />
      <img class="t-con-off-12" src="/transys/image/ccf01_02/con-off-120.png" />
      <img class="t-con-on-12" src="/transys/image/ccf01_02/con-on-120.png" />
      <img class="t-con-off-13" src="/transys/image/ccf01_02/con-off-130.png" />
      <img class="t-con-on-13" src="/transys/image/ccf01_02/con-on-130.png" />
      <img class="t-con-off-14" src="/transys/image/ccf01_02/con-off-140.png" />
      <img class="t-con-on-14" src="/transys/image/ccf01_02/con-on-140.png" />
      <img class="t-con-off-15" src="/transys/image/ccf01_02/con-off-150.png" />
      <img class="t-con-on-15" src="/transys/image/ccf01_02/con-on-150.png" />
      <img class="t-con-off-16" src="/transys/image/ccf01_02/con-off-160.png" />
      <img class="t-con-on-16" src="/transys/image/ccf01_02/con-on-160.png" />
      <img class="t-con-off-17" src="/transys/image/ccf01_02/con-off-170.png" />
      <img class="t-con-on-17" src="/transys/image/ccf01_02/con-on-170.png" />
      <img class="t-con-off-18" src="/transys/image/ccf01_02/con-off-180.png" />
      <img class="t-con-on-18" src="/transys/image/ccf01_02/con-on-180.png" />
      <img class="t-con-off-19" src="/transys/image/ccf01_02/con-off-190.png" />
      <img class="t-con-on-19" src="/transys/image/ccf01_02/con-on-190.png" />
      <img class="t-con-off-20" src="/transys/image/ccf01_02/con-off-200.png" />
      <img class="t-con-on-20" src="/transys/image/ccf01_02/con-on-200.png" />
      <img class="t-con-off-21" src="/transys/image/ccf01_02/con-off-210.png" />
      <img class="t-con-on-21" src="/transys/image/ccf01_02/con-on-210.png" />
      <img class="t-con-off-22" src="/transys/image/ccf01_02/con-off-220.png" />
      <img class="t-con-on-22" src="/transys/image/ccf01_02/con-on-220.png" />
      <img class="t-con-off-23" src="/transys/image/ccf01_02/con-off-230.png" />
      <img class="t-con-on-23" src="/transys/image/ccf01_02/con-on-230.png" />
      <img class="t-con-off-24" src="/transys/image/ccf01_02/con-off-240.png" />
      <img class="t-con-on-24" src="/transys/image/ccf01_02/con-on-240.png" />
      <img class="t-con-off-25" src="/transys/image/ccf01_02/con-off-250.png" />
      <img class="t-con-on-25" src="/transys/image/ccf01_02/con-on-250.png" />
      <img class="t-con-off-26" src="/transys/image/ccf01_02/con-off-260.png" />
      <img class="t-con-on-26" src="/transys/image/ccf01_02/con-on-260.png" />
      <img class="t-con-off-27" src="/transys/image/ccf01_02/con-off-270.png" />
      <img class="t-con-on-27" src="/transys/image/ccf01_02/con-on-270.png" />
      <img class="t-con-off-28" src="/transys/image/ccf01_02/con-off-280.png" />
      <img class="t-con-on-28" src="/transys/image/ccf01_02/con-on-280.png" />
      <img class="t-con-off-29" src="/transys/image/ccf01_02/con-off-290.png" />
      <img class="t-con-on-29" src="/transys/image/ccf01_02/con-on-290.png" />
      <!-- <img class="t-con-off-30" src="/transys/image/ccf01_02/con-off-280.png" />
      <img class="t-con-on-30" src="/transys/image/ccf01_02/con-on-280.png" />
      <img class="t-con-off-31" src="/transys/image/ccf01_02/con-off-290.png" />
      <img class="t-con-on-31" src="/transys/image/ccf01_02/con-on-290.png" /> -->
      <img class="t-agi-1" src="/transys/image/ccf01_02/agi-10.png" />
      <img class="t-agi-2" src="/transys/image/ccf01_02/agi-20.png" />
      <img class="t-agi-3" src="/transys/image/ccf01_02/agi-30.png" />
      <img class="t-agi-4" src="/transys/image/ccf01_02/agi-40.png" />
      <img class="t-lamp-green-1" src="/transys/image/ccf01_02/lamp-green-10.png" />
      <img class="t-pen-rol-1" src="/transys/image/ccf01_02/pen-rol-10.png" />
      <img class="t-lamp-green-2" src="/transys/image/ccf01_02/lamp-green-20.png" />
      <img class="t-pen-rol-2" src="/transys/image/ccf01_02/pen-rol-20.png" />
      <img class="t-lamp-green-3" src="/transys/image/ccf01_02/lamp-green-30.png" />
      <img class="t-pen-rol-3" src="/transys/image/ccf01_02/pen-rol-30.png" />
      <img class="t-lamp-green-4" src="/transys/image/ccf01_02/lamp-green-40.png" />
      <img class="t-pen-rol-4" src="/transys/image/ccf01_02/pen-rol-40.png" />
      <img class="t-lamp-green-5" src="/transys/image/ccf01_02/lamp-green-50.png" />
      <img class="t-pen-rol-5" src="/transys/image/ccf01_02/pen-rol-50.png" />
      <img class="t-lamp-green-6" src="/transys/image/ccf01_02/lamp-green-60.png" />
      <img class="t-pen-rol-6" src="/transys/image/ccf01_02/pen-rol-60.png" />
      <div class="t-door-red-1"></div>
      <div class="t-door-green-1"></div>
      <div class="t-door-red-2"></div>
      <div class="t-door-green-2"></div>
      <div class="t-door-red-3"></div>
      <div class="t-door-green-3"></div>
      <div class="t-door-red-4"></div>
      <div class="t-door-green-4"></div>
      <div class="t-door-red-5"></div>
      <div class="t-door-green-5"></div>
      <div class="t-door-red-6"></div>
      <div class="t-door-green-6"></div>
      <div class="t-door-red-7"></div>
      <div class="t-door-green-7"></div>
      <div class="t-clutchon-box-1"></div>
      <div class="t-clutchon-box-2"></div>
      <div class="t-jogging-mini-box-1"></div>
      <div class="t-jogging-mini-box-2"></div>
      <div class="t-jogging-mini-box-3"></div>
      <div class="t-jogging-mini-box-4"></div>
      <div class="t-jogging-mini-box-5"></div>
      <div class="t-high-speed-box-1"></div>
      <div class="t-high-speed-box-2"></div>
      <div class="t-high-speed-box-3"></div>
      <img class="t-elevator-1" src="/transys/image/ccf01_02/elevator-10.png" />
      <img class="t-elevator-2" src="/transys/image/ccf01_02/elevator-20.png" />
      <img class="t-elevator-3" src="/transys/image/ccf01_02/elevator-30.png" />
      <div class="t-rpm">RPM</div>
      <div class="t-rpm-value"></div>
      <div class="t-process-data-header"></div>
      <div class="t-skim-text">탈지로</div>
      <div class="t-pre-text">예열</div>
      <div class="t-chim-text">침탄</div>
      <div class="t-diff-text">확산</div>
      <div class="t-q-1-text">소입1</div>
      <div class="t-q-2-text">소입2</div>
      <div class="t-salt-text">SALT조</div>
      <div class="t-process-data-box"></div>
      <div class="t-pv-box"></div>
      <div class="t-pv-text">잔여시간 (분)</div>
      <div class="t-sp-box"></div>
      <div class="t-sp-text">설정시간 (분)</div>
      <div class="t-skim-pv"></div>
      <div class="t-skim-sp"></div>
      <div class="t-pre-pv"></div>
      <div class="t-pre-sp"></div>
      <div class="t-cycle-no-text-1">CYCLE NO</div>
      <div class="t-chim-cycle-no"></div>
      <div class="t-cycle-no-text-2">CYCLE NO</div>
      <div class="t-diff-cycle-no"></div>
      <div class="t-q-1-pv"></div>
      <div class="t-q-1-sp"></div>
      <div class="t-q-2-pv"></div>
      <div class="t-q-2-sp"></div>
      <div class="t-salt-q-text">QUECHING</div>
      <div class="t-salt-q-pv"></div>
      <div class="t-salt-q-sp"></div>
      <div class="t-salt-d-text">DRAIN</div>
      <div class="t-salt-d-pv"></div>
      <div class="t-salt-d-sp"></div>
      <div class="cover-1"></div>
      <div class="cover-2"></div>
      <div class="cover-3"></div>
      <div class="cover-4"></div>
      <div class="sensor-pen-1"></div>
	  <div class="sensor-pen-2"></div>
	  <div class="sensor-pen-3"></div>
	  <div class="sensor-pen-4"></div>
	  <div class="sensor-pen-5"></div>
	  <div class="sensor-pen-6"></div>
	  <div class="sensor-pen-7"></div>
	  <div class="sensor-pen-8"></div>
	  <div class="sensor-pen-9"></div>
	  <div class="sensor-pen-10"></div>
	  <div class="sensor-pen-11"></div>
	  <div class="sensor-pen-12"></div>
  </div>
</div>
<div class="bottom">
  <img class="b-ccf-1" src="/transys/image/ccf01_02/ccf-10.png" />
    <div class="b-ccf-1-text">침탄로 2호기</div>
<!--      <div class="t-ccf-1-ship"></div>
     <div class="b-ccf-1-ship-text">1호기 출고요청</div> -->
      <!-- <img class="b-tong-0" src="/transys/image/ccf01_02/tong-00.png" />
      <div class="b-v-0-tong-1"></div>
      <div class="b-v-0-tong-2"></div>
      <div class="b-v-0-tong-3"></div> -->
      <img class="b-tong-1" src="/transys/image/ccf01_02/tong-10.png" />
      <div class="b-v-1-tong-1"></div>
      <div class="b-v-1-tong-2"></div>
      <div class="b-v-1-tong-3"></div>
      <img class="b-tong-2" src="/transys/image/ccf01_02/tong-20.png" />
      <div class="b-v-2-tong-1"></div>
      <div class="b-v-2-tong-2"></div>
      <div class="b-v-2-tong-3"></div>
      <img class="b-tong-3" src="/transys/image/ccf01_02/tong-30.png" />
      <div class="b-v-3-tong-1"></div>
      <div class="b-v-3-tong-2"></div>
      <div class="b-v-3-tong-3"></div>
      <img class="b-tong-4" src="/transys/image/ccf01_02/tong-40.png" />
      <div class="b-v-4-tong-1"></div>
      <div class="b-v-4-tong-2"></div>
      <div class="b-v-4-tong-3"></div>
      <img class="b-tong-5" src="/transys/image/ccf01_02/tong-50.png" />
      <div class="b-v-5-tong-1"></div>
      <div class="b-v-5-tong-2"></div>
      <div class="b-v-5-tong-3"></div>
      <img class="b-tong-6" src="/transys/image/ccf01_02/tong-60.png" />
      <div class="b-v-6-tong-1"></div>
      <div class="b-v-6-tong-2"></div>
      <div class="b-v-6-tong-3"></div>
      <img class="b-tong-7" src="/transys/image/ccf01_02/tong-70.png" />
      <div class="b-v-7-tong-1"></div>
      <div class="b-v-7-tong-2"></div>
      <div class="b-v-7-tong-3"></div>
      <img class="b-tong-8" src="/transys/image/ccf01_02/tong-80.png" />
      <div class="b-v-8-tong-1"></div>
      <div class="b-v-8-tong-2"></div>
      <div class="b-v-8-tong-3"></div>
      <img class="b-tong-9" src="/transys/image/ccf01_02/tong-90.png" />
      <div class="b-v-9-tong-1"></div>
      <div class="b-v-9-tong-2"></div>
      <div class="b-v-9-tong-3"></div>
      <img class="b-tong-10" src="/transys/image/ccf01_02/tong-100.png" />
      <div class="b-v-10-tong-1"></div>
      <div class="b-v-10-tong-2"></div>
      <div class="b-v-10-tong-3"></div>
      <img class="b-tong-11" src="/transys/image/ccf01_02/tong-110.png" />
      <div class="b-v-11-tong-1"></div>
      <div class="b-v-11-tong-2"></div>
      <div class="b-v-11-tong-3"></div>
      <img class="b-tong-12" src="/transys/image/ccf01_02/tong-120.png" />
      <div class="b-v-12-tong-1"></div>
      <div class="b-v-12-tong-2"></div>
      <div class="b-v-12-tong-3"></div>
      <img class="b-tong-13" src="/transys/image/ccf01_02/tong-130.png" />
      <div class="b-v-13-tong-1"></div>
      <div class="b-v-13-tong-2"></div>
      <div class="b-v-13-tong-3"></div>
      <img class="b-tong-14" src="/transys/image/ccf01_02/tong-140.png" />
      <div class="b-v-14-tong-1"></div>
      <div class="b-v-14-tong-2"></div>
      <div class="b-v-14-tong-3"></div>
      <img class="b-tong-15" src="/transys/image/ccf01_02/tong-150.png" />
      <div class="b-v-15-tong-1"></div>
      <div class="b-v-15-tong-2"></div>
      <div class="b-v-15-tong-3"></div>
      <img class="b-tong-16" src="/transys/image/ccf01_02/tong-160.png" />
      <div class="b-v-16-tong-1"></div>
      <div class="b-v-16-tong-2"></div>
      <div class="b-v-16-tong-3"></div>
      <img class="b-tong-17" src="/transys/image/ccf01_02/tong-170.png" />
      <div class="b-v-17-tong-1"></div>
      <div class="b-v-17-tong-2"></div>
      <div class="b-v-17-tong-3"></div>
      <img class="b-tong-18" src="/transys/image/ccf01_02/tong-180.png" />
      <div class="b-v-18-tong-1"></div>
      <div class="b-v-18-tong-2"></div>
      <div class="b-v-18-tong-3"></div>
      <img class="b-tong-19" src="/transys/image/ccf01_02/tong-190.png" />
      <div class="b-v-19-tong-1"></div>
      <div class="b-v-19-tong-2"></div>
      <div class="b-v-19-tong-3"></div>
      <img class="b-tong-20" src="/transys/image/ccf01_02/tong-200.png" />
      <div class="b-v-20-tong-1"></div>
      <div class="b-v-20-tong-2"></div>
      <div class="b-v-20-tong-3"></div>
      <img class="b-tong-21" src="/transys/image/ccf01_02/tong-210.png" />
      <div class="b-v-21-tong-1"></div>
      <div class="b-v-21-tong-2"></div>
      <div class="b-v-21-tong-3"></div>
      <img class="b-tong-22" src="/transys/image/ccf01_02/tong-220.png" />
      <div class="b-v-22-tong-1"></div>
      <div class="b-v-22-tong-2"></div>
      <div class="b-v-22-tong-3"></div>
      <img class="b-tong-23" src="/transys/image/ccf01_02/tong-230.png" />
      <div class="b-v-23-tong-1"></div>
      <div class="b-v-23-tong-2"></div>
      <div class="b-v-23-tong-3"></div>
      <img class="b-tong-24" src="/transys/image/ccf01_02/tong-240.png" />
      <div class="b-v-24-tong-1"></div>
      <div class="b-v-24-tong-2"></div>
      <div class="b-v-24-tong-3"></div>
      <img class="b-tong-25" src="/transys/image/ccf01_02/tong-250.png" />
      <div class="b-v-25-tong-1"></div>
      <div class="b-v-25-tong-2"></div>
      <div class="b-v-25-tong-3"></div>
      <img class="b-tong-26" src="/transys/image/ccf01_02/tong-260.png" />
      <div class="b-v-26-tong-1"></div>
      <div class="b-v-26-tong-2"></div>
      <div class="b-v-26-tong-3"></div>
      <img class="b-tong-27" src="/transys/image/ccf01_02/tong-270.png" />
      <div class="b-v-27-tong-1"></div>
      <div class="b-v-27-tong-2"></div>
      <div class="b-v-27-tong-3"></div>
      <img class="b-tong-28" src="/transys/image/ccf01_02/tong-280.png" />
      <div class="b-v-28-tong-1"></div>
      <div class="b-v-28-tong-2"></div>
      <div class="b-v-28-tong-3"></div>
      <!-- <img class="b-tong-29" src="/transys/image/ccf01_02/tong-290.png" />
      <div class="b-v-29-tong-1"></div>
      <div class="b-v-29-tong-2"></div>
      <div class="b-v-29-tong-3"></div> -->
      <img class="b-red-left-1" src="/transys/image/ccf01_02/red-left-10.png" />
      <img class="b-red-right-1" src="/transys/image/ccf01_02/red-right-10.png" />
      <img class="b-yellow-left-1" src="/transys/image/ccf01_02/yellow-left-10.png" />
      <img class="b-yellow-right-1" src="/transys/image/ccf01_02/yellow-right-10.png" />
      <img class="b-red-left-2" src="/transys/image/ccf01_02/red-left-20.png" />
      <img class="b-red-right-2" src="/transys/image/ccf01_02/red-right-20.png" />
      <img class="b-yellow-left-2" src="/transys/image/ccf01_02/yellow-left-20.png" />
      <img class="b-yellow-right-2" src="/transys/image/ccf01_02/yellow-right-20.png" />
      <img class="b-red-left-3" src="/transys/image/ccf01_02/red-left-30.png" />
      <img class="b-red-right-3" src="/transys/image/ccf01_02/red-right-30.png" />
      <img class="b-yellow-left-3" src="/transys/image/ccf01_02/yellow-left-30.png" />
      <img class="b-yellow-right-3" src="/transys/image/ccf01_02/yellow-right-30.png" />
      <img class="b-red-left-4" src="/transys/image/ccf01_02/red-left-40.png" />
      <img class="b-red-right-4" src="/transys/image/ccf01_02/red-right-40.png" />
      <img class="b-yellow-left-4" src="/transys/image/ccf01_02/yellow-left-40.png" />
      <img class="b-yellow-right-4" src="/transys/image/ccf01_02/yellow-right-40.png" />
      <img class="b-red-left-5" src="/transys/image/ccf01_02/red-left-50.png" />
      <img class="b-red-right-5" src="/transys/image/ccf01_02/red-right-50.png" />
      <img class="b-yellow-left-5" src="/transys/image/ccf01_02/yellow-left-50.png" />
      <img class="b-yellow-right-5" src="/transys/image/ccf01_02/yellow-right-50.png" />
      <img class="b-red-left-6" src="/transys/image/ccf01_02/red-left-60.png" />
      <img class="b-red-right-6" src="/transys/image/ccf01_02/red-right-60.png" />
      <img class="b-yellow-left-6" src="/transys/image/ccf01_02/yellow-left-60.png" />
      <img class="b-yellow-right-6" src="/transys/image/ccf01_02/yellow-right-60.png" />
      <img class="b-bar-green-1" src="/transys/image/ccf01_02/bar-green-10.png" />
      <img class="b-bar-red-1" src="/transys/image/ccf01_02/bar-red-10.png" />
      <!-- <img class="b-con-off-0" src="/transys/image/ccf01_02/con-off-00.png" />
      <img class="b-con-on-0" src="/transys/image/ccf01_02/con-on-00.png" />
      <img class="b-con-off-1" src="/transys/image/ccf01_02/con-off-10.png" />
      <img class="b-con-on-1" src="/transys/image/ccf01_02/con-on-10.png" /> -->
      <img class="b-con-off-2" src="/transys/image/ccf01_02/con-off-20.png" />
      <img class="b-con-on-2" src="/transys/image/ccf01_02/con-on-20.png" />
      <img class="b-con-off-3" src="/transys/image/ccf01_02/con-off-30.png" />
      <img class="b-con-on-3" src="/transys/image/ccf01_02/con-on-30.png" />
      <img class="b-con-off-4" src="/transys/image/ccf01_02/con-off-40.png" />
      <img class="b-con-on-4" src="/transys/image/ccf01_02/con-on-40.png" />
      <img class="b-con-off-5" src="/transys/image/ccf01_02/con-off-50.png" />
      <img class="b-con-on-5" src="/transys/image/ccf01_02/con-on-50.png" />
      <img class="b-con-off-6" src="/transys/image/ccf01_02/con-off-60.png" />
      <img class="b-con-on-6" src="/transys/image/ccf01_02/con-on-60.png" />
      <img class="b-con-off-7" src="/transys/image/ccf01_02/con-off-70.png" />
      <img class="b-con-on-7" src="/transys/image/ccf01_02/con-on-70.png" />
      <img class="b-con-off-8" src="/transys/image/ccf01_02/con-off-80.png" />
      <img class="b-con-on-8" src="/transys/image/ccf01_02/con-on-80.png" />
      <img class="b-con-off-9" src="/transys/image/ccf01_02/con-off-90.png" />
      <img class="b-con-on-9" src="/transys/image/ccf01_02/con-on-90.png" />
      <img class="b-con-off-10" src="/transys/image/ccf01_02/con-off-100.png" />
      <img class="b-con-on-10" src="/transys/image/ccf01_02/con-on-100.png" />
      <img class="b-con-off-11" src="/transys/image/ccf01_02/con-off-110.png" />
      <img class="b-con-on-11" src="/transys/image/ccf01_02/con-on-110.png" />
      <img class="b-con-off-12" src="/transys/image/ccf01_02/con-off-120.png" />
      <img class="b-con-on-12" src="/transys/image/ccf01_02/con-on-120.png" />
      <img class="b-con-off-13" src="/transys/image/ccf01_02/con-off-130.png" />
      <img class="b-con-on-13" src="/transys/image/ccf01_02/con-on-130.png" />
      <img class="b-con-off-14" src="/transys/image/ccf01_02/con-off-140.png" />
      <img class="b-con-on-14" src="/transys/image/ccf01_02/con-on-140.png" />
      <img class="b-con-off-15" src="/transys/image/ccf01_02/con-off-150.png" />
      <img class="b-con-on-15" src="/transys/image/ccf01_02/con-on-150.png" />
      <img class="b-con-off-16" src="/transys/image/ccf01_02/con-off-160.png" />
      <img class="b-con-on-16" src="/transys/image/ccf01_02/con-on-160.png" />
      <img class="b-con-off-17" src="/transys/image/ccf01_02/con-off-170.png" />
      <img class="b-con-on-17" src="/transys/image/ccf01_02/con-on-170.png" />
      <img class="b-con-off-18" src="/transys/image/ccf01_02/con-off-180.png" />
      <img class="b-con-on-18" src="/transys/image/ccf01_02/con-on-180.png" />
      <img class="b-con-off-19" src="/transys/image/ccf01_02/con-off-190.png" />
      <img class="b-con-on-19" src="/transys/image/ccf01_02/con-on-190.png" />
      <img class="b-con-off-20" src="/transys/image/ccf01_02/con-off-200.png" />
      <img class="b-con-on-20" src="/transys/image/ccf01_02/con-on-200.png" />
      <img class="b-con-off-21" src="/transys/image/ccf01_02/con-off-210.png" />
      <img class="b-con-on-21" src="/transys/image/ccf01_02/con-on-210.png" />
      <img class="b-con-off-22" src="/transys/image/ccf01_02/con-off-220.png" />
      <img class="b-con-on-22" src="/transys/image/ccf01_02/con-on-220.png" />
      <img class="b-con-off-23" src="/transys/image/ccf01_02/con-off-230.png" />
      <img class="b-con-on-23" src="/transys/image/ccf01_02/con-on-230.png" />
      <img class="b-con-off-24" src="/transys/image/ccf01_02/con-off-240.png" />
      <img class="b-con-on-24" src="/transys/image/ccf01_02/con-on-240.png" />
      <img class="b-con-off-25" src="/transys/image/ccf01_02/con-off-250.png" />
      <img class="b-con-on-25" src="/transys/image/ccf01_02/con-on-250.png" />
      <img class="b-con-off-26" src="/transys/image/ccf01_02/con-off-260.png" />
      <img class="b-con-on-26" src="/transys/image/ccf01_02/con-on-260.png" />
      <img class="b-con-off-27" src="/transys/image/ccf01_02/con-off-270.png" />
      <img class="b-con-on-27" src="/transys/image/ccf01_02/con-on-270.png" />
      <img class="b-con-off-28" src="/transys/image/ccf01_02/con-off-280.png" />
      <img class="b-con-on-28" src="/transys/image/ccf01_02/con-on-280.png" />
      <img class="b-con-off-29" src="/transys/image/ccf01_02/con-off-290.png" />
      <img class="b-con-on-29" src="/transys/image/ccf01_02/con-on-290.png" />
      <!-- <img class="b-con-off-30" src="/transys/image/ccf01_02/con-off-280.png" />
      <img class="b-con-on-30" src="/transys/image/ccf01_02/con-on-280.png" />
      <img class="b-con-off-31" src="/transys/image/ccf01_02/con-off-290.png" />
      <img class="b-con-on-31" src="/transys/image/ccf01_02/con-on-290.png" /> -->
      <img class="b-agi-1" src="/transys/image/ccf01_02/agi-10.png" />
      <img class="b-agi-2" src="/transys/image/ccf01_02/agi-20.png" />
      <img class="b-agi-3" src="/transys/image/ccf01_02/agi-30.png" />
      <img class="b-agi-4" src="/transys/image/ccf01_02/agi-40.png" />
      <img class="b-lamp-green-1" src="/transys/image/ccf01_02/lamp-green-10.png" />
      <img class="b-pen-rol-1" src="/transys/image/ccf01_02/pen-rol-10.png" />
      <img class="b-lamp-green-2" src="/transys/image/ccf01_02/lamp-green-20.png" />
      <img class="b-pen-rol-2" src="/transys/image/ccf01_02/pen-rol-20.png" />
      <img class="b-lamp-green-3" src="/transys/image/ccf01_02/lamp-green-30.png" />
      <img class="b-pen-rol-3" src="/transys/image/ccf01_02/pen-rol-30.png" />
      <img class="b-lamp-green-4" src="/transys/image/ccf01_02/lamp-green-40.png" />
      <img class="b-pen-rol-4" src="/transys/image/ccf01_02/pen-rol-40.png" />
      <img class="b-lamp-green-5" src="/transys/image/ccf01_02/lamp-green-50.png" />
      <img class="b-pen-rol-5" src="/transys/image/ccf01_02/pen-rol-50.png" />
      <img class="b-lamp-green-6" src="/transys/image/ccf01_02/lamp-green-60.png" />
      <img class="b-pen-rol-6" src="/transys/image/ccf01_02/pen-rol-60.png" />
      <div class="b-door-red-1"></div>
      <div class="b-door-green-1"></div>
      <div class="b-door-red-2"></div>
      <div class="b-door-green-2"></div>
      <div class="b-door-red-3"></div>
      <div class="b-door-green-3"></div>
      <div class="b-door-red-4"></div>
      <div class="b-door-green-4"></div>
      <div class="b-door-red-5"></div>
      <div class="b-door-green-5"></div>
      <div class="b-door-red-6"></div>
      <div class="b-door-green-6"></div>
      <div class="b-door-red-7"></div>
      <div class="b-door-green-7"></div>
      <div class="b-clutchon-box-1"></div>
      <div class="b-clutchon-box-2"></div>
      <div class="b-jogging-mini-box-1"></div>
      <div class="b-jogging-mini-box-2"></div>
      <div class="b-jogging-mini-box-3"></div>
      <div class="b-jogging-mini-box-4"></div>
      <div class="b-jogging-mini-box-5"></div>
      <div class="b-high-speed-box-1"></div>
      <div class="b-high-speed-box-2"></div>
      <div class="b-high-speed-box-3"></div>
      <img class="b-elevator-1" src="/transys/image/ccf01_02/elevator-10.png" />
      <img class="b-elevator-2" src="/transys/image/ccf01_02/elevator-20.png" />
      <img class="b-elevator-3" src="/transys/image/ccf01_02/elevator-30.png" />
      <div class="b-rpm">RPM</div>
      <div class="b-rpm-value"></div>
      <div class="b-process-data-header"></div>
      <div class="b-skim-text">탈지로</div>
      <div class="b-pre-text">예열</div>
      <div class="b-chim-text">침탄</div>
      <div class="b-diff-text">확산</div>
      <div class="b-q-1-text">소입1</div>
      <div class="b-q-2-text">소입2</div>
      <div class="b-salt-text">SALT조</div>
      <div class="b-process-data-box"></div>
      <div class="b-pv-box"></div>
      <div class="b-pv-text">잔여시간 (분)</div>
      <div class="b-sp-box"></div>
      <div class="b-sp-text">설정시간 (분)</div>
      <div class="b-skim-pv"></div>
      <div class="b-skim-sp"></div>
      <div class="b-pre-pv"></div>
      <div class="b-pre-sp"></div>
      <div class="b-cycle-no-text-1">CYCLE NO</div>
      <div class="b-chim-cycle-no"></div>
      <div class="b-cycle-no-text-2">CYCLE NO</div>
      <div class="b-diff-cycle-no"></div>
      <div class="b-q-1-pv"></div>
      <div class="b-q-1-sp"></div>
      <div class="b-q-2-pv"></div>
      <div class="b-q-2-sp"></div>
      <div class="b-salt-q-text">QUECHING</div>
      <div class="b-salt-q-pv"></div>
      <div class="b-salt-q-sp"></div>
      <div class="b-salt-d-text">DRAIN</div>
      <div class="b-salt-d-pv"></div>
      <div class="b-salt-d-sp"></div>
  </div>
<script>
var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 1000);
});

//OPC값 알람 조회
function overviewListView(){
	$.ajax({
		url:"/transys/ccf/ccf01_02/view",
		type:"post",
		dataType:"json",
		success:function(result){				
			var data = result.multiValues;
			
          for(let key in data){
          	for(let keys in data[key]){
          		var d = data[key];

					if(d[keys].action == "v"){
						v(keys, d[keys].value);
					}else if(d[keys].action == "c"){
						c(keys, d[keys].value);
					}else if(d[keys].action == "b"){
						b(keys, d[keys].value);
					}else if(d[keys].action == "value"){
						value(keys, d[keys].value);
					}

          	}                    	
          }
		}
	});
}

function v(keys, value){
//	$("."+keys).text(value);
	
	if(value == true){
		if(keys.indexOf("door-red") != -1){
			$("."+keys).css("display","none");
		}else if(keys.indexOf("door-green") != -1){
			$("."+keys).css("display","");
		}else if(keys.indexOf("high") != -1){
			$("."+keys).text("고속전진");
			$("."+keys).css("color","green");
			$("."+keys).css("font-weight","700");
			$("."+keys).css("font-size","12pt");
			$("."+keys).css("display","");
		}else if(keys.indexOf("jogging") != -1){
			//3번만 자동조깅중, 자동조깅중지
			//그 외는 자동조깅, 수동조깅
			var jog_split = keys.split("-");
			
			if(jog_split[4] == "3"){
				$("."+keys).text("자동조깅정지");
				$("."+keys).css("color","red");
				$("."+keys).css("font-weight","700");
				$("."+keys).css("font-size","12pt");
				$("."+keys).css("display","");				
			}else{
				$("."+keys).text("수동조깅");
				$("."+keys).css("color","red");
				$("."+keys).css("font-weight","700");
				$("."+keys).css("font-size","12pt");
				$("."+keys).css("display","");					
			}
		}else if(keys.indexOf("yellow") != -1 &&
					keys.indexOf("_") == -1){
			$("."+keys).css("display","none");
		}else if(keys.indexOf("red") != -1 &&
					keys.indexOf("_") == -1){
			$("."+keys).css("display","none");
		}else if(keys.indexOf("con-on") != -1){
			$("."+keys).css("display","none");
		}else{
			$("."+keys).css("display","");
		}
		
	}else{		
		
		if(keys.indexOf("door-red") != -1){
			$("."+keys).css("display","");
		}else if(keys.indexOf("door-green") != -1){
			$("."+keys).css("display","none");
		}else if(keys.indexOf("high") != -1){
			$("."+keys).css("display","none");
		}else if(keys.indexOf("jogging") != -1){
			//3번만 자동조깅중, 자동조깅중지
			//그 외는 자동조깅, 수동조깅
			var jog_split = keys.split("-");
			
			if(jog_split[4] == "3"){
				$("."+keys).text("자동조깅중");
				$("."+keys).css("color","black");
				$("."+keys).css("font-weight","700");
				$("."+keys).css("font-size","12pt");
				$("."+keys).css("display","");				
			}else{
				$("."+keys).text("자동조깅");
				$("."+keys).css("color","blue");
				$("."+keys).css("font-weight","700");
				$("."+keys).css("font-size","12pt");
				$("."+keys).css("display","");					
			}
		}else if(keys.indexOf("yellow") != -1 &&
					keys.indexOf("_") == -1){
			$("."+keys).css("display","");
			$("."+keys).css("animation","blink-effect 1s step-end infinite");			
		}else if(keys.indexOf("red") != -1 &&
					keys.indexOf("_") == -1){
			$("."+keys).css("display","");
		}else if(keys.indexOf("con-on") != -1){
			$("."+keys).css("display","");
		}else{
		
			$("."+keys).css("display","none");
		}

		
	}
	
}

function c(keys, value){
//	$("."+keys).text(value);
	
	if(value == true){
		$("."+keys).css("background-color","red");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","black");
	}
	
}


function value(keys, value){
	$("."+keys).text(value);
	$("."+keys).css("text-align","center");
	$("."+keys).css("font-size","12pt");

	var tong_split = keys.split("-");	
	if(tong_split[1] == "tong"){
		var tong_tag1 = tong_split[0]+"-v-"+(tong_split[2])+"-"+tong_split[1]+"-1";
		var tong_tag2 = tong_split[0]+"-v-"+(tong_split[2])+"-"+tong_split[1]+"-2";
		var tong_tag3 = tong_split[0]+"-v-"+(tong_split[2])+"-"+tong_split[1]+"-3";		
		if(value == 0){
			$("."+tong_tag1).css("display","none");
			$("."+tong_tag2).css("display","none");
			$("."+tong_tag3).css("display","none");
			$("."+keys).css("display","none");			
		}else{
			$("."+tong_tag1).css("display","");
			$("."+tong_tag2).css("display","");
			$("."+tong_tag3).css("display","");			
			$("."+keys).css("display","");
		}
	}
}
</script>
</body>
</html>
 