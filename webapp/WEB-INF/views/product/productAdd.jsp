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
			width: 100%;
			height: 100%;
			text-align: center;
			scroll:no;
			overflow: hidden;
			color: black;
			background: #fafafa;
		}

	hr{
		width: 95%;
		margin: 10px 2.5% 2% 2.5%;
	}
	
	#wrap{
		height: 100%;
	}
	
	/* 버튼 */
	div > button{
		width: 110px;
		height: 35px;
		margin-left: 5px;
		border: 1px solid black; 
		color: #123478;
	}
	
	div > button:hover {     
		background: #123478;
		border: 1px solid #123478;
		color: white; 
	}
	
	
	/* 버튼 */
	th > button{
		width: 60px;
		height: 25px;
		border: 0px; 
		font-size: 15px;
		background: white;
		color: #123478;
	}
	
	th > button:hover {     
		background: #123478;
		border: 0px; 
		color: white; 
	}
	
	td > input{
	 	width: 50px;
	 	height: 25px;
	 	text-align: center;
	 	border: 0px;
	}
	
	td{
		border-bottom: 2px dotted #123478;
		color: #123478;
	}
	
	/* 처리조건 테이블 */
	.first_grid{
		border-bottom: 0px;
		color: black;
		font-weight: 600;
	}
	
	#contents{
		color: black;
	}
	
	/* 저장버튼 */
	.btn{
		background: #fafafa;
		padding: 10% 0%;
	}
	
	/* 왼쪽 영역 */
	.left{
		width: 45%;
		text-align: left;
		float: left;
		margin-left: 2%;
		overflow:hidden;
		background: white;
	}
	
	/* 오른쪽 영역 */
	.right{
		width: 45%;
		text-align: right;
		float: right;
		margin-right: 3%;
		overflow:hidden;
		background: white;
	}
	
	/* 오른쪽 필드셋 */
	.box_r{
		padding: 2%;
		padding-bottom: 7%;
	}
	
	/* 사이클넘버 */
	.cn_box{
		margin: 5% 0% 10% 0%;
	}
	
	/* 검사기준 */
	.gum{
		text-align: left;
		margin-bottom: 5px;
		margin-left: 3%;
		font-size:15pt;
		font-weight:700;
	}
	
	/* 검사기준 인풋 */
	.right_in{
		width: 192px;
	}
	
	.hv{
		margin-left: 24%;
	}
	
	/* 등록정보 */
	.input_info{
		margin-bottom: 10%;
		margin-left: 3%;
	}

	/* 처리조건 */
	.table_dep{
		text-align: center;
		padding-bottom: 5%;
	}
	
	/* 검사기준 */
	.insp_st{
		padding-left: 5%;
	}
	
	/* 등록정보 div */	
	.inputtxt{
		margin-bottom: 5px;
		font-size:15pt;
		font-weight:700;
	}
	
	/* 왼쪽 인풋 */	
	.left_in{
		width: 230px;
	}
	
	div > input{
		width: 100px;
		height: 25px;
		font-size:14pt;
	}
	
</style>



</head>

<body data-offset="60" data-target=".navbar">


