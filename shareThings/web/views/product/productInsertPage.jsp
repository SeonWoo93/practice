<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
table {
	
	
	
}

	html {
		height:100%;
	}
	.pageWrapper {
		padding:0;
		margin:0;
		height:100%;
	}
	#header {
		padding:0;
		margin:0;
		width:100%;
		
	}
	#main {
		padding:0;
		margin:0;
		width:100%;
		min-height:80%;
	}
	#footer {
		padding:0;
		margin:0;
		width:100%;
		height:100px;
	}
	#pic1{
		width:200px;
		height:500px;
		text-align:center;
		
	}
	#pic2 {
	width:1000px;
	
	}
	 /* td{
	border:1.5px solid #c4c4c0;
	
	
	}  */
	#title1{
	height:100px;
	text-align:center;
	}
	#category1{
	height:100px;
	text-align:center;
	}
	#lental1 {
	height:100px;
	text-align:center;
	}
	#info1 {
	height:200px;
	text-align:center;
	}
	#tag1 {
	height:100px;
	text-align:center;
	}
	#deal1 {
	height:100px;
	text-align:center;
	}
	#phone1 {
	height:100px;
	text-align:center;
	}
	#address1 {
	
	text-align:center;
	}
	#time1 {
	height:100px;
	text-align:center;
	}
	#modelName1 {
	height:100px;
	text-align:center;
	}
	.pho1 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.pho0 {
	display:block;

	}
	.pho2 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	clear:left;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.tb{
	margin-left:2.5%;
	
	}
	.ta{
	margin-left:2.5%;
	}
	.dta{
	margin-left:2.5%;
	}
	.p {
	margin-left:2.5%;
	}
	.zad {
	margin-left:2.5%;
	
	}
	.tta {
		margin-left:2.5%;
	
	}
	.mta{
		margin-left:2.5%;
	
	}
	.cc{
	margin-left:2.5%;
	}
	.price {
	margin-left:2.5%;
	height:100px;
	
	}
	.brand {
	margin-left:2.5%;
	
	}
	#purchasePrice2{
	height:100px;
	}
	#brand2 {
	height:100px;
	}
	.brand3 {
	margin-left:2.5%;
	}
	#as2{
	height:100px;
	}
	.as3{
	margin-left:2.5%;
	}
	#rentPrice2{
	height:100px;
	
	}
	.rentPrice3 {
	margin-left:2.5%;
	}
	#deposit2{
	height:100px;
	}
	.deposit3{
	margin-left:2.5%;
	}
	#zipCode{
	margin:14px;
	
	}
	.noshow{
		display:none;
	}
	
	
</style>
</head>
<body>

<div>
<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
		
<!-- <label>※ </label> -->


<hr>
<div id="photo">
<form name="productInsertForm" action="<%=request.getContextPath() %>/productInsert.pd" encType="multipart/form-data" method="post">
<table align="center">

<tr>
<td colspan="1"></td>
<td class="teduri" colspan="3" id="pic1">사진등록(*필수)</td>
<td colspan="7" id="pic2">

<div class="pho0">
<!--  -->
<div class="pho2" id="img1Area">
<img id="img1" style="width:100%; height:220px;">
</div>

<div class="pho1" id="img2Area">
<img id="img2" style="width:100%; height:220px;">
</div>


<div class="pho1" id="img3Area">
<img id="img3" style="width:100%; height:220px;">
</div>

</div> <!-- pho0 -->

<div class="pho0">





<div class="pho2" id="img4Area">
<img id="img4" style="width:100%; height:220px;">
</div>
<div class="pho1" id="img5Area">
<img id="img5" style="width:100%; height:220px;">
</div>
<div class="pho1" id="img6Area">
<img id="img6" style="width:100%; height:220px;">
</div>


</div> <!-- pho0 -->







</td>
<td colspan="1"></td>

</tr>

<tr>



</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="title1">제목(*필수)</td>
<td colspan="7" id="title2">

<input autocomplete="off" class="tb" type="text" name="title" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="category1">카테고리(*필수)</td>


<td colspan="7" id="category2">

 <select id="big" class="cc" style="width:150px; height:50px; text-align:center;">

<option >대분류</option>
<option>전자기기</option>
<option>취미/레저</option>
<option>유아동</option>
<option>반려동물</option>

</select>
<select id="mid"class="cc" style="width:150px; height:50px; text-align:center;">

<option>중분류</option>


