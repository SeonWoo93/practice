<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
h3 {
margin-left:10%;
}
.cus {
float:left;
display:block;
}
/* #cus2 {
clear:left;
} */

#main {
width:100%;
}
	#info {
		width:100%;
	}
	
	#footer{
		clear:left;
	}
	.que {
	margin-left:22%;
	margin-top:0 auto;
	}
	.vertical-menu {
     width: 15%;
     margin-top:10px;
     float:left;
   }

   .vertical-menu a {
   text-align: center;
     background-color: #eee;
     color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
   }

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #4CAF50;
  color: white;
}
.detail {

      display:block;
      float:left;
      width:80%;
      margin-left: 3%;
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
	.rvImageArea {
		border:1px solid lightgray;
		display:inline-block;
		width:50px;
		height:50px;
		margin-bottom:10px;
		position:relative;
	}
	.rvImageArea:hover {
		border:1px solid #0CB6F4;
		cursor:pointer;
	}
	#rvImg1:hover, #rvImg2:hover, #rvImg3:hover, #rvImg4:hover, #rvImg5:hover {
		/* box-shadow:1px 1px #0CB6F4; */
	}
	#insertQue {
	
	}
</style>

</head>
<body>

<div class="col-lg-1 col-md-1">
	</div>
	
	
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main" style="">
		
<!-- header -->


<div id="info" style="margin-top:50px;">

<div class="cus">

<table>
<tr>
<td></td>
</tr>
<tr>

<td><i class="fas fa-headset fa-4x"></i></td>
</tr>
</table>

</div> <!-- cus -->
<div class="cus" id="cus2" style="margin-left:5%;">
<table>
<tr >

<td id="text1" style="font-size:25px;"><label>Customer Service</label></td>


</tr>

<tr>
<td id="text1" style="font-size:25px;"><label>02-1234</label></td>
</tr>
</table>
</div> <!-- dus -->


</div> <!-- info -->
</div> <!-- main -->


<div style="clear:left;"></div>
<hr>

<div>
<label class="que" style="font-size:30px;">1 :1 문의하기</label>


</div> <!-- 자주 묻는 질문 -->

<div class="vertical-menu" style=" align:center; ">
 <a href="cs.jsp" >자주 묻는 질문 FAQ</a>
           <a href="mtmQue.jsp">1 : 1 문의하기</a>
           <a onclick="myQue();">나의 문의 관리</a>
			<a href="../customerService/guide.jsp">이용안내</a>
			 
			
</div> <!-- 옆에 메뉴 -->

    <!-- 여기부터 하면 됨! -->
    
    <div class="detail">
    <form action="<%= request.getContextPath() %>/csInsert.cs" method="post" name="csinsert" encType="multipart/form-data">
  
    <div class="form-group" style="width:40%" >
      <label for="csName">이름</label>
      <input type="text" class="form-control" id="csName" value="<%= loginUser.getUserName() %>" readonly placeholder="내용을 입력하세요" name="csName">
    </div>
    <div class="form-group" style="width:40%">
      <label for="csPwd">연락처</label>
      <input type="text" class="form-control" id="cs" value="<%= loginUser.getPhone() %>" readonly placeholder="내용을 입력하세요" name="csPwd">
    </div>
     <div class="form-group" style="width:70%">
      <label for="csEmail">이메일</label>
      <input type="Email" class="form-control" id="csEmail" value="<%= loginUser.getEmail() %>" readonly placeholder="내용을 입력하세요" name="csEmail">
    </div>
    
    
    <div align="center" >
    <select style="width:130px; height:30px; float:right;" name="csCategory" >
    <option>배송</option>
    <option>반품</option>
    <option>물품</option>
    <option>기타</option>
   
    
    
    </select>
    </div> <!-- 카테고리 -->
    
    
    
    
    <div>
    <textarea name="content" style="width:100%; height:400px; text-align:left; margin-top:18px;" placeholder="내용을 입력하세요" ></textarea>
    
    
    </div> <!-- 내용 -->
    
   
    
   <!--  <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div> -->
    
    <div class="rvAttachArea">
									<label>사진 첨부</label><br>
									<div class="rvImageArea rvImageArea1" id="rvImg1">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg1"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea2" id="rvImg2" >
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg2"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea3" id="rvImg3">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg3"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea4" id="rvImg4">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg4"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea5" id="rvImg5">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg5"width="100%" height="100%">
									</div>
									<div id="fileArea">
										<input type="file" id="img1" name="img1" onchange="loadImg(this,1);">
										<input type="file" id="img2" name="img2" onchange="loadImg(this,2);">
										<input type="file" id="img3" name="img3" onchange="loadImg(this,3);">
										<input type="file" id="img4" name="img4" onchange="loadImg(this,4);">
										<input type="file" id="img5" name="img5" onchange="loadImg(this,5);">
										
									</div>
								</div>
								<div class="ui large blue button" id="insertQue" onclick="mtminsert()" style="margin-bottom:10%; ">등록하기</div>
								
    <!-- <button type="submit" class="btn btn-default">Submit</button> -->
  </form>
  
    
 
    
    </div> <!-- detail -->
    
    
    
   
</div> <!-- detail -->
    

<!-- footer -->
<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	<div class="col-lg-1 col-md-1">
	</div>
	

<script>
		$(function(){
			
			$("#fileArea").hide();
			 $("#rvImg1").click(function(){
				 $("#img1").click();
			 })
			  $("#rvImg2").click(function(){
				 $("#img2").click();
			 })
			  $("#rvImg3").click(function(){
				 $("#img3").click();
			 })
			  $("#rvImg4").click(function(){
				 $("#img4").click();
			 })
			  $("#rvImg5").click(function(){
				 $("#img5").click();
			 })
			
			
		})
		
		function loadImg(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					switch(num){
					case 1 : 
						$("#rvImg1").attr("src",e.target.result);
						break;
					case 2 : 
						$("#rvImg2").attr("src",e.target.result);
						break;
					case 3 : 
						$("#rvImg3").attr("src",e.target.result);
						break;
					case 4 : 
						$("#rvImg4").attr("src",e.target.result);
						break;
					case 5 : 
						$("#rvImg5").attr("src",e.target.result);
						break;
				
					}
				}
				reader.readAsDataURL(value.files[0]);			}
		}
		
		</script>

		<script>
			function mtminsert(){
		   	 	document.csinsert.submit(); 
		    }
		</script>
		<script>
function myQue(){
	location.href="/st/cslist.cs";
}

</script>

</body>
</html>