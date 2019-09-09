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
	<!--
	
	/** 배경 지정 */
    body {
        background: #252422;
}

    /** 목록 스타일 초기화 및 중앙 배치, 가로 폭 지정 */
    ul {
        padding: 0;
        margin: 50px auto;
        list-style: none;
        width: 100%;
}

    /** 제목 영역의 초기화 처리 */
    .title {
        padding: 0;
        margin: 0;
        
}

    /** 링크의 클릭 영역 확대 및 배경 및 폰트 처리 */
    .title > a {
        display: block;
        padding: 2px;
        font-size: 14px;
        font-weight: bold;
        text-indent: 12px;
        text-decoration: none;
        color: black;
        height: 32px;
        line-height: 32px;
        background: white;
        border-radius: 5px;
        -webkit-border-radius: 5px;
        
       
    }
    .title > a:hover {
        display: block;
        padding: 2px;
        font-size: 14px;
        font-weight: bold;
        text-indent: 12px;
        text-decoration: none;
        color: black;
        height: 32px;
        line-height: 32px;
        background: white;
        border-radius: 5px;
        -webkit-border-radius: 5px;
        
       
    }

    /** 현재 활성화된 요소에 적용할 배경이미지 지정 */
    .selected {
        background: #2288dd !important;
        color: #fff !important;
        
        /*그라디언트 지정*/
        background: linear-gradient(top, #6bb2ff 0%, #2288dd 100%) !important;
        background: -moz-linear-gradient(top, #6bb2ff, #2288dd) !important; 
        background: -webkit-gradient(linear, left top, left bottom, from(#6bb2ff), to(#2288dd)) !important;       
    }
    
    /** 내용 영역 */
    .content {
        margin: 0;
        background: #ececec;
        padding: 10px;
        height: 50px;
        overflow-y: auto;
        border-radius: 5px;
        -webkit-border-radius: 5px;
}
	#queList{
		display:block;
      float:left;
      width:100%;
     
}

	
	
	
	
	
</style>



<!--  -->


<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
  <script>
    $(document).ready(function(){
        
        /** 초기화 처리*/

        // 첫 번재 항목이 펼쳐져 있도록 처리
        $(".collapsible:eq(0) a").addClass("selected"); //첫번째 항목만 selected 클래스를 적용
        $(".collapsible").not(":eq(0)").find(".content").hide(); //첫번째 항목 이외의 content를 숨김
        
        /** 링크에 대한 클릭 이벤트 처리 */
        $(".collapsible .title a").click(function() {            
            $(this).toggleClass("selected");
            //클릭된 나 자신을 제외한 나머리 링크들은 slected 클래스를 무조건 제거
            $(".collapsible .title a").not(this).removeClass("selected"); 

            // 펼칠 내용 영역 선택
            var target = $(this).parents(".collapsible").find(".content");

            // 나머지 내용 영역을 선택
            var other = $(".collapsible .title a").not(this)
                                                  .parents(".collapsible").find(".content");

            // 애니메이션으로 열고 닫기 처리
            target.slideToggle(300);
            other.slideUp(300);
            
            // 링크 페이지 이동 중지
            return false;
        });
    });
  </script>



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
<tr>
<td></td>
</tr>
<tr>

<td><i class="fas fa-headset fa-4x"></i></td>
</tr>


</div>
<div class="cus" id="cus2" style="margin-left:5%;">
<table>
<tr >

<td id="text1" style="font-size:25px;"><label>Customer Service</label></td>


</tr>

<tr>
<td id="text1" style="font-size:25px;"><label>02-1234</label></td>
</tr>
</table>
</div>


</div>
</div>


<div style="clear:left;"></div>
<hr>

<div>
<label class="que" style="font-size:30px;">자주 묻는 질문</label>



</div>

<div class="vertical-menu" style=" align:center; ">
 <a href="/st/views/customerService/cs.jsp" >자주 묻는 질문 FAQ</a>
           <a href="/st/views/customerService/mtmQue.jsp">1 : 1 문의하기</a>
           <a onclick="myQue();">나의 문의 관리</a>
<a href="../customerService/guide.jsp">이용안내</a>
</div>


	<div class="detail">
<!-- <div class="btn-group btn-group-justified">
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4;  border:1px solid #0CB6F4; ">TOP10</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">이용 방법</button>
  </div>
  <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">배송</button>
    
  </div>
   <div class="btn-group">
    <button type="button" class="btn btn-primary" style="color:white; background:#0CB6F4; border:1px solid #0CB6F4;">판매 방법</button>
    </div>
</div> -->
    
    
    <!--  -->
    <div id="queList">
     <ul>
        <li class="collapsible">
            <h2 class="title"><a href="#html5">어떤 물건을 등록 할 수 있나요?</a></h2>
            <p class="content">구매 후 질려서 안쓰거나 맞지않는 제품들을 등록 할 수 있습니다.</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#css3">배송 시스템은 어떻게 되나요?</a></h2>
            <p class="content">거래 안정성을 위해 등록자와 대여자 사이에 전문 물류 시스템을 통해서 배송합니다.</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">보증금은 아무렇게나 적으면 되나요?</a></h2>
            <p class="content">놉</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">결제는 카드만 되나요?</a></h2>
            <p class="content">카카오페이, 신용카드 됩니다.</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">물품 등록 어떻게 하나요?</a></h2>
            <p class="content">이렇게 저렇게</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">판매자에게 연락은 어떻게 하나요?</a></h2>
            <p class="content">못함</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">배송 예약도 가능한가요?</a></h2>
            <p class="content">놉</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">물품 파손 시 보증금은 어떻게 되나요?</a></h2>
            <p class="content">까입니다</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">판매 불가 항목에는 어떤게 있나요?</a></h2>
            <p class="content">왼쪽 메뉴바에 있는 이용안내에 들어가면 상세히 볼 수 있습니다.</p>
        </li>
        <li class="collapsible">
            <h2 class="title"><a href="#api">택배비용은 어떻게 되나요?</a></h2>
            <p class="content">왕복 5000원</p>
        </li>
        
    </ul>

</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   <!--  <div style="display:block; clear:left;">
    <table class="table" >
    <thead>
      <tr>
        <th>No.</th>
        <th>title</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>어떤 물건을 등록 할 수 있나요?</td>
        <td>187</td>
      </tr>
      <tr>
        <td>2</td>
        <td>배송 관련 질문</td>
        <td>120</td>
      </tr>
      <tr>
        <td>3</td>
        <td>보증금 관련 질문</td>
        <td>99</td>
      </tr>
      
       <tr>
        <td>4</td>
        <td>결제 관련</td>
        <td>22</td>
      </tr>
       <tr>
        <td>5</td>
        <td>물품 등록 어떻게 하나요?</td>
        <td>88</td>
      </tr>
       <tr>
        <td>6</td>
        <td>판매자에게 연락은 어떻게 하나요?</td>
        <td>33</td>
      </tr>
       <tr>
        <td>7</td>
        <td>배송 예약도 가능한가요?</td>
        <td>44</td>
      </tr>
       <tr>
        <td>8</td>
        <td>물품 파손 시 보증금은 어떻게되나요?</td>
        <td>78</td>
      </tr>
       <tr>
        <td>9</td>
        <td>판매 불가 항목에는 어떤게 있나요?</td>
        <td>54</td>
      </tr>
       <tr>
        <td>10</td>
        <td>택배비용</td>
        <td>22</td>
      </tr>
      
    </tbody>
  </table>
    
    </div>
</div>
 -->
 
 



</div>
  

<!-- footer -->
<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
	<div class="col-lg-1 col-md-1">
	</div>
<script>
function myQue(){
	location.href="/st/cslist.cs";
}

</script>
<!-- 아코디언메뉴  -->
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>


</body>
</html>