</select>
<select id="small"class="cc" style="width:150px; height:50px; text-align:center;">

<option>소분류</option>

</select> 

</td>
<td colspan="1"><div  style="display:none;"> <input type="text" id="userNo" name="userNo" value="<%= loginUser.getUno() %>"><input type="text" id="ctgId" name="ctgId"></div></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="lental1">렌탈 가능 기간(*필수)</td>

<td colspan="7" id="lental2">
	<div class="ui left icon fluid input datePicker" style="margin-left:2.5%; width:30%; float:left;">
											<input autocomplete="off" type="text" name="startDay" id="startDay" placeholder="대여 시작일">
											<i class="calendar alternate outline icon"></i>
										</div>
										
										<div class="ui left icon fluid input datePicker" style="margin-left:2.5%; width:30%; float:left;">
											<input autocomplete="off" type="text" name="endDay" id="endDay" placeholder="대여 종료일">
											<i class="calendar alternate outline icon"></i>
										</div>
</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="info1">내용(*필수)</td>
<td colspan="7" id="info2">

<textarea name="content" class="ta" style="width:90%; height:150px;" id="productdetail" row="15" col="50" placeholder="아이템 정보를 상세히 입력하세요"></textarea>


</td>
<td colspan="1"></td>
</tr>





<tr>
<td colspan="1"></td>
<td colspan="3" id="phone1">전화번호(*필수)</td>
<td colspan="7" id="phone2">
<input class="p"type="text" name="hp1" style="width:30%; height:30px; margin-bottom:5px; " placeholder="  hp" value="<%= loginUser.getPhone()%>"><br>

<input class="p"type="text" name="em1" style="width:30%; height:30px; " placeholder="  비상연락망">




</td>
<td colspan="1"></td>
</tr>

<tr>
					
					
					<td colspan="1"></td>
					<td colspan="3" rowspan="2" style="text-align:center;">주소지</td>
					<td colspan="7" >
					<%
					String add[] = loginUser.getAddress().split("[|]");
					String zipCode =  add[0];
					String address1 = add[1];
					String address2 = add[2];%>
						<div id="ad1" class="show">
					    <input type="hidden" id="confmKey" name="confmKey" value=""  > 
						<input type="text" id="zipCode" name="zipNo" readonly value="<%= zipCode %>" style="width:100px;  text-align:center; margin-left:2.5%;">
						<input type="button"  value="주소검색" id="addressSearch"> <input type="button"  value="새로운 배송지" id="nlocation">
						</div>
					</td>
					<td colspan="1"></td>
				</tr>
				
				
				<tr>
					<td colspan="1"></td>
						<td colspan="7">
							<input type="text" id="address1" name="address1" style="width:40%; margin:2%; margin-left:2.5%;" value="<%= address1 %>">
							<input type="text" id="address2" name="address2" style="width:40%; text-align:center;" value="<%= address2 %>">
						</td>
							<td colspan="1"></td>
				</tr>
<!-- <tr>
<td colspan="1"></td>
<td colspan="3" id="address1">주소지</td>
<td colspan="7" id="address2">

<input class="zad" type="text" name="zipcode" style="width:20%; height:30px; " placeholder="  우편번호">
<button style="background:#c4c4c0" >검색</button>
<br>
<input class="zad" type="text" name="add" style="width:50%; height:30px; " placeholder="  주소">
<br>
<input class="zad" type="text" name="dadd" style="width:50%; height:30px; " placeholder="  상세주소">




</td>
<td colspan="1"></td>
</tr> -->

<tr>
<td colspan="1"></td>
<td colspan="3" id="time1">제품구입시기</td>
<td colspan="7" id="time2">
<!-- <input class="tta" type="text" name="textfield" style="width:30%; height:30px; " placeholder="제품 구입 시기 입력"> -->
<div class="ui left icon fluid input datePicker" style="margin-left:2.5%; width:30%; float:left;">
											<input autocomplete="off" type="text" name="buyDay" id="buyDay" placeholder="구입시기">
											<i class="calendar alternate outline icon"></i>
										</div>


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="modelName1">모델명(*필수)</td>
<td colspan="7" id="modelName2">

<input autocomplete="off" class="mta"type="text" name="pmodel" style="width:30%; height:30px; " placeholder="모델명 입력">
</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="purchasePrice1" style="text-align:center" >구입가</td>
<td colspan="7" id="purchasePrice2" >

