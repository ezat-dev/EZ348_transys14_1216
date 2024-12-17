<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/transys/css/cm/cm.css">
  	<jsp:include page="../include/pluginpage.jsp"/>
	<jsp:include page="../include/header.jsp"/>
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
    <img class="_3-3-1" src="/transys/image/cm/_3-3-10.png" />
    <div class="textName">공통설비2호기</div>
    <div class="background-1"></div>
    <div class="background-2"></div>
    <div class="background-3"></div>
    <div class="background-4"></div>
    <div class="background-5"></div>
    <img class="elevator-1" src="/transys/image/cm/elevator-10.png" />
    <img class="elevator-on-1" src="/transys/image/cm/elevator-on-10.png" />
    <img class="elevator-on-2" src="/transys/image/cm/elevator-on-20.png" />
    <img class="elevator-off-1" src="/transys/image/cm/elevator-off-10.png" />
    <img class="elevator-off-2" src="/transys/image/cm/elevator-off-20.png" />
    <img class="elevator-2" src="/transys/image/cm/elevator-20.png" />
    <img class="elevator-on-3" src="/transys/image/cm/elevator-on-30.png" />
    <img class="elevator-on-4" src="/transys/image/cm/elevator-on-40.png" />
    <img class="elevator-off-3" src="/transys/image/cm/elevator-off-30.png" />
    <img class="elevator-off-4" src="/transys/image/cm/elevator-off-40.png" />
    <img class="tong-0" src="/transys/image/cm/tong-00.png" />
    <div class="v-0-tong-1"></div>
    <div class="v-0-tong-2"></div>
    <div class="v-0-tong-3"></div>
    <img class="tong-1" src="/transys/image/cm/tong-10.png" />
    <div class="v-1-tong-1"></div>
    <div class="v-1-tong-2"></div>
    <div class="v-1-tong-3"></div>
    <img class="tong-2" src="/transys/image/cm/tong-20.png" />
    <div class="v-2-tong-1"></div>
    <div class="v-2-tong-2"></div>
    <div class="v-2-tong-3"></div>
    <img class="tong-3" src="/transys/image/cm/tong-30.png" />
    <div class="v-3-tong-1"></div>
    <div class="v-3-tong-2"></div>
    <div class="v-3-tong-3"></div>
    <img class="tong-4" src="/transys/image/cm/tong-40.png" />
    <div class="v-4-tong-1"></div>
    <div class="v-4-tong-2"></div>
    <div class="v-4-tong-3"></div>
    <img class="tong-5" src="/transys/image/cm/tong-50.png" />
    <div class="v-5-tong-1"></div>
    <div class="v-5-tong-2"></div>
    <div class="v-5-tong-3"></div>
    <img class="tong-6" src="/transys/image/cm/tong-60.png" />
    <div class="v-6-tong-1"></div>
    <div class="v-6-tong-2"></div>
    <div class="v-6-tong-3"></div>
    <!-- <img class="shor-open-1" src="/transys/image/cm/shor-open-10.png" />
    <img class="shor-door-1" src="/transys/image/cm/shor-door-10.png" /> -->
    <img class="tong-7" src="/transys/image/cm/tong-70.png" />
    <div class="v-7-tong-1"></div>
    <div class="v-7-tong-2"></div>
    <div class="v-7-tong-3"></div>
    <img class="tong-8" src="/transys/image/cm/tong-80.png" />
    <div class="v-8-tong-1"></div>
    <div class="v-8-tong-2"></div>
    <div class="v-8-tong-3"></div>
    <img class="tong-9" src="/transys/image/cm/tong-90.png" />
    <div class="v-9-tong-1"></div>
    <div class="v-9-tong-2"></div>
    <div class="v-9-tong-3"></div>
    <img class="tong-10" src="/transys/image/cm/tong-100.png" />
    <div class="v-10-tong-1"></div>
    <div class="v-10-tong-2"></div>
    <div class="v-10-tong-3"></div>
    <img class="tong-11" src="/transys/image/cm/tong-110.png" />
    <div class="v-11-tong-1"></div>
    <div class="v-11-tong-2"></div>
    <div class="v-11-tong-3"></div>
    <img class="tong-12" src="/transys/image/cm/tong-120.png" />
    <div class="v-12-tong-1"></div>
    <div class="v-12-tong-2"></div>
    <div class="v-12-tong-3"></div>
    <img class="tong-13" src="/transys/image/cm/tong-130.png" />
    <div class="v-13-tong-1"></div>
    <div class="v-13-tong-2"></div>
    <div class="v-13-tong-3"></div>
    <img class="tong-14" src="/transys/image/cm/tong-140.png" />
    <div class="v-14-tong-1"></div>
    <div class="v-14-tong-2"></div>
    <div class="v-14-tong-3"></div>
    <img class="tong-15" src="/transys/image/cm/tong-150.png" />
    <div class="v-15-tong-1"></div>
    <div class="v-15-tong-2"></div>
    <div class="v-15-tong-3"></div>
    <img class="tong-16" src="/transys/image/cm/tong-160.png" />
    <div class="v-16-tong-1"></div>
    <div class="v-16-tong-2"></div>
    <div class="v-16-tong-3"></div>
    <img class="tong-17" src="/transys/image/cm/tong-170.png" />
    <div class="v-17-tong-1"></div>
    <div class="v-17-tong-2"></div>
    <div class="v-17-tong-3"></div>
    <img class="tong-18" src="/transys/image/cm/tong-180.png" />
    <div class="v-18-tong-1"></div>
    <div class="v-18-tong-2"></div>
    <div class="v-18-tong-3"></div>
    <img class="tong-19" src="/transys/image/cm/tong-190.png" />
    <div class="v-19-tong-1"></div>
    <div class="v-19-tong-2"></div>
    <div class="v-19-tong-3"></div>
    <img class="tong-20" src="/transys/image/cm/tong-200.png" />
    <div class="v-20-tong-1"></div>
    <div class="v-20-tong-2"></div>
    <div class="v-20-tong-3"></div>
    <img class="tong-21" src="/transys/image/cm/tong-210.png" />
    <div class="v-21-tong-1"></div>
    <div class="v-21-tong-2"></div>
    <div class="v-21-tong-3"></div>
    <img class="tong-22" src="/transys/image/cm/tong-220.png" />
    <div class="v-22-tong-1"></div>
    <div class="v-22-tong-2"></div>
    <div class="v-22-tong-3"></div>
    <img class="tong-23" src="/transys/image/cm/tong-230.png" />
    <div class="v-23-tong-1"></div>
    <div class="v-23-tong-2"></div>
    <div class="v-23-tong-3"></div>
    <img class="tong-24" src="/transys/image/cm/tong-240.png" />
    <div class="v-24-tong-1"></div>
    <div class="v-24-tong-2"></div>
    <div class="v-24-tong-3"></div>
    <img class="tong-25" src="/transys/image/cm/tong-250.png" />
    <div class="v-25-tong-1"></div>
    <div class="v-25-tong-2"></div>
    <div class="v-25-tong-3"></div>
    <img class="tong-26" src="/transys/image/cm/tong-260.png" />
    <div class="v-26-tong-1"></div>
    <div class="v-26-tong-2"></div>
    <div class="v-26-tong-3"></div>
    <img class="tong-27" src="/transys/image/cm/tong-270.png" />
    <div class="v-27-tong-1"></div>
    <div class="v-27-tong-2"></div>
    <div class="v-27-tong-3"></div>
    <img class="tong-28" src="/transys/image/cm/tong-280.png" />
    <div class="v-28-tong-1"></div>
    <div class="v-28-tong-2"></div>
    <div class="v-28-tong-3"></div>
    <img class="tong-29" src="/transys/image/cm/tong-290.png" />
    <div class="v-29-tong-1"></div>
    <div class="v-29-tong-2"></div>
    <div class="v-29-tong-3"></div>
    <img class="tong-30" src="/transys/image/cm/tong-300.png" />
    <div class="v-30-tong-1"></div>
    <div class="v-30-tong-2"></div>
    <div class="v-30-tong-3"></div>
    <img class="tong-31" src="/transys/image/cm/tong-310.png" />
    <div class="v-31-tong-1"></div>
    <div class="v-31-tong-2"></div>
    <div class="v-31-tong-3"></div>
    <img class="tong-32" src="/transys/image/cm/tong-320.png" />
    <div class="v-32-tong-1"></div>
    <div class="v-32-tong-2"></div>
    <div class="v-32-tong-3"></div>
    <img class="tong-33" src="/transys/image/cm/tong-330.png" />
    <div class="v-33-tong-1"></div>
    <div class="v-33-tong-2"></div>
    <div class="v-33-tong-3"></div>
    <img class="tong-34" src="/transys/image/cm/tong-340.png" />
    <div class="v-34-tong-1"></div>
    <div class="v-34-tong-2"></div>
    <div class="v-34-tong-3"></div>
    <img class="tong-35" src="/transys/image/cm/tong-350.png" />
    <div class="v-35-tong-1"></div>
    <div class="v-35-tong-2"></div>
    <div class="v-35-tong-3"></div>
    <img class="tong-36" src="/transys/image/cm/tong-360.png" />
    <div class="v-36-tong-1"></div>
    <div class="v-36-tong-2"></div>
    <div class="v-36-tong-3"></div>
    <img class="tong-37" src="/transys/image/cm/tong-370.png" />
    <div class="v-37-tong-1"></div>
    <div class="v-37-tong-2"></div>
    <div class="v-37-tong-3"></div>
    <img class="tong-38" src="/transys/image/cm/tong-380.png" />
    <div class="v-38-tong-1"></div>
    <div class="v-38-tong-2"></div>
    <div class="v-38-tong-3"></div>
    <img class="tong-39" src="/transys/image/cm/tong-390.png" />
    <div class="v-39-tong-1"></div>
    <div class="v-39-tong-2"></div>
    <div class="v-39-tong-3"></div>
    <img class="tong-40" src="/transys/image/cm/tong-400.png" />
    <div class="v-40-tong-1"></div>
    <div class="v-40-tong-2"></div>
    <div class="v-40-tong-3"></div>
    <img class="tong-41" src="/transys/image/cm/tong-410.png" />
    <div class="v-41-tong-1"></div>
    <div class="v-41-tong-2"></div>
    <div class="v-41-tong-3"></div>
    <img class="tong-42" src="/transys/image/cm/tong-420.png" />
    <div class="v-42-tong-1"></div>
    <div class="v-42-tong-2"></div>
    <div class="v-42-tong-3"></div>
    <img class="tong-43" src="/transys/image/cm/tong-430.png" />
    <div class="v-43-tong-1"></div>
    <div class="v-43-tong-2"></div>
    <div class="v-43-tong-3"></div>
    <img class="tong-44" src="/transys/image/cm/tong-440.png" />
    <div class="v-44-tong-1"></div>
    <div class="v-44-tong-2"></div>
    <div class="v-44-tong-3"></div>
    <img class="tong-45" src="/transys/image/cm/tong-450.png" />
    <div class="v-45-tong-1"></div>
    <div class="v-45-tong-2"></div>
    <div class="v-45-tong-3"></div>
    <img class="tong-46" src="/transys/image/cm/tong-460.png" />
    <div class="v-46-tong-1"></div>
    <div class="v-46-tong-2"></div>
    <div class="v-46-tong-3"></div>
    <img class="tong-47" src="/transys/image/cm/tong-470.png" />
    <div class="v-47-tong-1"></div>
    <div class="v-47-tong-2"></div>
    <div class="v-47-tong-3"></div>
    <img class="tong-48" src="/transys/image/cm/tong-480.png" />
    <div class="v-48-tong-1"></div>
    <div class="v-48-tong-2"></div>
    <div class="v-48-tong-3"></div>
    <img class="con-off-1" src="/transys/image/cm/con-off-10.png" />
    <img class="con-on-1" src="/transys/image/cm/con-on-10.png" />
    <img class="con-off-2" src="/transys/image/cm/con-off-20.png" />
    <img class="con-on-2" src="/transys/image/cm/con-on-20.png" />
    <img class="con-off-3" src="/transys/image/cm/con-off-30.png" />
    <img class="con-on-3" src="/transys/image/cm/con-on-30.png" />
    <img class="con-off-4" src="/transys/image/cm/con-off-40.png" />
    <img class="con-on-4" src="/transys/image/cm/con-on-40.png" />
    <img class="con-off-5" src="/transys/image/cm/con-off-50.png" />
    <img class="con-on-5" src="/transys/image/cm/con-on-50.png" />
    <img class="con-off-6" src="/transys/image/cm/con-off-60.png" />
    <img class="con-on-6" src="/transys/image/cm/con-on-60.png" />
    <img class="con-off-7" src="/transys/image/cm/con-off-70.png" />
    <img class="con-on-7" src="/transys/image/cm/con-on-70.png" />
    <img class="con-off-8" src="/transys/image/cm/con-off-80.png" />
    <img class="con-on-8" src="/transys/image/cm/con-on-80.png" />
    <!-- img class="con-off-9" src="/transys/image/cm/con-off-90.png" />
    <img class="con-on-9" src="/transys/image/cm/con-on-90.png" />
    <img class="con-off-10" src="/transys/image/cm/con-off-100.png" />
    <img class="con-on-10" src="/transys/image/cm/con-on-100.png" /> -->
    <img class="con-off-11" src="/transys/image/cm/con-off-110.png" />
    <img class="con-on-11" src="/transys/image/cm/con-on-110.png" />
    <img class="con-off-12" src="/transys/image/cm/con-off-120.png" />
    <img class="con-on-12" src="/transys/image/cm/con-on-120.png" />
    <!-- <img class="con-off-13" src="/transys/image/cm/con-off-130.png" />
    <img class="con-on-13" src="/transys/image/cm/con-on-130.png" />
    <img class="con-off-14" src="/transys/image/cm/con-off-140.png" />
    <img class="con-on-14" src="/transys/image/cm/con-on-140.png" /> -->
    <!-- <img class="con-off-15" src="/transys/image/cm/con-off-150.png" />
    <img class="con-on-15" src="/transys/image/cm/con-on-150.png" />
    <img class="con-off-16" src="/transys/image/cm/con-off-160.png" />
    <img class="con-on-16" src="/transys/image/cm/con-on-160.png" /> -->
    <!-- <img class="con-off-17" src="/transys/image/cm/con-off-170.png" />
    <img class="con-on-17" src="/transys/image/cm/con-on-170.png" />
    <img class="con-off-18" src="/transys/image/cm/con-off-180.png" />
    <img class="con-on-18" src="/transys/image/cm/con-on-180.png" /> -->
    <img class="con-off-19" src="/transys/image/cm/con-off-190.png" />
    <img class="con-on-19" src="/transys/image/cm/con-on-190.png" />
    <img class="con-off-20" src="/transys/image/cm/con-off-200.png" />
    <img class="con-on-20" src="/transys/image/cm/con-on-200.png" />
    <!-- <img class="con-off-21" src="/transys/image/cm/con-off-210.png" />
    <img class="con-on-21" src="/transys/image/cm/con-on-210.png" />
    <img class="con-off-22" src="/transys/image/cm/con-off-220.png" />
    <img class="con-on-22" src="/transys/image/cm/con-on-220.png" /> -->
    <!-- <img class="con-off-23" src="/transys/image/cm/con-off-230.png" />
    <img class="con-on-23" src="/transys/image/cm/con-on-230.png" />
    <img class="con-off-24" src="/transys/image/cm/con-off-240.png" />
    <img class="con-on-24" src="/transys/image/cm/con-on-240.png" /> -->
    <img class="con-off-25" src="/transys/image/cm/con-off-250.png" />
    <img class="con-on-25" src="/transys/image/cm/con-on-250.png" />
    <img class="con-off-26" src="/transys/image/cm/con-off-260.png" />
    <img class="con-on-26" src="/transys/image/cm/con-on-260.png" />
    <img class="con-off-27" src="/transys/image/cm/con-off-270.png" />
    <img class="con-on-27" src="/transys/image/cm/con-on-270.png" />
    <img class="con-off-28" src="/transys/image/cm/con-off-280.png" />
    <img class="con-on-28" src="/transys/image/cm/con-on-280.png" />
    <img class="con-off-29" src="/transys/image/cm/con-off-290.png" />
    <img class="con-on-29" src="/transys/image/cm/con-on-290.png" />
    <img class="con-off-30" src="/transys/image/cm/con-off-300.png" />
    <img class="con-on-30" src="/transys/image/cm/con-on-300.png" />
    <img class="con-off-31" src="/transys/image/cm/con-off-310.png" />
    <img class="con-on-31" src="/transys/image/cm/con-on-310.png" />
    <img class="con-off-32" src="/transys/image/cm/con-off-320.png" />
    <img class="con-on-32" src="/transys/image/cm/con-on-320.png" />
    <img class="con-off-33" src="/transys/image/cm/con-off-330.png" />
    <img class="con-on-33" src="/transys/image/cm/con-on-330.png" />
    <img class="con-off-34" src="/transys/image/cm/con-off-340.png" />
    <img class="con-on-34" src="/transys/image/cm/con-on-340.png" />
    <img class="con-off-35" src="/transys/image/cm/con-off-350.png" />
    <img class="con-on-35" src="/transys/image/cm/con-on-350.png" />
    <img class="con-off-36" src="/transys/image/cm/con-off-360.png" />
    <img class="con-on-36" src="/transys/image/cm/con-on-360.png" />
    <img class="con-off-37" src="/transys/image/cm/con-off-370.png" />
    <img class="con-on-37" src="/transys/image/cm/con-on-370.png" />
    <img class="con-off-38" src="/transys/image/cm/con-off-380.png" />
    <img class="con-on-38" src="/transys/image/cm/con-on-380.png" />
    <img class="con-off-39" src="/transys/image/cm/con-off-390.png" />
    <img class="con-on-39" src="/transys/image/cm/con-on-390.png" />
    <img class="con-off-40" src="/transys/image/cm/con-off-400.png" />
    <img class="con-on-40" src="/transys/image/cm/con-on-400.png" />
    <img class="con-off-41" src="/transys/image/cm/con-off-410.png" />
    <img class="con-on-41" src="/transys/image/cm/con-on-410.png" />
    <img class="con-off-42" src="/transys/image/cm/con-off-420.png" />
    <img class="con-on-42" src="/transys/image/cm/con-on-420.png" />
    <img class="con-off-43" src="/transys/image/cm/con-off-430.png" />
    <img class="con-on-43" src="/transys/image/cm/con-on-430.png" />
    <img class="con-off-44" src="/transys/image/cm/con-off-440.png" />
    <img class="con-on-44" src="/transys/image/cm/con-on-440.png" />
    <img class="con-off-45" src="/transys/image/cm/con-off-450.png" />
    <img class="con-on-45" src="/transys/image/cm/con-on-450.png" />
    <img class="con-off-46" src="/transys/image/cm/con-off-460.png" />
    <img class="con-on-46" src="/transys/image/cm/con-on-460.png" />
    <!-- <img class="con-off-47" src="/transys/image/cm/con-off-470.png" />
    <img class="con-on-47" src="/transys/image/cm/con-on-470.png" />
    <img class="con-off-48" src="/transys/image/cm/con-off-480.png" />
    <img class="con-on-48" src="/transys/image/cm/con-on-480.png" /> -->
   <!--  <img class="con-off-49" src="/transys/image/cm/con-off-490.png" />
    <img class="con-on-49" src="/transys/image/cm/con-on-490.png" />
    <img class="con-off-50" src="/transys/image/cm/con-off-500.png" />
    <img class="con-on-50" src="/transys/image/cm/con-on-500.png" /> -->
    <!-- <img class="con-off-51" src="/transys/image/cm/con-off-510.png" />
    <img class="con-on-51" src="/transys/image/cm/con-on-510.png" />
    <img class="con-off-52" src="/transys/image/cm/con-off-520.png" />
    <img class="con-on-52" src="/transys/image/cm/con-on-520.png" /> -->
    <img class="con-off-53" src="/transys/image/cm/con-off-530.png" />
    <img class="con-on-53" src="/transys/image/cm/con-on-530.png" />
    <img class="con-off-54" src="/transys/image/cm/con-off-540.png" />
    <img class="con-on-54" src="/transys/image/cm/con-on-540.png" />
    <img class="con-off-55" src="/transys/image/cm/con-off-550.png" />
    <img class="con-on-55" src="/transys/image/cm/con-on-550.png" />
    <img class="con-off-56" src="/transys/image/cm/con-off-560.png" />
    <img class="con-on-56" src="/transys/image/cm/con-on-560.png" />
    <img class="con-off-57" src="/transys/image/cm/con-off-570.png" />
    <img class="con-on-57" src="/transys/image/cm/con-on-570.png" />
    <img class="con-off-58" src="/transys/image/cm/con-off-580.png" />
    <img class="con-on-58" src="/transys/image/cm/con-on-580.png" />
    <img class="con-off-59" src="/transys/image/cm/con-off-590.png" />
    <img class="con-on-59" src="/transys/image/cm/con-on-590.png" />
    <img class="con-off-542" src="/transys/image/cm/con-off-541.png" />
    <img class="con-on-542" src="/transys/image/cm/con-on-541.png" />
    <img class="con-off-532" src="/transys/image/cm/con-off-531.png" />
    <img class="con-on-532" src="/transys/image/cm/con-on-531.png" />
    <img class="con-off-543" src="/transys/image/cm/con-off-542.png" />
    <img class="con-on-543" src="/transys/image/cm/con-on-542.png" />
    <img class="con-off-533" src="/transys/image/cm/con-off-532.png" />
    <img class="con-on-533" src="/transys/image/cm/con-on-532.png" />
    <img class="con-off-544" src="/transys/image/cm/con-off-543.png" />
    <img class="con-on-544" src="/transys/image/cm/con-on-543.png" />
    <!-- <img class="con-off-534" src="/transys/image/cm/con-off-533.png" />
    <img class="con-on-534" src="/transys/image/cm/con-on-533.png" />
    <img class="con-off-545" src="/transys/image/cm/con-off-544.png" />
    <img class="con-on-545" src="/transys/image/cm/con-on-544.png" /> -->
    <img class="con-off-535" src="/transys/image/cm/con-off-534.png" />
    <img class="con-on-535" src="/transys/image/cm/con-on-534.png" />
    <img class="con-off-546" src="/transys/image/cm/con-off-545.png" />
    <img class="con-on-546" src="/transys/image/cm/con-on-545.png" />
    <img class="con-off-536" src="/transys/image/cm/con-off-535.png" />
    <img class="con-on-536" src="/transys/image/cm/con-on-535.png" />
    <img class="con-off-547" src="/transys/image/cm/con-off-546.png" />
    <img class="con-on-547" src="/transys/image/cm/con-on-546.png" />
    <img class="con-off-537" src="/transys/image/cm/con-off-536.png" />
    <img class="con-on-537" src="/transys/image/cm/con-on-536.png" />
    <img class="con-off-548" src="/transys/image/cm/con-off-547.png" />
    <img class="con-on-548" src="/transys/image/cm/con-on-547.png" />
    <img class="con-off-538" src="/transys/image/cm/con-off-537.png" />
    <img class="con-on-538" src="/transys/image/cm/con-on-537.png" />
    <img class="con-off-549" src="/transys/image/cm/con-off-548.png" />
    <img class="con-on-549" src="/transys/image/cm/con-on-548.png" />
    <img class="con-off-539" src="/transys/image/cm/con-off-538.png" />
    <img class="con-on-539" src="/transys/image/cm/con-on-538.png" />
    <img class="con-off-5410" src="/transys/image/cm/con-off-549.png" />
    <img class="con-on-5410" src="/transys/image/cm/con-on-549.png" />
    <img class="con-off-5310" src="/transys/image/cm/con-off-539.png" />
    <img class="con-on-5310" src="/transys/image/cm/con-on-539.png" />
    <img class="con-off-5411" src="/transys/image/cm/con-off-5410.png" />
    <img class="con-on-5411" src="/transys/image/cm/con-on-5410.png" />
    <img class="con-off-5311" src="/transys/image/cm/con-off-5310.png" />
    <img class="con-on-5311" src="/transys/image/cm/con-on-5310.png" />
    <img class="con-off-5412" src="/transys/image/cm/con-off-5411.png" />
    <img class="con-on-5412" src="/transys/image/cm/con-on-5411.png" />
    <img class="con-off-5312" src="/transys/image/cm/con-off-5311.png" />
    <img class="con-on-5312" src="/transys/image/cm/con-on-5311.png" />
    <img class="con-off-5413" src="/transys/image/cm/con-off-5412.png" />
    <img class="con-on-5413" src="/transys/image/cm/con-on-5412.png" />
    <img class="con-off-5313" src="/transys/image/cm/con-off-5312.png" />
    <img class="con-on-5313" src="/transys/image/cm/con-on-5312.png" />
    <img class="con-off-5414" src="/transys/image/cm/con-off-5413.png" />
    <img class="con-on-5414" src="/transys/image/cm/con-on-5413.png" />
    <img class="con-off-5314" src="/transys/image/cm/con-off-5313.png" />
    <img class="con-on-5314" src="/transys/image/cm/con-on-5313.png" />
    <img class="con-off-5415" src="/transys/image/cm/con-off-5414.png" />
    <img class="con-on-5415" src="/transys/image/cm/con-on-5414.png" />
    <img class="con-off-5315" src="/transys/image/cm/con-off-5314.png" />
    <img class="con-on-5315" src="/transys/image/cm/con-on-5314.png" />
    <img class="con-off-5416" src="/transys/image/cm/con-off-5415.png" />
    <img class="con-on-5416" src="/transys/image/cm/con-on-5415.png" />
    <!-- <img class="con-off-5316" src="/transys/image/cm/con-off-5315.png" />
    <img class="con-on-5316" src="/transys/image/cm/con-on-5315.png" />
    <img class="con-off-5417" src="/transys/image/cm/con-off-5416.png" />
    <img class="con-on-5417" src="/transys/image/cm/con-on-5416.png" />
    <img class="con-off-5317" src="/transys/image/cm/con-off-5316.png" />
    <img class="con-on-5317" src="/transys/image/cm/con-on-5316.png" />
    <img class="con-off-5418" src="/transys/image/cm/con-off-5417.png" />
    <img class="con-on-5418" src="/transys/image/cm/con-on-5417.png" />
    <img class="con-off-5318" src="/transys/image/cm/con-off-5317.png" />
    <img class="con-on-5318" src="/transys/image/cm/con-on-5317.png" />
    <img class="con-off-5419" src="/transys/image/cm/con-off-5418.png" />
    <img class="con-on-5419" src="/transys/image/cm/con-on-5418.png" /> -->
    <img class="con-off-5319" src="/transys/image/cm/con-off-5318.png" />
    <img class="con-on-5319" src="/transys/image/cm/con-on-5318.png" />
    <img class="con-off-5420" src="/transys/image/cm/con-off-5419.png" />
    <img class="con-on-5420" src="/transys/image/cm/con-on-5419.png" />
    <img class="con-off-5320" src="/transys/image/cm/con-off-5319.png" />
    <img class="con-on-5320" src="/transys/image/cm/con-on-5319.png" />
    <img class="con-off-5421" src="/transys/image/cm/con-off-5420.png" />
    <img class="con-on-5421" src="/transys/image/cm/con-on-5420.png" />
    <div class="door-red-1"></div>
    <div class="door-green-1"></div>
    <div class="door-red-2"></div>
    <div class="door-green-2"></div>
    <div class="door-red-3"></div>
    <div class="door-green-3"></div>
    <div class="door-red-4"></div>
    <div class="door-green-4"></div>
    <div class="door-red-5"></div>
    <div class="door-green-5"></div>
    <div class="door-red-6"></div>
    <div class="door-green-6"></div>
    <div class="door-red-7"></div>
    <div class="door-green-7"></div>
    <div class="door-red-8"></div>
    <div class="door-green-8"></div>
    <div class="door-red-9"></div>
    <div class="door-green-9"></div>
    <div class="door-red-10"></div>
    <div class="door-green-10"></div>
    <div class="door-red-11"></div>
    <div class="door-green-11"></div>
    <div class="door-red-12"></div>
    <div class="door-green-12"></div>
    <img class="lamp-green-1" src="/transys/image/cm/lamp-green-10.png" />
    <img class="pen-rol-1" src="/transys/image/cm/pen-rol-10.png" />
    <img class="lamp-green-2" src="/transys/image/cm/lamp-green-20.png" />
    <img class="pen-rol-2" src="/transys/image/cm/pen-rol-20.png" />
    <img class="lamp-green-3" src="/transys/image/cm/lamp-green-30.png" />
    <img class="pen-rol-3" src="/transys/image/cm/pen-rol-30.png" />
    <div class="process-data-box"></div>
    <div class="process-sp-box"></div>
    <div class="process-pv-box"></div>
    <div class="process-sp-text">설정온도 (℃)</div>
    <div class="process-pv-text">현재온도 (℃)</div>
    <div class="process-sp-box2"></div>
    <div class="process-pv-box2"></div>
    <div class="process-sp-text2">설정시간 [분]</div>
    <div class="process-pv-text2">잔여시간 [분]</div>
    <div class="pro-box-1"></div>
    <div class="pro-text-1">균열-2실</div>
    <div class="crack-pv-2"></div>
    <div class="crack-sp-2"></div>
    <div class="pro-box-2"></div>
    <div class="pro-text-2">균열-1실</div>
    <div class="crack-pv-1"></div>
    <div class="crack-sp-1"></div>
    <div class="pro-box-3"></div>
    <div class="pro-text-3">가열실</div>
    <div class="hit-pv-1"></div>
    <div class="hit-sp-1"></div>
    <div class="pro-box-4"></div>
    <div class="pro-text-4">RINSE조</div>
    <div class="rinse-pv-1"></div>
    <div class="rinse-sp-1"></div>
    <div class="pro-box-5"></div>
    <div class="pro-text-5">DIP조</div>
    <div class="dip-pv-1"></div>
    <div class="dip-sp-1"></div>
    <div class="pro-box-6"></div>
    <div class="pro-text-6">냉각FAN 1</div>
    <div class="cold-pv-1"></div>
    <div class="cold-sp-1"></div>
    <div class="pro-box-7"></div>
    <div class="pro-text-7">냉각FAN 2</div>
    <div class="cold-pv-2"></div>
    <div class="cold-sp-2"></div>
    <div class="pro-box-8"></div>
    <div class="pro-text-8">소려로</div>
    <div class="tem-sp-1"></div>
    <div class="tem-pv-1"></div>
    <div class="pro-box-9"></div>
    <div class="pro-text-9">NO.2 AIR</div>
    <div class="n-air-sp-2"></div>
    <div class="n-air-pv-2"></div>
    <div class="pro-box-10"></div>
    <div class="pro-text-10">NO.2 RINSE</div>
    <div class="n-rinse-sp"></div>
    <div class="dip-pv-12"></div>
    <div class="pro-box-11"></div>
    <div class="pro-text-11">NO.2 SPRAY</div>
    <div class="dip-sp-12"></div>
    <div class="dip-pv-13"></div>
    <div class="pro-box-12"></div>
    <div class="pro-text-12">NO.2 DIP조</div>
    <div class="dip-sp-13"></div>
    <div class="dip-pv-14"></div>
    <div class="pro-box-13"></div>
    <div class="pro-text-13">NO.1 AIR</div>
    <div class="dip-sp-14"></div>
    <div class="dip-pv-15"></div>
    <div class="pro-box-14"></div>
    <div class="pro-text-14">NO.1 RINSE</div>
    <div class="dip-sp-15"></div>
    <div class="dip-pv-16"></div>
    <div class="pro-box-15"></div>
    <div class="pro-text-15">NO.1 SPRAY</div>
    <div class="dip-sp-16"></div>
    <div class="dip-pv-17"></div>
    <div class="pro-box-16"></div>
    <div class="pro-text-16">NO.1 DIP조</div>
    <div class="dip-sp-17"></div>
    <div class="dip-pv-18"></div>
    <div class="sensor-pen-1"></div>
  	<div class="sensor-pen-2"></div>
  	<div class="sensor-pen-3"></div>
  	<img class="wash-1" src="/transys/image/cm/wash-10.png" />
	<img class="wash-2" src="/transys/image/cm/wash-20.png" />
	<img class="wash-3" src="/transys/image/cm/wash-30.png" />
	<img class="wash-4" src="/transys/image/cm/wash-40.png" />
  </div>
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
		url:"/transys/cm/cm02/view",
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
	if(tong_split[0] == "tong"){
		var tong_tag1 = "v-"+(tong_split[1])+"-"+tong_split[0]+"-1";
		var tong_tag2 = "v-"+(tong_split[1])+"-"+tong_split[0]+"-2";
		var tong_tag3 = "v-"+(tong_split[1])+"-"+tong_split[0]+"-3";		
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
 