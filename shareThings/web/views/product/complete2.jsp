<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	#photo {
	text-align:center;
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
<div id="photo" >

		<br><br>
		
		<i class="far fa-check-circle fa-8x"></i>
		<h2 style="margin-bottom:20px;"> 1 : 1 문의 완료</h2>
		<h6 style="color:red; font-weight:bold;">※ 등록한 문의내용이 부적절한 내용일 때, 사이트 이용이 제한 될 수 있습니다. </h6>
			<div style="margin-bottom:50px;">
		
		<ul class="pager">

    <li><a onclick="myQueList()" style="color:#0CB6F4">나의 문의 내역</a></li>
    
  </ul>
</div>
		
		




</div><!-- photo -->
		</div>
		
		</div>
		
		<!-- <div style="width:60%; margin:0 auto">
		
		비정상적인 물품을 등록하거나, share things 사용금지 거래(상품권)에 속하는 아이템을 해당 카테고리가 아닌 잘못된 카테고리에 등록할 경우
 		그 정도에 따라 경고, 출금요청 취소, 지급된 share things 포인트 전액 소멸, 계정제재 등의 책임을 물을 수 있음을 알려드립니다.
		<br>
		
		</div> -->
		<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
	<div class="col-lg-1 col-md-1">
	</div>
	</div>
	
	<div  id="fileArea" style="display: none;">
		<input type="file" id="fileimg1" name="fileimg1" onchange="loadImg(this,1)">
		<input type="file" id="fileimg2" name="fileimg2" onchange="loadImg(this,2)">
		<input type="file" id="fileimg3" name="fileimg3" onchange="loadImg(this,3)">
		<input type="file" id="fileimg4" name="fileimg4" onchange="loadImg(this,4)">
		<input type="file" id="fileimg5" name="fileimg5" onchange="loadImg(this,5)">
		<input type="file" id="fileimg6" name="fileimg6" onchange="loadImg(this,6)">
	
		</div> 
	<script>
	 	$(function() {
		    $("#startDay").datepicker();
		    $("#endDay").datepicker();
		
		});
	 	
	
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
	<script>
	$("#cGroup").change(function(){
        var cGroup = $(this).children("option:selected").val(); // 대분류
        var $cName = $("#cName");  // 소분류
        $.ajax({
           url:"<%= request.getContextPath() %>/selectNameList.do",
           data:{cGroup:cGroup},
           type:"get",
           success:function(data){
              console.log("서버 전송 성공!");
              var options = "<option selected>-- 중분류 --</option>"; 
              for(var i = 0; i < data.length; i++){
                 
                 if(i == 0){
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 } else{
                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
                 }
              }    
              $cName.html(options);
           },error:function(data){
              console.log("서버 전송 실패!");
           }
        });
     });
	
	
	</script>
		<script>
		$("#cGroup").change(function(){
	         var $big = $(this).children("option:selected").val(); // 대분류
	         var $mid = $("#small");  // 소분류
	         $.ajax({
	            url:"<%= request.getContextPath() %>/selectNameList.do",
	            data:{big:big},
	            type:"get",
	            success:function(data){
	               console.log("서버 전송 성공!");
	               var options = "<option selected>-- 중분류 --</option>"; 
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
		
				<script>
	function myQueList(){
	location.href="/st/cslist.cs";
}

</script>
		
		
		
</body>
</html>