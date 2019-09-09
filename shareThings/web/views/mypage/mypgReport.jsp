<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
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
	.vertical-menu {
 	 width: 15%;
 	 margin-top:10px;
 	 float:left;
	}

	.vertical-menu a {
	text-align: center;
  	background-color: #0CB6F4;
  	color: white;
  display: block;
  padding: 12px;
  text-decoration: none;
	}

.vertical-menu a:hover {
  background-color: #78DBFF;
  text-decoration: none;
  color:white;
}

.vertical-menu a.active {
  background-color: #78DBFF;
  color: white;
}
	.detail {
		margin-top:70px;
		display:block;
		float:left;
		width:80%;
		margin-left: 3%;
		
	}
	.detail .titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
	
	}
	/* .detail .titletbC {
		background:white;
		text-align: center;
		color:black;
		border: 1px solid black;
	
	
	} */
	.icon1 {
		width:70px;
	}

	#footer {
		float:right;
	}
	
	.titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
		width:1000px;
	}
	#mlogo { width:100%;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
			<div class="vertical-menu">
			<h1 align="left"><a href="mypgMain.jsp" style="text-decoration: none; background: white; margin:-10px;"><img id="mlogo" src="../../resource/img/mypage/mypage.png"></a></h1>
 			  <a href="mypgUser.jsp" >내 정보 조회</a>
			  <a href="mypgUpPd.jsp" >내 등록 물품</a>
 			 <a href="mypgRtPd.jsp">내 대여 현황</a>
  			<a href="mypgUserPd.jsp">관심물품</a>
 			 <a href="mypgPoint.jsp">적립금 현황</a>
 			 <a href="mypgReport.jsp" class="active">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#productDetailTab">신고 내역</a></li>
					<li><a data-toggle="tab" href="#productQnATab">QnA 내역</a></li>
					<li><a data-toggle="tab" href="#productReviewTab">후기 내역</a></li>
				</ul>
				<br><br>
				
				<div class="tab-content">
					<!-- 상품 상세설명 탭 -->
					<div id="productDetailTab" class="tab-pane fade in active" align="center">
						<table class="table table-striped" >
    <thead>
      <tr>
        <th >신고 접수 일자</th>
        <th>신고 사유명 </th>
        <th>신고인</th>
        <th>신고 대상</th>
        <th>신고 사유</th>
        <th>결과</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td >2019-05-12</td>
        <td>욕설,비방</td>
        <td>차소희</td>
        <td>최준혁</td>
        <td>욕했다</td>
        <td>적합</td>
      </tr>
      <tr>
        <td>2019-05-10</td>
        <td>광고/홍보글</td>
        <td>차소희</td>
        <td>정회륜</td>
        <td>상업적으로 이용함</td>
        <td>적합</td>
      </tr>
      <tr> 
        <td>2019-05-01</td>
        <td>개인 정보 유출</td>
        <td>차소희</td>
        <td>김선아</td>
        <td>주민번호 도용</td>
        <td>적합</td>
      </tr>
       <tr>
        <td>2019-04-10</td>
        <td>음란/선정선</td>
        <td>차소희</td>
        <td>이선우</td>
        <td>이상한 사진 올림</td>
        <td>적합</td>
      </tr>
       <tr>
        <td>2019-04-05</td>
        <td>저작권 불법도용</td>
        <td>차소희</td>
        <td>김동환</td>
        <td>저작권 도용</td>
        <td>적합</td>
      </tr>
       <tr>
        <td>2019-03-11</td>
        <td>욕설,비난</td>
        <td>차소희</td>
        <td>최병욱</td>
        <td>욕했다</td>
        <td>적합</td>
      </tr>
    </tbody>
  </table>


				
		
			
					</div> <!-- end of productDetailTab -->
					
					<!-- QnA탭 -->
					<div id="productQnATab" class="tab-pane fade" align="center">
						<table class="table table-striped" >
    <thead>
      <tr>
        <th style="width:15%;">작성일</th>
        <th>작성자</th>
        <th style="width:60%;">내용</th>
       
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>2019-05-21</td>
        <td >차소희</td>
        <td>이거 새건가요?</td>
       
      </tr>
      <tr>
        <td>2019-05-19</td>
        <td>차소희</td>
        <td>이거 기능 좋아요?</td>
     
      </tr>
      
    </tbody>
  </table>
						
					</div> <!-- end of productQnATab -->
					
					<!-- 상품 리뷰 탭 -->
					<div id="productReviewTab" class="tab-pane fade" align="center">
						<table class="table table-striped" >
    <thead>
      <tr>
        <th style="width:15%;">작성일</th>
        <th>작성자</th>
        <th style="width:60%;">내용</th>
       
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>2019-05-21</td>
        <td >차소희</td>
        <td>좋아요!</td>
       
      </tr>
      <tr>
        <td>2019-05-19</td>
        <td>차소희</td>
        <td>이상해요!</td>
     
      </tr>
      
    </tbody>
  </table>
					</div> <!-- end of productReviewTab -->
					
					
				</div><!-- detail -->
				
			
			
			</div> <!-- main -->
			
	<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div>
		
	<div class="col-lg-1 col-md-1">
	</div>
</body>
</html>
			