<input autocomplete="off" name="purchasePrice" class="price" type="text" name="purchasePrice" style="width:30%; height:30px; ">
<label>원</label>
</td>
<td colspan="1"></td>

</tr>
 
<!-- <tr>
<td colspan="1"></td>
<td colspan="3" id="brand1" style="text-align:center">물품스펙 / 브랜드명</td>
<td colspan="7" id="brand2">
<input class="brand3" type="text" name="textfield" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">

</td>
<td colspan="1"></td>


</tr> -->

<tr>
<td colspan="1"></td>
<td colspan="3" id="as1" style="text-align:center">최근 A/S이력</td>
<td colspan="7" id="as2">
<input autocomplete="off" class="as3" type="text" name="asHistory" style="width:700px; 
height:40px; left:0;" placeholder="  내용을 입력해주세욧">


</td>
<td colspan="1"></td>
</tr>

<tr>
<td colspan="1"></td>
<td colspan="3" id="rentPrice1" style="text-align:center">희망 렌탈비(주단위)(*필수)</td>
<td colspan="7" id="rentPrice2">
<input autocomplete="off" class="rentPrice3" type="text" name="rentPrice" style="width:200px; 
height:40px; left:0;" placeholder="  가격을 입력해주세욧"><br>
<label style="margin-left:2.5%; margin-top:2%;">※ 등록 물품 대비 금액이 너무 높으면 렌탈이 어려울 수 있음을 주의하십시오!</label>


</td>
<td colspan="1"></td>
</tr>



<tr>
<td colspan="1"></td>
<td colspan="3" id="deposit1" style="text-align:center">보증금(*필수)</td>
<td colspan="7" id="deposit2">
<input autocomplete="off" class="deposit3" type="text" name="deposit" style="width:200px; 
height:40px; left:0;" placeholder="  가격을 입력해주세욧"><br>
<label style="margin-left:2.5%; margin-top:2%;">※ 희망 렌탈비 대비 보증금이 너무 높으면 렌탈이 어려울 수 있음을 주의하십시오!</label>

</td>
<td colspan="1"></td>
</tr>






</table>
<br>
		<br><br>
		
		
		<div style="margin-bottom:30px;">
		
		<ul class="pager">
    <li><a href="" style="color:#F44A0C">이전</a></li>
    <li><a onclick="pdInsert()" style="color:#0CB6F4">다음</a></li>
   
  </ul>
</div> <!-- 이전, 다음 버튼 -->
	<div  id="fileArea" style="display: none;">
		<input type="file" id="fileimg1" name="fileimg1" onchange="loadImg(this,1)">
		<input type="file" id="fileimg2" name="fileimg2" onchange="loadImg(this,2)">
		<input type="file" id="fileimg3" name="fileimg3" onchange="loadImg(this,3)">
		<input type="file" id="fileimg4" name="fileimg4" onchange="loadImg(this,4)">
		<input type="file" id="fileimg5" name="fileimg5" onchange="loadImg(this,5)">
		<input type="file" id="fileimg6" name="fileimg6" onchange="loadImg(this,6)">
	
		</div> 

</form>




