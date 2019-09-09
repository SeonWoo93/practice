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
	#h2 {
	border:1px solid #c4c4c0;
	}
	#queContent {
	width:100%;
	height:120px;
	border:1px solid #c4c4c0;
	}
	#operationGuide {
	width:100%;
	height:100%;
	border:1px solid #c4c4c0;
	margin-bottom:10%;
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
<label class="que" style="font-size:30px; margin-bottom:2%;">이용안내 및 약관</label>


</div> <!-- 자주 묻는 질문 -->

<div class="vertical-menu" style=" align:center; ">
 <a href="/st/views/customerService/cs.jsp">자주 묻는 질문 FAQ</a>
           <a href="/st/views/customerService/mtmQue.jsp">1 : 1 문의하기</a>
           <a onclick="myQue();">나의 문의 관리</a>
            <a href="guide.jsp">이용안내 / 약관</a>

</div> <!-- 옆에 메뉴 -->

    <!-- 여기부터 하면 됨! -->
    
    <div class="detail">
   
   <div id="operationGuide"  >
  
   <div style="margin-top:10px; margin-left:15px; maring-rigint:15px;">
   쉐어띵스는 공유를 통해 삶의 여유를 제공하는 개인간의 거래 중심의 마켓입니다. 누구나 
  개인의 물건을 나눌 수 있는 공간으로, 다양한 개인들이 모여 자유롭고 편리하게 안전한 거래를
  할 수 있습니다. 
  <br>
  </div>
  
  <div style="font-weight:bold; margin-top:10px; margin-left:15px; maring-rigint:15px; margin-bottom:30px;">
  * 건강한 거래 환경과 다수의 정상적인 회원 보호를 위해, 운영정책을 준수하지 않은 경우 
  쉐어띵스는 관련 행위를 확인 후 결과에 따라 해당 회원의 사이트 이용을 한시적/영구적으로 일부 
  또는 전체 제한 할 수 있습니다.<br>
  * 운영정책은 쉐어띵스 약관을 포함합니다. 
   </div>
   
   <div style="margin-top:10px; margin-left:15px; maring-rigint:15px;">
   <h4>1. 물품 / 글</h4> <br>
   깨끗한 거래 환경을 위해 물품과 글(이미지 포함)은 시스템과 모니터링, 회원 신고에 따라 운영됩니다.<br>
   <br>
   - 마켓 내 상업적 홍보(스팸 등), 타 서비스 유도, 도배 행위, 검색노출을 목적으로 한 다수의 키워드 삽입, 
   게시공간의 성격에 맞지 않는 글, 음란성 글, 잘못된 카테고리 등록, 
   무의미한(장난성) 아이템, 올바르지 않은 가격 아이템(1원 등)의 경우 사전안내 없이 수정 또는 삭제될 수 있습니다.
<br>

- 다수의 회원이 선정성(과도한 신체 노출 등), 차별적인 내용(종교, 인종 등), 성적 수치심이나 불쾌감을 유발하는 사유로 불편 
신고를 한 아이템/글은 헬로마켓의 판단에 따라 수정 권고 또는 삭제될 수 있습니다.


- 쉐어띵스 서비스에 대해 타 회원에게 오해를 일으키는 등 부정적인 영향을 미칠 수 있거나, 서비스에 방해(피해)가 발생할 수 있는 글은 
사전안내 없이 삭제될 수 있습니다. (운영정책 위반으로 조사 중인 사안의 세부정보 또는 결과를 포함하는 내용 포함)
   
   
   </div>
   
   <div style="margin:15px; margin-top:40px;">
   <h4>1) 거래부적합 아이템
	아래의 거래부적합 아이템은 이용약관 및 현행 법률에 따라 마켓 내 등록 및 거래를 금지합니다.</h4>

- 주류<br>
- 담배<br>
- 의약품<br>
- 도수 있는 안경, 콘택트렌즈<br>
- 개인정보(신분증, 게임계정 등)<br>
- 성인용품(콘돔 제외)<br>
- 불법복제품<br>
- 반려동물<br>
   
   </div> <!--거래 부적합 아이템 -->
   
   <div style="margin:15px; margin-top:40px;">
   <h4>2. 회원간 매너</h4>
   
   1) 서로를 존중하는 말로 대화하고, 상대가 불편함을 느낄 수 있는 표현과 거부하는 행동은 삼가해주세요.<br>