<div id="wrap">

 
	<div id="body1">
		<div id="contents" style="margin-top: 5%;">
			<!-- <div style="color: black; font-size: 20px; padding-top: 2%;"> &lt;투입 LIST&gt; </div> -->
			<!-- <div style="color: black; font-size: 14px; padding-top: 5%; margin-left: 2.5%; text-align: left;"> <b>처리품관리</b> / 투입 LIST - 열처리 투입 리스트 등록 </div>
			<hr> -->
			<form id="addForm" name="addForm" >
				<fieldset class="left">
					<div class="input_info">
						<div style="margin: 5% 0%; text-align: left; font-size: 19px;"><b>등록정보</b></div>
						
						<div class="inputtxt"> 품&nbsp;명&nbsp;코&nbsp;드 : 								<input type="text" class="left_in" id="pumcode" name="pumcode" style="margin-left: 1px;" /></div>
						<div class="inputtxt"> 품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 : <input type="text" class="left_in" id="pumname" name="pumname" /> </div>
						<div class="inputtxt"> 기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종 : <input type="text" class="left_in" id="gijong" name="gijong" /> </div>
						<div class="inputtxt"> 품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번 : <input type="text" class="left_in" id="dobun" name="dobun" style="width: 100px;"/> ~ <input type="text" class="left_in" id="e_dobun" name="e_dobun" style="width: 100px;"/></div>
						<div class="inputtxt"> 적&nbsp;재&nbsp;수&nbsp;량 : 								<input type="text" class="left_in" id="cnt" name="cnt" style="margin-left: 2px;"/> </div>
						<div class="inputtxt"> 작&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;자 : 				<input type="text" class="left_in" id="writer" name="writer" style="margin-left: 1px;"/> </div>
						<div class="inputtxt"> 등&nbsp;록&nbsp;일&nbsp;자 : 								<input type="text" class="left_in" id="insertday" name="insertday" style="margin-left: 2px;"/> </div>
						<div class="inputtxt"> 수&nbsp;정&nbsp;일&nbsp;자 : 								<input type="text" class="left_in" id="updateday" name="updateday" style="margin-left: 2px;"/> </div>
					</div>
	
					<hr>
	
					
					<div style="text-align: left; font-size: 19px; margin-top: 7%; margin-left: 3%;"><b>처리조건</b></div>
					<div class="table_dep" style="width: 100%; margin-top: 5%; text-align: center;">
						<table id="cate_list" class="">
							<thead>
								<tr>
									<th class="" 
									style="color:#123478; width: 60px; height: 20px;"></th>
									<th class="" 
									style="color:#123478; width: 70px; height: 20px;"><button type="button" style=" font-size:14pt; font-weight:700;">침탄</button></th>
									<th class="" 
									style="color:#123478; width: 70px; height: 20px;"><button type="button" style=" font-size:14pt; font-weight:700;">확산</button></th>
									<th class="" 
									style="color:#123478; width: 70px; height: 20px;"><button type="button" style=" font-size:14pt; font-weight:700;">소입</button></th>
									<th class="" 
									style="color:#123478; width: 70px; height: 20px;"><button type="button" style=" font-size:14pt; font-weight:700;">SALT</button></th>
								</tr>
							</thead>
							
							<tbody id="cate_contents">
								<tr> 
									<td class="first_grid" 
									style="width: 60px; height: 30px; font-size: 14pt; font-weight:700;">온도</td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_tmp1" name="base_tmp1" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_tmp2" name="base_tmp2" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_tmp3" name="base_tmp3" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_tmp4" name="base_tmp4" style=" font-size: 14pt; font-weight:700;"/></td>
								</tr>
								
								<tr> 
									<td class="first_grid" 
									style="width: 60px; height: 30px; font-size: 14pt;">CP</td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cp1" name="base_cp1" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cp2" name="base_cp2" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cp3" name="base_cp3" style=" font-size: 14pt; font-weight:700;"/></td>
								</tr>
								
								<tr> 
									<td class="first_grid" 
									style="width: 60px; height: 30px; font-size: 14pt;">분</td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cyc1" name="base_cyc1" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cyc2" name="base_cyc2" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cyc3" name="base_cyc3" style=" font-size: 14pt; font-weight:700;"/></td>
									<td class="" 
									style="color:#123478; width: 70px; height: 30px;"><input type="text" id="base_cyc4" name="base_cyc4" style=" font-size: 14pt; font-weight:700;"/></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
				</fieldset>
				
				<div class="right">
					<div class="btn" style="text-align: center;">
						<button id="save_btn" type="button" style="CURSOR:pointer;"><b style="font-size:15pt; font-weight:700;">저&nbsp;&nbsp;&nbsp;장</b></button>
					</div>
				
					<fieldset class="box_r">
						<div class="cn_box">
							<div class="inputtxt"> CYCLE NO : <input type="text" id="cycleno" name="cycleno" /></div>
							<div class="inputtxt"> 아지테이터 RPM : <input type="text" id="agitate_rpm" name="agitate_rpm"/> </div>
							<div class="inputtxt"> 공통설비 투입 호기 : <input type="text" id="common_device" name="common_device"/> </div>
						</div>
						<hr>
		
						
						<div style="text-align: left; font-size: 19px; margin: 7% 0% 5% 3%;"><b>검사기준</b></div>
						
						<div class="gum"> 재&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질 : <input type="text" class="right_in" id="material" name="material" style="margin-left: 4px;" /></div>
						<div class="gum"> 단&nbsp;&nbsp;&nbsp;중&nbsp;&nbsp;&nbsp;량 : 					<input type="text" class="right_in" id="danjung" name="danjung" style=" margin-left: 5px;" /> kg</div>
						<div class="gum"> 경&nbsp;화&nbsp;깊&nbsp;이 : 									<input type="text" class="right_in" id="deepL" name="deepL" style="width: 80px; margin-left: 5px;"/> ~ <input type="text" class="right_in" id="deepH" name="deepH" style="width: 80px;" /> mm</div>
						<div class="gum"> 표&nbsp;면&nbsp;경&nbsp;도 : 		 <span class="hv">HV</span> <input type="text" class="right_in" id="surfhard" name="surfhard" style="width: 80px; margin-left: 5px;"/> 이상</div>
						<div class="gum"> 치저부경도 : 						 <span class="hv">HV</span> <input type="text" class="right_in" id="deephard" name="deephard" style="width: 80px; margin-left: 6px;"/> 이상</div>
						<div class="gum"> 치내부경도 : 						 <span class="hv">HV</span> <input type="text" class="right_in" id="inshard" name="inshard" style="width: 80px; margin-left: 6px;"/> 이상</div>
						<div class="gum"> CYCLE TIME : 						 							<input type="text" class="right_in" id="cycletime" name="cycletime" /> 분</div>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
   
    function getDobunFromURL() {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get('dobun');
    }

  
    function fetchData(dobun) {
        console.log("서버에 보내는 데이터:", JSON.stringify({ dobun: dobun }));

        $.ajax({
            url: '/transys/product/productModify/data',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({ dobun: dobun }), 
            success: function(response) {
                console.log("받아온 데이터:", response);

                // 각 입력 필드에 응답 데이터를 설정
                $("#cycleno").val(response.cycleno);
                $("#agitate_rpm").val(response.agitate_rpm);
                $("#common_device").val(response.common_device);
                $("#material").val(response.material);
                $("#danjung").val(response.danjung);
                $("#deepL").val(response.deepL);
                $("#deepH").val(response.deepH);
                $("#surfhard").val(response.surfhard);
                $("#deephard").val(response.deephard);
                $("#inshard").val(response.inshard);
                $("#cycletime").val(response.cycletime);
                

                $("#base_tmp1").val(response.base_tmp1);
                $("#base_tmp2").val(response.base_tmp2);
                $("#base_tmp3").val(response.base_tmp3);
                $("#base_tmp4").val(response.base_tmp4);
                
                $("#base_cp1").val(response.base_cp1);
                $("#base_cp2").val(response.base_cp2);
                $("#base_cp3").val(response.base_cp3);
                $("#base_cp4").val(response.base_cp4); 
                
                $("#base_cyc1").val(response.base_cyc1);
                $("#base_cyc2").val(response.base_cyc2);
                $("#base_cyc3").val(response.base_cyc3);
                $("#base_cyc4").val(response.base_cyc4);

                
                $("#pumcode").val(response.pumcode);
                $("#pumname").val(response.pumname);
                $("#gijong").val(response.gijong);
                $("#dobun").val(response.dobun);
                $("#e_dobun").val(response.e_dobun);
                $("#cnt").val(response.cnt);
                $("#writer").val(response.writer);
                $("#insertday").val(response.insertday);
                $("#updateday").val(response.updateday);
            },
            error: function(xhr, status, error) {
                console.error("데이터 가져오기 실패:", error);
            }
        });
    }



   
    $(document).ready(function() {
        const dobun = getDobunFromURL(); 
        fetchData(dobun); 
    });


    

    $("#save_btn").click(function() {
        var formData = {};
        $("fieldset input").each(function() {
            var inputName = $(this).attr("name");
            var inputValue = $(this).val();
            formData[inputName] = inputValue;
        });

       
        console.log("보내는 데이터:", formData);

        $.ajax({
            url: 'productModify/data/save', 
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert("데이터가 성공적으로 업데이트되었습니다.");
            },
            error: function(xhr, status, error) {
                console.error("업데이트 중 오류 발생:", error);
                alert("업데이트 중 오류가 발생했습니다.");
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