</div>
		</div>
		
		</div>
		
		<div style="width:80%; margin:0 auto; text-align:center;">
		<h5 style="text-align:center; font-weight:bold; color:red;"> 아이템 등록전에 꼭 확인하세요!</h5><br>
		
		비정상적인 물품, 실 제품과 등록한 제품이 다른 물품, 거래 금지 물품에 속하는 아이템을  해당 카테고리가 아닌 잘못된 카테고리에 등록할 경우<br>
 		그 정도에 따라 경고 또는 포인트 전액 소멸, 계정제재 등의 책임을 물을 수 있음을 알려드립니다.
		<br>
		
		</div>
		<div id="footer" style="margin-top:50px;">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
	<div class="col-lg-1 col-md-1" >
	</div>
	</div>
	
	
	<script>
	 	$(function() {
		    $("#startDay").datepicker();
		    $("#endDay").datepicker();
		    $("#buyDay").datepicker();

		   
		});
	 	$("#startDay").datepicker({
	 		dateFormat:'yy-mm-dd'
	 	})
	 		$("#endDay").datepicker({
	 		dateFormat:'yy-mm-dd'
	 	})

	 		$("#buyDay").datepicker({
	 		dateFormat:'yy-mm-dd'
	 	})

	
	</script>
	<script>
		$("#addressSearch").click(function() {
			new daum.Postcode({
		    	oncomplete: function(data) {
		    		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                    document.getElementById("address1").value += "(" + extraAddr + ")";
	                	
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                    document.getElementById("address1").value += "(" + extraAddr + ")";
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("zipCode").value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
		        }
		    }).open();
		           
			
			
		})
		</script>
		
		<script>
		$(function(){
			
			$("#fileArea").hide();
			 $("#img1Area").click(function(){
				 $("#fileimg1").click();
			 })
			  $("#img2Area").click(function(){
				 $("#fileimg2").click();
			 })
			  $("#img3Area").click(function(){
				 $("#fileimg3").click();
			 })
			  $("#img4Area").click(function(){
				 $("#fileimg4").click();
			 })
			  $("#img5Area").click(function(){
				 $("#fileimg5").click();
			 })
			  $("#img6Area").click(function(){
				 $("#fileimg6").click();
			 })
			
		})
		
		function loadImg(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 : 
						$("#img1").attr("src",e.target.result);
						break;
					case 2 : 
						$("#img2").attr("src",e.target.result);
						break;
					case 3 : 
						$("#img3").attr("src",e.target.result);
						break;
					case 4 : 
						$("#img4").attr("src",e.target.result);
						break;
					case 5 : 
						$("#img5").attr("src",e.target.result);
						break;
					case 6 : 
						$("#img6").attr("src",e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		</script>
		
	<!-- 	주소지 라디오버튼 -->
		<script>
			$("#nlocation").click(function(){
				$("#zipCode").removeAttr("value");
				$("#address1").removeAttr("value");
				$("#address2").removeAttr("value");
			})
		</script>
		
		<script>
   $("#big").change(function(){
        var big = $(this).children("option:selected").val().replace("/",""); // 대분류
        var $mid = $("#mid");  // 중분류
        $.ajax({
           url:"<%= request.getContextPath() %>/categoryList.do",
           data:{big:big},
           type:"get",
           success:function(data){
              console.log("서버 전송 성공!");
               var options = "<option selected> 중분류 </option>"; 
              for(var i = 0; i < data.length; i++){
                 
                 if(i == 0){
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 } else{
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 }
              }    
              $mid.html(options); 
           },error:function(data){
              console.log("서버 전송 실패!");
           }
        });
     });
   
   
   </script>
   <script>
   $("#mid").change(function(){
        var mid = $(this).children("option:selected").val(); // 중분류
        var $small = $("#small");  // 소분류
        $.ajax({
           url:"<%= request.getContextPath() %>/categoryList2.do",
           data:{mid:mid},
           type:"get",
           success:function(data){
              console.log("서버 전송 성공!");
               var options = "<option selected> 소분류 </option>"; 
              for(var i = 0; i < data.length; i++){
                 
                 if(i == 0){
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 } else{
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 }
              }    
              $small.html(options); 
             
           },error:function(data){
              console.log("서버 전송 실패!");
           }
        });
     });
   
   
   </script>
  <!--   $("#ctgId").attr("value", ); -->
  <script>
  $("#small").change(function(){
       var small = $(this).children("option:selected").val(); // 소분류
       var $ctgId = $("#ctgId");  // 소분류번호
       $.ajax({
          url:"<%= request.getContextPath() %>/getCategoryId.do",
          data:{small:small},
          type:"get",
          success:function(data){
             console.log("서버 전송 성공!");   
             $ctgId.attr("value", data); 
             
             console.log(data);
          },error:function(data){
             console.log("서버 전송 실패!");
          }
       });
    });
  
  
  </script>
  
  
   <!-- 다음 눌렀을때 -->
		
		<script> 
			/* function loginCheck(){ 
			   var id=document.loginForm.m_id.value; 
			   var pass=document.loginForm.m_pw.value; 
			    if(id==null||id.length==0||id=='아이디'){ 
			      alert("아이디를 입력바랍니다."); 
			      document.loginForm.m_id.focus(); 
			      return; 
			  } 
			   if(pass==null||pass.length==0||pass=='비밀번호'){ 
			     alert("비밀번호를 입력바랍니다."); 
			     document.loginForm.m_pw.focus(); 
			     return; 
			    }else{  */
			    <%--  document.productInsertForm.action="<% requee/login.mo";  --%>
			   
			    function pdInsert(){
			    document.productInsertForm.submit(); 
			    }
			/*  } 
			}  */
		</script> 
		
		
</body>
</html>