- 욕설, 비방/비하, 명예훼손, 일방적인 반말 등은 ‘비매너’표현입니다<br>
- 공개된 공간에서의 ‘비매너’ 글(닉네임 포함), 다른 회원의 개인정보 또는 대화내용을 동의없이 공개하는 글, 분쟁을 유도하는 글, 허위사실 유포 등은 금지합니다.<br>
- 상대가 성희롱으로 느낄 수 있는 표현은 주의해주세요.(아이템과 관계없는 판매회원의 외모에 대한 표현, 무리한 착샷 요구 등)<br>
- 무리한 가격 에누리, 밤늦은 시간의 헬로톡 대화 요구, 구매 강요 행위 등은 비매너 신고될 수 있습니다.<br>
- 아이템의 높은 가격에 대한 조언은 헬로톡으로 이야기 해주세요. 모든 회원들에게 공개되는 아이템 댓글을 통한 조언은 판매회원의 입장에서 거래방해로 여겨질 수 있습니다.<br>
- 상습적으로 마켓 내 구매아이템을 웃돈을 받아 되파는 행위로 신고될 경우 제재 사유가 될 수 있으니 유의해주세요.<br>
- 헬로마켓 운영진, 직원 또는 관계자를 사칭하는 행위는 엄격히 금지합니다.<br>



2) 거래 약속은 서로 지키기 위해 노력하고, 부득이한 사정으로 거래를 파기할 경우 상대에게 충분히 양해를 구해주세요.
- 상습적인 거래파기나 상대와 직접 만나서 거래를 약속한 후 불이행(연락두절 등)하는 행위는 제재사유가 될 수 있습니다.
- 거래피해 상대회원의 개인정보 노출은 자제해주세요. 상대회원으로부터 확인한 정보가 거래와 무관한 타인의 도용된 정보일 경우, 게시한 회원에게 피해가 발생할 수 있습니다.
거래피해는 [쉐어띵스 > 1:1문의하기]로 증빙자료와 함께 신고해주세요.
   
   
   </div>
   
   <div style="margin:15px; margin-top:40px;">
   <h4>3. 거래후기</h4>
   쉐어띵스 거래후기는 마켓 내 거래를 마치고 서로의 거래경험을 나누는 공간입니다. 거래후기는 추천을 포함하여 모든 회원들에게 공유되며, 다른 회원의 거래에도 도움이 될 수 있습니다.<br>


<h5 style="font-weight:bold;">신뢰할 수 있는 정직한 후기 공유를 위해 아래의 유의사항을 준수해주세요.</h5>


1) 거래후기는 원칙적으로 작성한 회원이 삭제를 할 수 있습니다.<br>


2) ' 비매너 표현 '을 포함한 부적합한 글은 사전안내 없이 삭제될 수 있습니다.<br>


3) 후기 대상 회원의 소명요청이 접수될 경우 헬로마켓의 신중한 검토 및 판단에 따라 아래의 부적합한 후기는 수정 또는 삭제될 수 있습니다.<br>

- ‘ 비매너 ’ 표현이 포함된 경우<br>
- 허위정보가 포함된 경우<br>
- 상대회원의 개인정보 또는 대화내용을 동의없이 공개하는 경우<br>
- 법령 및 상거래의 일반원칙을 위반하는 내용<br>
- 범죄적 행위에 결부된다고 인정되는 경우<br>
- 후기 및 추천을 빌미로 환불, 추가적인 보상, 상대회원에게 좋은 후기를 남기도록 강요하는 행위<br>
4) 다수의 계정을 생성하여 허위후기를 등록하는 부정행위는 금지합니다<br>

   
   
   
   </div>
   
   
   
   
   
   </div> <!-- oprationGuide -->
   
  
    </div> <!-- detail -->
    
    
    
   
</div> <!-- detail -->
   
<!-- footer -->
<div id="footer" >
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	<div class="col-lg-1 col-md-1">
	</div>
	<script>
function myQue(){
	location.href="/st/cslist.cs";
}
</script>
</body>
</html>