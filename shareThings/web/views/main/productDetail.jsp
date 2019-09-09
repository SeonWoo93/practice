<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, java.util.ArrayList, 
    java.sql.*, com.kh.st.attachment.model.vo.Attachment, com.kh.st.rental.model.vo.Rental,
    com.kh.st.member.model.vo.Rreason"%>
<%
	HashMap<String, Object> pDetailMap = (HashMap<String, Object>)request.getAttribute("bDetailMap");
	HashMap<String, Object> bmap = (HashMap<String, Object>)pDetailMap.get("bmap");
	ArrayList<Attachment> attList = (ArrayList<Attachment>)pDetailMap.get("attList");
	HashMap<String, Object> bWritermap = (HashMap<String, Object>)pDetailMap.get("bWritermap");
	ArrayList<HashMap<String, Object>> QnAList = (ArrayList<HashMap<String, Object>>)pDetailMap.get("QnAList");
	ArrayList<HashMap<String, Object>> reviewList = (ArrayList<HashMap<String, Object>>)pDetailMap.get("reviewList");
	HashMap<String, Object> rvAttmap = (HashMap<String, Object>)pDetailMap.get("rvAttmap");
	ArrayList<Rental> rentList = (ArrayList<Rental>)pDetailMap.get("rentList");
	ArrayList<Rreason> rReasonList = (ArrayList<Rreason>)pDetailMap.get("rReasonList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-물품상세</title>
<style>
	.header {
		width:100%;
		background:white;
	}
	.main {
		padding:20px 10px 20px 10px;
		margin:0;
		width:100%;
		height:auto;
	}
	.footer {
		padding:0;
		margin:0;
		width:100%;
	}
	.productTitleArea {
		min-height:300px;
	}
	img {
	  vertical-align: middle;
	  max-width:100%;
	}
	.productImg {
	  position: relative;
	  align:center;
	  border:1px solid lightgray;
	  padding:5px;
	}
	.imgSlides {
	  display:none;
	  width:100%;
	  height:400px;
	  align:center;
	}
	.cursor {
	  cursor: pointer;
	}
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: orange;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	.prev {
		left:0;
	}
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	.prev:hover, .next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	  color:white;
	}
	.imgListArea {
		background-color: rgba(0, 0, 0, 0.8);
		padding:10px 5px 10px 5px;
	}
	.imgList {
		padding:5px;
	}
	.row:after {
	  content: "";
	  display:table;
	  clear: both;
	}
 	.subImages {
	  opacity: 0.8;
	}
	.active, .subImages:hover {
	  opacity: 1;
	}
	.titleArea {
		padding:0 0 0 30px !important;
	}
	.titleBlock, .sellerBlock {
		 border:1px solid lightgray;
		 padding:10px;
	}
	.datePicker {
		width:50%;
	}
	.productInfo tr {
		height:50px;
	}
	#small {
		height:10px;
	}
	.productInfo td {
		padding:5px;
	}
	#addCartBtn, #rentBtn {
		/* height:50px; */
		font-size:1.3em;
	}
	.productDetailArea, .QnAInputArea, .QnAListArea, .reviewInputArea, .reviewListArea {
		width:80%;
		padding:15px;
		margin:0 !important;
	}
	#QnAList tr, #reviewList tr {
		height:40px;
		border-top: 1px solid lightgray;
	}
	#QnAList tr:nth-of-type(2n), #reviewList tr:nth-of-type(2n) {
		height:80px !important;
	}
	#QnAList tr:last-child, #reviewList tr:last-child {
		border-bottom:2px solid #0CB6F4;
	}
	#QnAList >tbody tr:nth-of-type(2n-1):hover, #reviewList>tbody tr:nth-of-type(2n-1):hover {
		cursor:pointer;
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
 	.enable a{
		background-color:yellowgreen  !important;
	  	background-image :none !important;
	   	color: black !important;
	}
	.disable a{
		background-color:gray  !important;
	  	background-image :none !important;
	   	color: black !important;
	}
	.modal-body>table td {
		padding:5px;
	}
	
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10">
		<!-- 헤더 -->
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>


		<!-- 메인바디 -->
		<div class="main">

			
			<div class="row productTitleArea">
				
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12 productImg">
					<% 
						for(int i = 0; i < attList.size(); i++) { 
					%>
				 	<div class="imgSlides" align="center">
				    	<img src="/st/attach_upload/<%= attList.get(i).getChangeName() %>" height="100%" width="auto">
				  	</div>
				  	
				  	<% 
						}
				  	%>
				    
				  	<a class="prev cursor" onclick="plusSlides(-1)">❮</a>
				  	<a class="next cursor" onclick="plusSlides(1)">❯</a>
				  		
				  	<div class="row imgListArea">
				  		<%
				  			for(int i = 0; i < attList.size(); i++) {
				  		%>
				    	<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2 imgList">
				      		<img class="subImages cursor" src="/st/attach_upload/<%= attList.get(i).getChangeName() %>" 
				      		style="width:100%" onclick="currentSlide(<%= i+1 %>)" alt="">
				    	</div>
				    	
				    	<%
				  			}
				    	%>
					</div>
				</div> <!-- end of productImg -->
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12 titleArea">
					<div class="titleBlock">
							<table class="productInfo" style="width:100%">
								<tr>
									<td colspan="4" align="right">
										<div class="ui labeled button" tabindex="0">
											<div class="ui red button" id="zzimBtn">
												<i class="heart icon"></i> 찜하기
											</div>
											<a class="ui basic red left pointing label" id="zzimCtn"> <%= bmap.get("zzimCount") %> </a>
											<div class="ui custom popup top left transition hidden zzimPopup">관심물품으로 등록되었습니다.
												<div class="ui yellow button" id="goToMyZzim">내 관심목록으로 이동</div>
											</div>
										</div>
										<div class="ui labeled button" tabindex="0">
											<div class="ui basic blue button">
												<i class="chart bar icon"></i> 조회수
											</div>
											<a class="ui basic left pointing blue label"> <%= bmap.get("bCount") %> </a>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<h3><b><%= bmap.get("bTitle") %></b></h3>
									</td>
								</tr>
								<tr>
									<td>
										<label style="color:#0CB6F4; font-wieght:bold; font-size:2em"><%= bmap.get("price") %>원/week</label>
									</td>
									<td>
										<label style="color:gray; font-wieght:bold;">/ 보증금 <%= bmap.get("deposit") %>원
										</label><label style="color:gray; font-size:0.7em">(보증금은 대여기간 종료 후 전액 환불됩니다.)</label>
									</td>
								</tr>
								<tr>
									<td colspan="2"><label>모델명 : <%= bmap.get("model") %></label></td>
								</tr>
								<tr>
									<td><label>물품상태 : <%= bmap.get("condition") %></label></td>
									<td><label>구입시기 : <%= bmap.get("purchaseDate") %></label></td>
								</tr>
								<tr>
									<td width="50%">
										<div class="ui left icon right labeled fluid input datePicker" style="margin:0; width:100%">
											<input type="text" name="endPick" id="startPick" placeholder="대여 시작일">
											<i class="calendar alternate outline icon"></i>
											<div class="ui basic label clearDate">
												<i class="icon x" style="margin:0; color:gray;"></i>
											</div>
										</div>
									</td>
									<td width="50%">
										<div class="ui left icon right labeled fluid input datePicker" style="margin:0; width:100%">
											<input type="text" name="endPick" id="endPick" placeholder="대여 종료일">
											<i class="calendar alternate outline icon"></i>
											<div class="ui basic label clearDate">
												<i class="icon x" style="margin:0; color:gray;"></i>
											</div>
										</div>
									</td>
								</tr>
								<tr id="small">
									<td colspan="2">
										<label style="font-size:0.8em; color:lightgray; font-style:italic">일주일 단위로 대여 가능하며, 최소 대여기간은 일주일(7일)입니다.</label>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										선택하신<label id="periodCalc" style="color:#F44A0C">--</label>주
										 대여가격 : <label id="priceCalc" style="color:#0CB6F4;">--</label>원
									</td>
									<td><label></label></td>
								</tr>
								<tr>
									<td>(+ 보증금 : <label><%= bmap.get("deposit") %></label>원)</td>
									<td>
										<span id="dlResult" style="display:none" 
										data-tooltip="대여 가격 <%= bmap.get("dlFreeAmount")%>원 이상 배송비 무료 물품입니다.">
											(+ 왕복배송비 : 5000원)<i class="ui question circle icon dlInfo"></i>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right" style="color:#F44A0C; font-wieght:bold; font-size:2em">
										총<label id="rentPrice">--</label>원
									</td>
								</tr>
								<tr>
									<td>
										<div class="ui fluid negative button" id="addCartBtn">장바구니 추가</div>
									</td>
									<td>
										<div class="ui fluid primary button" id="rentBtn">바로 대여신청</div>
									</td>
								</tr>
							</table>
					</div> <!-- end of TitleBlock -->
					<br><br>
					<div class="sellerBlock" style="height:80px">
						<table class="sellerInfo" style="width:100%">
							<tr>
								<td colspan="3">
									<h4>물품 등록인 정보</h4>
								</td>
							</tr>
							<tr>
								<td>
									<div class="ui label">
										<i class="user outline icon"></i>
										<label>
											<%= bmap.get("bWriter") %> (등급 : <%= bWritermap.get("mLevelName") %>)
										</label>
										<input type="hidden" value="<%= bmap.get("uno") %>">
										<input type="hidden" value="<%= bmap.get("bWriter") %>">
										<% if(loginUser != null && loginUser.getUno() != (int)bmap.get("uno")) { %>
										<div class="ui basic icon button reportPuBtn" data-tooltip="해당 유저를 신고하시려면 클릭하세요"
										data-toggle="modal" data-target="#reportModal">
											<i class="bullhorn icon" style="color:red"></i>
										</div>
										<% } %>
										<!-- <div class="ui custom popup top left transition hidden reportPopup">신고하시겠습니까?
											<div class="ui red button" id="reportBtn" data-toggle="modal" data-target="#reportModal">신고</div>
										</div> -->
										
									</div>
								</td>
								<td>아이템 : <label><%= bWritermap.get("pCount") %></label></td>
								<td>후기 : <label id="userReviewCnt"><%= bWritermap.get("rvCount") %></label></td>
							</tr>
						</table>
						<br><br>
					</div> <!-- end of SellerBlock -->
					
				</div><!-- end of titleArea -->

			</div> <!--  end of productTitleArea -->
			<br><br>
			
			<div class="row">
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#productDetailTab">상세정보</a></li>
					<li><a data-toggle="tab" href="#productQnATab">Q & A</a></li>
					<li><a data-toggle="tab" href="#productReviewTab">대여 후기</a></li>
				</ul>
				<br><br>
				
				<div class="tab-content">
					<!-- 상품 상세설명 탭 -->
					<div id="productDetailTab" class="tab-pane fade in active" align="center">
						<div class="productDetailArea">
							<p><%= bmap.get("bContent") %></p>
						</div> <!-- end of productDetailArea -->
					</div> <!-- end of productDetailTab -->
					
					<!-- QnA탭 -->
					<div id="productQnATab" class="tab-pane fade" align="center">
						<div class="row QnAInputArea" align="left">
							
							<h3 id="QnAHead">Q & A (<%= QnAList.size() %>)</h3>
							<br>
							<p><b>나의 질문</b></p>
							<textarea class="QnAInput" rows="5" style="width: 100%"
								placeholder="질문을 입력해주세요" id="QnAinput"></textarea>
							<div class="ui large blue button" id="insertProductQnA">등록하기</div>
						</div>
						<br><br><br>
						<div class="row QnAListArea" align="center">
							<table class="table table-striped" id="QnAList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th width="70%">내용</th>
										<th width="15%">작성자</th>
										<th width="15%">작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < QnAList.size(); i++) {
									
									%>
									<tr>
										<td><%= QnAList.get(i).get("qnaTitle") %>
											<% if(loginUser != null && loginUser.getUno() == (int)bmap.get("uno") && QnAList.get(i).get("ansTitle") == null) { %>
											<input type="hidden" value="<%= QnAList.get(i).get("qnaNo") %>">
											<div class="ui green inverted button addReply qnaReply" data-toggle="modal" data-target="#replyModal">답글 입력</div>
											<% } %>
										</td>
										<td><%= QnAList.get(i).get("qnaWriter") %>
											<input type="hidden" name="qnaUno" value="<%= QnAList.get(i).get("qnaUno") %>">
											<input type="hidden" value="<%= QnAList.get(i).get("qnaWriter") %>">
											<% if(loginUser != null && loginUser.getUno() != (int)QnAList.get(i).get("qnaUno")) { %>
											<div class="ui mini basic icon button reportPuBtn" 
											data-tooltip="해당 유저를 신고하시려면 클릭하세요" data-toggle="modal" 
											data-target="#reportModal">
												<i class="bullhorn icon" style="color:red"></i>
											</div>
											<% } %>
										</td>
										<td><%= QnAList.get(i).get("qnaDate") %></td>
									</tr>
									<tr>
										<td><%= QnAList.get(i).get("qnaContent") %></td>
										<td></td>
										<td></td>
									</tr>
									<%
											if(QnAList.get(i).get("ansTitle") != null) {
									%>
									<tr>
										<td style="color:orangered">
											&nbsp;&nbsp;[답글 :]<%= QnAList.get(i).get("ansTitle") %>
										</td>
										<td><%= QnAList.get(i).get("ansWriter") %>
											<input type="hidden" name="ansUno" value="<%= QnAList.get(i).get("ansUno") %>">
											<input type="hidden" value="<%= QnAList.get(i).get("ansWriter") %>">
											<% if(loginUser != null && loginUser.getUno() != (int)QnAList.get(i).get("ansUno")) { %>
											<div class="ui mini basic icon button reportPuBtn" 
											data-tooltip="해당 유저를 신고하시려면 클릭하세요" data-toggle="modal" 
											data-target="#reportModal">
												<i class="bullhorn icon" style="color:red"></i>
											</div>
											<% } %>
										</td>
										<td><%= QnAList.get(i).get("ansDate") %></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;<%= QnAList.get(i).get("ansContent") %></td>
										<td></td>
										<td></td>
									</tr>
									<%
											}
										}
									%>
								</tbody>
							</table>
						</div> <!-- end of QnAListArea -->
					</div> <!-- end of productQnATab -->
					
					<!-- 상품 리뷰 탭 -->
					<div id="productReviewTab" class="tab-pane fade" align="center">
						<div class="row reviewInputArea" align="left">
							<h3 id="reviewHead">대여 후기 (<%= reviewList.size() %>)</h3>
							<br>
							<p><b>나의 후기</b></p>
							<form id="reviewForm" method="POST" enctype="multipart/form-data">
								<div class="ui star huge rating" id="ratingInput" data-rating="3" data-max-rating="5"></div>
								<input type="hidden" name="bno" value="<%= (int)bmap.get("bno") %>">
								<input type="hidden" name="bTitle" value="<%= bmap.get("bTitle") %>">
								<input type="hidden" name="pno" value="<%= (int)bmap.get("pno") %>">
								<input type="hidden" name="bLevel" value="0">
								<input type="hidden" name="reviewStar">
								<textarea class="reviewInput" rows="5" style="width:100%" 
								name="reviewInput" placeholder="후기를 입력해주세요"></textarea>
								<div class="rvAttachArea">
									<label>사진 첨부</label>
									<div class="rvImageArea rvImageArea1">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg1"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea2" >
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg2"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea3">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg3"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea4">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg4"width="100%" height="100%">
									</div>
									<div class="rvImageArea rvImageArea5">
										<i class="camera icon" style="position:absolute; top:30%;left:35%;"></i>
										<img id="rvImg5"width="100%" height="100%">
									</div>
									<div id="fileArea">
										<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
										<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
										<input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
										<input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
										<input type="file" id="img5" name="img5" onchange="loadImg(this, 5);">
										
									</div>
								</div>
							</form>
							<div class="ui large blue button" id="insertProductReview">등록하기</div>
						</div>
						<br><br><br>	
						<div class="row reviewListArea" align="center">
							<table class="table table-striped" id="reviewList" style="width:100%">
								<thead>
									<tr style="border-top:2px solid #0CB6F4; background:whitesmoke">
										<th width="70%">내용</th>
										<th width="15%">작성자</th>
										<th width="15%">작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < reviewList.size(); i++) {
									%>
									<tr>
										<td>
									<%
											int rvNo = (int)reviewList.get(i).get("rvNo");
											ArrayList<Attachment> rvAttList = (ArrayList<Attachment>)rvAttmap.get(String.valueOf(rvNo));
											if(rvAttList != null) {
												for(int j = 0; j < rvAttList.size(); j++) {	
													if(rvAttList.get(j).getFileLevel() == 0) {
									%>	
										
											<img src="/st/attach_upload/<%= rvAttList.get(j).getChangeName() %>" height="40px" width="40px">
									<%
													}
												}
											}
									%>		
											<%= reviewList.get(i).get("rvTitle") %>
											<% if(loginUser != null && loginUser.getUno() == (int)bmap.get("uno") && reviewList.get(i).get("ansTitle") == null) { %>
											<input type="hidden" value="<%= reviewList.get(i).get("rvNo") %>">
											<div class="ui green inverted button addReply reviewReply" data-toggle="modal" data-target="#replyModal">답글 입력</div>
											<% } %>
										</td>
										<td><%= reviewList.get(i).get("rvWriter") %>
											<input type="hidden" name="rvUno" value="<%= reviewList.get(i).get("rvUno") %>">
											<input type="hidden" value="<%= reviewList.get(i).get("rvWriter") %>">
											<% if(loginUser != null && loginUser.getUno() != (int)reviewList.get(i).get("rvUno")) { %>
											<div class="ui mini basic icon button reportPuBtn" 
											data-tooltip="해당 유저를 신고하시려면 클릭하세요" data-toggle="modal" 
											data-target="#reportModal">
												<i class="bullhorn icon" style="color:red"></i>
											</div>
											<% } %>
										</td>
										<td><%= reviewList.get(i).get("rvDate") %></td>
									</tr>
									<tr>
										<td>
											<%= reviewList.get(i).get("rvContent") %>
									<%
											if(rvAttList != null) {
												for(int j = 0; j < rvAttList.size(); j++) {	
									%>		
											<img src="/st/attach_upload/<%= rvAttList.get(j).getChangeName() %>" height="80px" width="80px">
									<%
												}
											}
									%>
										</td>
										<td><div class="ui star large rating ratingContent" data-rating="<%= reviewList.get(i).get("rvStar") %>" data-max-rating="5"></div></td>
										<td></td>
									</tr>
									<%
											if(reviewList.get(i).get("ansTitle") != null) {
									%>
									<tr>
										<td style="color:orangered">&nbsp;&nbsp;[답글 :]<%= reviewList.get(i).get("ansTitle") %></td>
										<td><%= reviewList.get(i).get("ansWriter") %>
											<input type="hidden" name="ansUno" value="<%= reviewList.get(i).get("ansUno") %>">
											<input type="hidden" value="<%= reviewList.get(i).get("ansWriter") %>">
											<% if(loginUser != null && loginUser.getUno() != (int)reviewList.get(i).get("rvUno")) { %>
											<div class="ui mini basic icon button reportPuBtn" data-tooltip="해당 유저를 신고하시려면 클릭하세요" 
											data-toggle="modal" data-target="#reportModal">
												<i class="bullhorn icon" style="color:red"></i>
											</div>
											<% } %>
										</td>
										<td><%= reviewList.get(i).get("ansDate") %></td>
									</tr>
									<tr>
										<td>&nbsp;&nbsp;<%= reviewList.get(i).get("ansContent") %></td>
										<td></td>
										<td></td>
									</tr>
									<%
											}
										}
									%>
								</tbody>
							</table>
						</div> <!-- end of reviewListArea -->
					</div> <!-- end of productReviewTab -->
					
					
				</div> <!-- 탭 영역 끝 -->
			</div> <!-- end of row -->
			<br><br><br><br>
			<!-- 신고 modal -->
			<div id="reportModal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-md">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">회원 신고 제출 양식</h4>
						</div>
						<div class="modal-body" align="center">
						<form method="post" id="reportForm">
							<table style="width:100%">
								<tr>
									<td width="20%">신고대상 회원</td>
									<td width="30%">
										<div class="ui input">
											<input type="hidden" name="targetUno" id="targetUno"> 
											<input type="text" name="targetName" id="targetName" size="10">
										</div>
									</td>
									<td width="20%">신고유형</td>
									<td width="30%">
										<select name="reportCode" id="reportCode">
											<% for(int i = 0; i < rReasonList.size(); i++) { %>
											<option value="<%= rReasonList.get(i).getReportCode() %>">
												<%= rReasonList.get(i).getReportName() %>
											</option>
											<% } %>
										</select>
									</td>
								</tr>
								<tr>
									<td>신고인(본인)</td>
									<td>
										<div class="ui input">
											<% if(loginUser != null) { %>
											<input type="hidden" name="rpUno" id="rpUno" value="<%= loginUser.getUno() %>">
											<input type="text" name="rpName" size="10"
												value="<%= loginUser.getUserName() %>">
											<% }else { %>
											<input type="hidden" name="rpUno" value="">
											<input type="text" name="rpName" size="10"
												value="">
											<% } %>
										</div>
									</td>
								</tr>
								<tr>
									<td>신고사유</td>
									<td colspan="3">
										<div class="ui input">
											<textarea name="rpContent" id="rpContent" rows="3" cols="50" style="width:100%"></textarea>
										</div>
									</td>
								</tr>
							</table>
						</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="ui orange button" data-dismiss="modal">취소</button>
							<button class="ui primary button" id="sendReportBtn">제출</button>
						</div>
					</div>
				</div>
			</div> <!-- 신고 modal 끝 -->
			
			<div id="replyModal" class="modal fade replyModal" role="dialog">
				<div class="modal-dialog modal-md">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">답글입력</h4>
						</div>
						<div class="modal-body" align="center">
						<div class="ref">
						</div>
						<textarea class="replyInput" rows="5" cols="70" placeholder="답변내용"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="ui orange button" data-dismiss="modal">취소</button>
							<button class="ui primary button" id="sendReplyBtn">확인</button>
						</div>
					</div>
				</div>
			</div>
			
		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	

	
	<script>
	 	$(function() {
		    $("#startDay").datepicker();
		    $("#endDay").datepicker();
			hideContent();
			$("#ratingInput").rating();
			$(".ratingContent").rating("disable");
			$("#fileArea").hide();
			$("#zzimBtn").popup({
				popup:$(".zzimPopup"),
				on:'click'
			});
			setDatePicker();
			
	 	});
	 	

	 	$(".reportPuBtn").click(function() {
			<% if(loginUser == null) { %>
			alert("로그인을 해주세요.");
			location.href="/st/views/member/loginPage.jsp";
	 		<% }else { %>
	 		var targetUno = $(this).prev().prev().val();
	 		var targetName = $(this).prev().val();
	 		$("input[name=targetUno]").val(targetUno);
	 		$("input[name=targetName]").val(targetName);
	 		<% } %>
	 	});
	 	
	 	
	 	
	 	
	 	$(".rvImageArea1").click(function() {
	 		$("#img1").click();
	 	});
	 	$(".rvImageArea2").click(function() {
	 		$("#img2").click();
	 	});
	 	$(".rvImageArea3").click(function() {
	 		$("#img3").click();
	 	});
	 	$(".rvImageArea4").click(function() {
	 		$("#img4").click();
	 	});
	 	$(".rvImageArea5").click(function() {
	 		$("#img5").click();
	 	});
	 	
	 	
	 	
	 	function setDatePicker() {
	 		
	 		//대여 시작일, 종료일 지정
			var startDate = null;
			var endDate = null;
			var startDay = null;
			var endDay = null;
			var today = new Date();
			var end = null;
			var st = null;
			function checkStDate(date) {
				<% 
				for(int i = 0; i < rentList.size(); i++) {
					Rental rt = rentList.get(i);
					Date rtStartDate = rt.getRtStartDate();
					Date rtEndDate = rt.getRtEndDate();
				%>
				st = new Date(<%= rtStartDate.getTime() %>);
				end = new Date(<%= rtEndDate.getTime() %>);
				end.setDate(end.getDate() + 2);
				if(date >= st && date <= end) {
					return [false, "disable", "대여 불가"];
				}
				<% } %>
				
			}
			$("#startPick").datepicker({
				dateFormat:"yy-mm-dd",
				/* defaultDate:"+1w", */
				changeMonth:true,
				minDate:today,
				onSelect:function(selectedDate) {
					startDate = $(this).datepicker('getDate');
					endDate = new Date(startDate);
					endDate.setDate(startDate.getDate() + 6);
					if(checkStDate(endDate)) {
						alert("원하시는 날짜에 대여가 불가합니다! 다른이의 예약 일정으로 인해 대여하시려는 날짜부터 최소 대여기간 일주일을 채울 수 없습니다.");
						$(this).val("");
						endDay = null;
					}else {
						endDay = endDate.getDay();
						$("#endPick").datepicker("option", "minDate", endDate);
					}
				}, 
				beforeShowDay:function(date) {
					<% 
						for(int i = 0; i < rentList.size(); i++) {
							Rental rt = rentList.get(i);
							Date rtStartDate = rt.getRtStartDate();
							Date rtEndDate = rt.getRtEndDate();
					%>
					st = new Date(<%= rtStartDate.getTime() %>);
					end = new Date(<%= rtEndDate.getTime() %>);
					end.setDate(end.getDate() + 2);
					if(date >= st && date <= end) {
						return [false, "disable", "대여 불가"];
					}
					<% } %>
					if(startDay != null) {
						if(date.getDay() != startDay) {
							return [false, "disable", "대여 불가"];
						}else {
							return [true, "enable", "대여 가능"];
						}
					}else {
						return [true, "enable", "대여 가능"];
					}
				}
			});
		    $("#endPick").datepicker({
		    	dateFormat:"yy-mm-dd",
		    	defaultDate:"+1w",
		    	changeMonth:true,
		    	onSelect:function(selectedDate) {
		    		endDate = $(this).datepicker('getDate');
		    		startDate = new Date(endDate);
		    		startDate.setDate(endDate.getDate() - 6);
		    		startDay = startDate.getDay();
		    		$("#startPick").datepicker("option", "maxDate", startDate);
		    		
		    		if($(this).datepicker("getDate") != null && $("#startPick").datepicker("getDate") != null) {
		    			var rtStart = $("#startPick").datepicker("getDate");
			 			var rtEnd = $(this).datepicker("getDate");
			 			if(rtStart != null && rtEnd != null) {
				 			var period = Math.ceil((rtEnd.getTime() - rtStart.getTime() + 1) / (1000 * 60 * 60 * 24));
		    				var totalprice = (period / 7) * <%= bmap.get("price") %>;
		    				$("#priceCalc").text(totalprice);
		    				$("#periodCalc").text(period / 7);
		    				var rentprice = totalprice + <%= bmap.get("deposit") %>;
		    				if(totalprice >= <%= bmap.get("dlFreeAmount") %>) {
		    					$("#dlResult").hide();
		    				}else {
		    					$("#dlResult").show();
		    					rentprice += 5000;
		    				}
		    				$("#rentPrice").text(rentprice);
			 			}
		    		}
		    	},
		    	beforeShowDay:function(date) {
		    		<% 
						for(int i = 0; i < rentList.size(); i++) {
							Rental rt = rentList.get(i);
							Date rtStartDate = rt.getRtStartDate();
							Date rtEndDate = rt.getRtEndDate();
					%>
					st = new Date(<%= rtStartDate.getTime() %>);
					end = new Date(<%= rtEndDate.getTime() %>);
					if(date >= st && date <= end) {
						return [false, "", "대여 불가"];
					}
					<% } %>	
		    		
		    		if(endDay != null) {
			    		if(date.getDay() != endDay) {
			    			return [false];
			    		}else {
			    			return [true, "enable", "대여 가능"];
			    		}
		    		}else {
		    			return [true, "enable", "대여 가능"];
		    		}
		    	}
		    });
		 	$(".clearDate").mouseenter(function() {
		 		$(this).css("cursor", "pointer");
		 	}).click(function() {
		 		$("#startPick").datepicker("setDate", null);
		 		$("#endPick").datepicker("setDate", null);
		 		startDate = null;
				endDate = null;
				startDay = null;
				endDay = null;
				today = new Date();
				end = null;
				st = null;
				$("#priceCalc").text("--");
				$("#periodCalc").text("--");
				$("#dlResult").hide();
				$("#rentPrice").text("--");
		 	});
		 	
	 	}
	 	
	 	function hideContent() {
		    $("#QnAList").find("tbody>tr:odd").hide();
		    $("#reviewList").find("tbody>tr:odd").hide();
		 	$("#QnAList").find("tr:odd").click(function() {
		 		/* $(this).css("background", "lightblue");
		 		$(this).siblings("tr:even").css("background", "#f9f9f9"); */
		 		$("#QnAList").find("tbody>tr:odd").hide();
		 		$(this).next().slideDown();	
		 	});
		 	$("#reviewList").find("tr:odd").click(function() {
		 		/* $(this).css("background", "lightblue");
		 		$(this).siblings().css("background", "#f9f9f9"); */
		 		$("#reviewList").find("tbody>tr:odd").hide();
		 		$(this).next().slideDown();
		 	});
		 	$(".ratingContent").rating("disable");
	 	}
	 	
	 	function loadImg(value, num) {
	 		if(value.files && value.files[0]) {
	 			var reader = new FileReader();
	 			reader.onload = function(e) {
	 				switch (num) {
	 				case 1 : $("#rvImg1").attr("src", e.target.result);break;
	 				case 2 : $("#rvImg2").attr("src", e.target.result);break;
	 				case 3 : $("#rvImg3").attr("src", e.target.result);break;
	 				case 4 : $("#rvImg4").attr("src", e.target.result);break;
	 				case 5 : $("#rvImg5").attr("src", e.target.result);break;
	 				}
	 			}
	 			reader.readAsDataURL(value.files[0]);
	 		}
	 	}
	 	
	 	
		var slideIndex = 1;
		showSlides(slideIndex);
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		function showSlides(n) {
		  	var i;
		  	var slides = document.getElementsByClassName("imgSlides");
		  	var subs = document.getElementsByClassName("subImages");
		  	/* var captionText = document.getElementById("caption"); */
		  	if (n > slides.length) {
				slideIndex = 1; //맨처음으로 이동
			}
		  	if (n < 1) {
		  		slideIndex = slides.length  //마지막으로 이동
		  	}
		  	for (i = 0; i < slides.length; i++) {
		      	slides[i].style.display = "none";
		  	}
		  	for (i = 0; i < subs.length; i++) {
		      	subs[i].className = subs[i].className.replace(" active", "");
		  	}
		  	slides[slideIndex-1].style.display = "block";
		  	subs[slideIndex-1].className += " active";
		  	/* captionText.innerHTML = dots[slideIndex-1].alt; */
		}
		
		
		//qna등록
		$("#insertProductQnA").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			var qnaInput = $("#QnAinput").val();
			
			$.ajax({
				url:"<%= request.getContextPath() %>/insertQnA.bo",
				type:"post",
				data:{qnaInput:qnaInput, qnaWriter:<%= loginUser.getUno() %>, refBno:<%= bmap.get("bno") %>, parentBno:<%= bmap.get("bno") %>, bLevel:0, pno:<%= bmap.get("pno") %>, parentBtitle:'<%= bmap.get("bTitle")%>'},
				success:function(data) {
					var $tbody = $("#QnAList>tbody");
					$tbody.html("");
					var ctn = 0;
					for(var key in data) {
						ctn++;
						var $tr = $("<tr>");
						var $titleTd = $("<td>").text(data[key].qnaTitle);
						var $writerTd = $("<td>").text(data[key].qnaWriter);
						<% if(loginUser.getUno() == (int)bmap.get("uno")) { %>
						if(data[key].ansTitle == null) {
							var $hiddenInput = $("<input type='hidden'>").val(data[key].qnaNo);
							var $ansBtn = $("<div class='ui green inverted button addReply qnaReply' data-toggle='modal' data-target='#replyModal'>").text("답글 입력");
							$titleTd.append($hiddenInput);
							$titleTd.append($ansBtn);
						}
						<% } %>
						
						
						var $qnaUnoHidden = $("<input type='hidden' name='qnaUno' value='" + data[key].qnaUno + "'>");
						var $qnaWriterHidden = $("<input type='hidden' value='" + data[key].qnaWriter + "'>");
						$rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
						$icon = $("<i class='bullhorn icon' style='color:red'>");
						$rpPuBtnDiv.append($icon);
						$writerTd.append($qnaUnoHidden);
						$writerTd.append($qnaWriterHidden);
						if(data[key].qnaUno != <%= loginUser.getUno() %>) {
							$writerTd.append($rpPuBtnDiv);
						}
						
						
						var $dateTd = $("<td>").text(data[key].qnaDate);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tbody.append($tr);
						
						var $contentTr = $("<tr>");
						var $contentTd = $("<td>").text(data[key].qnaContent);
						var $emptyTd = $("<td colspan='2'>");
						$contentTr.append($contentTd);
						$contentTr.append($emptyTd);
						$tbody.append($contentTr);

						if(data[key].ansTitle != null) {
							var $ansTr = $("<tr>");
							var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
							var $ansWriterTd = $("<td>").text(data[key].ansWriter);
							
							var $ansUnoHidden = $("<input type='hidden' name='ansUno' value='" + data[key].ansUno + "'>");
							var $ansWriterHidden = $("<input type='hidden' value='" + data[key].ansWriter + "'>");
							var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
							var $icon = $("<i class='bullhorn icon' style='color:red'>");
							$rpPuBtnDiv.append($icon);
							$ansWriterTd.append($ansUnoHidden);
							$ansWriterTd.append($ansWriterHidden);
							if(data[key].ansUno != <%= loginUser.getUno() %>) {
								$ansWriterTd.append($rpPuBtnDiv);
							}
							
							
							var $ansDateTd = $("<td>").text(data[key].ansDate);
							$ansTr.append($ansTitleTd);
							$ansTr.append($ansWriterTd);
							$ansTr.append($ansDateTd);
							$tbody.append($ansTr);
	
							var $ansContentTr = $("<tr>")
							var $ansContentTd = $("<td>").text(data[key].ansContent);
							var $emptyTd = $("<td colspan='2'>");
							$ansContentTr.append($ansContentTd);
							$ansContentTr.append($emptyTd);
							$tbody.append($ansContentTr);
							
						}
					}
					$("#QnAinput").val("");
					hideContent();
					$("#QnAHead").text("Q & A (" + ctn + ")");
					alert("QnA 등록 완료");
				}, error:function(data) {
					alert("서버 전송 실패");
				}
				
			});
			<% } %>
		});
		
		
		//review 등록
		$("#insertProductReview").click(function() {
			<% 
				if(loginUser == null) {
			%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% 
				}else {
					int ctn = 0;
					for(int i = 0; i < rentList.size(); i++) {
						int uno = rentList.get(i).getUno();
						if(loginUser.getUno() == uno) {
							ctn++;break;
						}
					}
					if(ctn == 0) {
			%>
			alert("해당 물품을 대여한 기록이 없습니다..! \n대여 후기는 대여한 상품에 한해서만 작성 가능합니다.")			
			<% 
					}else {
			%>
			
			var reviewStar = $("#ratingInput").rating("get rating");
			$("input[name=reviewStar]").val(reviewStar);
			var form = $("#reviewForm")[0];
			var formData = new FormData(form);
			
			$.ajax({
				url:"<%= request.getContextPath() %>/insertReview.bo",
				type:"post",
				encType:"multipart/form-data",
				data:formData,
				cache:false,
				contentType:false,
				processData:false,
				success:function(data) {
					var $tbody = $("#reviewList>tbody");
					$tbody.html("");
					var ctn = 0;
					for(var key in data) {
						ctn++;
						var $tr = $("<tr>");
						var $titleTd = $("<td>").text(data[key].rvTitle);
						for(var key2 in data[key].rvAttList) {
							var rvAtt = data[key].rvAttList[key2];
							if(rvAtt.fileLevel == 0) {
								var $titleImg = $("<img src='/st/attach_upload/" + rvAtt.changeName + "' width='40px' height='40px'>");
								$titleTd.prepend($titleImg);
							}
						}
						<% if(loginUser.getUno() == (int)bmap.get("uno")) { %>
						if(data[key].ansTitle == null) {
							var $hiddenInput = $("<input type='hidden'>").val(data[key].rvNo);
							var $ansBtn = $("<div class='ui green inverted button addReply reviewReply' data-toggle='modal' data-target='#replyModal'>").text("답글 입력");
							$titleTd.append($hiddenInput);
							$titleTd.append($ansBtn);
						}
						<% } %>
						var $writerTd = $("<td>").text(data[key].rvWriter);
						var $rvUnoHidden = $("<input type='hidden' name='rvUno' value='" + data[key].rvUno + "'>");
						var $rvWriterHidden = $("<input type='hidden' value='" + data[key].rvWriter + "'>");
						var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
						var $icon = $("<i class='bullhorn icon' style='color:red'>");
						$rpPuBtnDiv.append($icon);
						$writerTd.append($rvUnoHidden);
						$writerTd.append($rvWriterHidden);
						if(data[key].rvUno != <%= loginUser.getUno() %>) {
							$writerTd.append($rpPuBtnDiv);
						}	
							
						var $dateTd = $("<td>").text(data[key].rvDate);
						$tr.append($titleTd);
						$tr.append($writerTd);
						$tr.append($dateTd);
						$tbody.append($tr);
						
						var $contentTr = $("<tr>");
						var $contentTd = $("<td>").text(data[key].rvContent);
						for(var key2 in data[key].rvAttList) {
							var rvAtt = data[key].rvAttList[key2];
							var $imgs = $("<img src='/st/attach_upload/" + rvAtt.changeName + "' width='80px' height='80px'>");
							$contentTd.append($imgs);
						}
						var $starTd = $("<td>");
						var $starContent = $("<div class='ui star huge rating ratingContent' data-max-rating='5' data-rating='" + data[key].rvStar + "'>")
						var $emptyTd = $("<td>");
						$starTd.append($starContent);
						$contentTr.append($contentTd);
						$contentTr.append($starTd);
						$contentTr.append($emptyTd);
						$tbody.append($contentTr);

						if(data[key].ansTitle != null) {
							var $ansTr = $("<tr>");
							var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
							var $ansWriterTd = $("<td>").text(data[key].ansWriter);
							var $ansUnoHidden = $("<input type='hidden' name='ansUno' value='" + data[key].ansUno + "'>");
							var $ansWriterHidden = $("<input type='hidden' value='" + data[key].ansWriter + "'>");
							var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
							var $icon = $("<i class='bullhorn icon' style='color:red'>");
							$rpPuBtnDiv.append($icon);
							$ansWriterTd.append($ansUnoHidden);
							$ansWriterTd.append($ansWriterHidden);
							if(data[key].ansUno != <%= loginUser.getUno() %>) {
								$ansWriterTd.append($rpPuBtnDiv);
							}
							var $ansDateTd = $("<td>").text(data[key].ansDate);
							$ansTr.append($ansTitleTd);
							$ansTr.append($ansWriterTd);
							$ansTr.append($ansDateTd);
							$tbody.append($ansTr);
	
							var $ansContentTr = $("<tr>")
							var $ansContentTd = $("<td>").text(data[key].ansContent);
							var $emptyTd = $("<td colspan='2'>");
							$ansContentTr.append($ansContentTd);
							$ansContentTr.append($emptyTd);
							$tbody.append($ansContentTr);
							
						}
					}
					$(".reviewInput").val("");
					hideContent();
					$("#reviewHead").text("대여 후기 (" + ctn + ")");
					$("#userReviewCnt").text(ctn);
					$("#rvImg1").remove();
					var img1 = $("<img id='rvImg1' width='100%' height='100%'>");
					$(".rvImageArea1").append(img1);
					$("#rvImg2").remove();
					var img2 = $("<img id='rvImg2' width='100%' height='100%'>");
					$(".rvImageArea2").append(img2);
					$("#rvImg3").remove();
					var img3 = $("<img id='rvImg3' width='100%' height='100%'>");
					$(".rvImageArea3").append(img3);
					$("#rvImg4").remove();
					var img4 = $("<img id='rvImg4' width='100%' height='100%'>");
					$(".rvImageArea4").append(img4);
					$("#rvImg5").remove();
					var img5 = $("<img id='rvImg5' width='100%' height='100%'>");
					$(".rvImageArea5").append(img5);
					$("#img1").val("");
					$("#img2").val("");
					$("#img3").val("");
					$("#img4").val("");
					$("#img5").val("");
					$("#ratingInput").rating("set rating", 3);
					alert("대여 후기 등록 완료");
				}, error:function(data) {
					alert("서버 전송 실패");
				}
				
			});
			<% 
					}
				} 
			%>
		});
		
		$("#zzimBtn").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			$.ajax ({
				url:"<%= request.getContextPath() %>/insert.zz",
				type:"POST",
				data:{uno:<%= loginUser.getUno() %>, pno:<%= bmap.get("pno") %>},
				success:function(data) {
					if(data == "already exist") {
						alert("이미 관심목록에 추가한 아이템입니다.");
						//$("#zzimBtn").popup("distroy");
					}else if(data != "insert fail") {
						$("#zzimCtn").text(data);
						
					}
				}, error:function(data) {
					alert("서버전송 실패");
				}
			});
			
			<% } %>
		});
		
		$("#goToMyZzim").click(function() {
			location.href="/st/zzimList.pd";
		});
		
		$("#addCartBtn").click(function() {
			<% if(loginUser == null) { %>
			alert("로그인을 해주세요");
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			var st = $("#startPick").val();
			var end = $("#endPick").val();
			var pno = <%= bmap.get("pno") %>;
			if(st == "" || end == "") {
				alert("대여 날짜를 선택해주세요");
			}else {
				$.ajax({
					url:"<%= request.getContextPath() %>/insert.crt",
					type:"post",
					data:{st:st, end:end, pno:pno},
					success:function(data) {
						if(data == "success") {
							var answer = confirm("장바구니에 담겼습니다. 이동하시겠습니까?");
							if(answer) {
								location.href="<%= request.getContextPath() %>/cartlist.rt";	
							}
						}else {
							alert("장바구니 담기 실패");
						}
					}, error:function() {
						alert("서버 전송 실패");
					}
				});
			}
			
			<% } %>		
		});
		
		$("#rentBtn").click(function() {
			<% if(loginUser == null) { %>
			alert("로그인을 해주세요");
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else { %>
			var st = $("#startPick").val();
			var end = $("#endPick").val();
			var pno = <%= bmap.get("pno") %>;
			if(st == "" || end == "") {
				alert("대여 날짜를 선택해주세요");
			}else {
				location.href="<%= request.getContextPath() %>/gopay.rt?st=" + st + "&end=" + end + "&pno=" + pno;
			}
			<% } %>
		});
		
		$("#sendReportBtn").click(function() {
			/* var form = $("#reportForm")[0];
			var formData = new FormData(form); */
			var targetUno = $("#targetUno").val();
			var reportUno = $("#rpUno").val();
			var reportCode = $("#reportCode").val();
			var reportContent = $("#rpContent").val();
			$.ajax({
				url:"<%= request.getContextPath() %>/insert.rp",
				data:{targetUno:targetUno, reportUno:reportUno, reportCode:reportCode, reportContent:reportContent},
				type:"post",
				success:function(data) {
					if(data == "success") {
						alert("신고가 정상적으로 제출되었습니다. \n자세한 사항은 마이페이지에서 확인하세요.");
						$("#reportModal").modal("hide");
					}else {
						alert("신고 제출 실패");
					}
				}, error:function() {
					alert("서버 전송 실패");
				}
			});
			
		});
		
		var replyType = "";
		var parentBno = "";
	 	$(".addReply").click(function() {
	 		$(".ref").text("");
	 		$(".replyInput").val("");
	 		var writer = $(this).parent().next().text();
	 		var date = $(this).parent().next().next().text();
	 		var content = $(this).parent().parent().next().children().eq(0).text();
	 		$(".ref").text(content + " / 작성자 : " + writer + " (" + date + " )");
	 		if($(this).is(".qnaReply")) {
		 		replyType = "qna";
	 			parentQnaNo = $(this).prev().val();
	 		}else {
	 			replyType = "review";
	 			var star = $(this).parent().parent().next().children().eq(1).html();
	 			$(".ref").append(star);
		 		parentRvNo = $(this).prev().val();
	 		}
	 		
	 	});
		
		
		$("#sendReplyBtn").click(function() {
			var replyInput = $(".replyInput").val();

			<% if(loginUser != null) { %>
			if(replyType == "qna") {
				$.ajax({
					url:"<%= request.getContextPath() %>/insertQnA.bo",
					type:"post",
					data:{qnaInput:replyInput, qnaWriter:<%= loginUser.getUno() %>, refBno:<%= bmap.get("bno") %>, parentBno:parentQnaNo, bLevel:1, pno:<%= bmap.get("pno") %>, parentBtitle:'<%= bmap.get("bTitle")%>'},
					success:function(data) {
						var $tbody = $("#QnAList>tbody");
						$tbody.html("");
						var ctn = 0;
						for(var key in data) {
							ctn++;
							var $tr = $("<tr>");
							var $titleTd = $("<td>").text(data[key].qnaTitle);
							var $writerTd = $("<td>").text(data[key].qnaWriter);
							<% if(loginUser.getUno() == (int)bmap.get("uno")) { %>
							if(data[key].ansTitle == null) {
								var $hiddenInput = $("<input type='hidden'>").val(data[key].qnaNo);
								var $ansBtn = $("<div class='ui green inverted button addReply qnaReply' data-toggle='modal' data-target='#replyModal'>").text("답글 입력");
								$titleTd.append($hiddenInput);
								$titleTd.append($ansBtn);
							}
							<% } %>
							
							
							var $qnaUnoHidden = $("<input type='hidden' name='qnaUno' value='" + data[key].qnaUno + "'>");
							var $qnaWriterHidden = $("<input type='hidden' value='" + data[key].qnaWriter + "'>");
							$rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
							$icon = $("<i class='bullhorn icon' style='color:red'>");
							$rpPuBtnDiv.append($icon);
							$writerTd.append($qnaUnoHidden);
							$writerTd.append($qnaWriterHidden);
							if(data[key].qnaUno != <%= loginUser.getUno() %>) {
								$writerTd.append($rpPuBtnDiv);
							}
							
							
							var $dateTd = $("<td>").text(data[key].qnaDate);
							$tr.append($titleTd);
							$tr.append($writerTd);
							$tr.append($dateTd);
							$tbody.append($tr);
							
							var $contentTr = $("<tr>");
							var $contentTd = $("<td>").text(data[key].qnaContent);
							var $emptyTd = $("<td colspan='2'>");
							$contentTr.append($contentTd);
							$contentTr.append($emptyTd);
							$tbody.append($contentTr);

							if(data[key].ansTitle != null) {
								var $ansTr = $("<tr>");
								var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
								var $ansWriterTd = $("<td>").text(data[key].ansWriter);
								
								var $ansUnoHidden = $("<input type='hidden' name='ansUno' value='" + data[key].ansUno + "'>");
								var $ansWriterHidden = $("<input type='hidden' value='" + data[key].ansWriter + "'>");
								var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
								var $icon = $("<i class='bullhorn icon' style='color:red'>");
								$rpPuBtnDiv.append($icon);
								$ansWriterTd.append($ansUnoHidden);
								$ansWriterTd.append($ansWriterHidden);
								if(data[key].ansUno != <%= loginUser.getUno() %>) {
									$ansWriterTd.append($rpPuBtnDiv);
								}
								
								
								var $ansDateTd = $("<td>").text(data[key].ansDate);
								$ansTr.append($ansTitleTd);
								$ansTr.append($ansWriterTd);
								$ansTr.append($ansDateTd);
								$tbody.append($ansTr);
		
								var $ansContentTr = $("<tr>")
								var $ansContentTd = $("<td>").text(data[key].ansContent);
								var $emptyTd = $("<td colspan='2'>");
								$ansContentTr.append($ansContentTd);
								$ansContentTr.append($emptyTd);
								$tbody.append($ansContentTr);
								
							}
						}
						hideContent();
						$("#QnAHead").text("Q & A (" + ctn + ")");
						alert("QnA 등록 완료");
						$("#replyModal").modal("hide");
					}, error:function(data) {
						alert("서버 전송 실패");
					}
					
				});
				
				
				
			}else if(replyType == "review") {
				var replyInput = $(".replyInput").val();
				
				$.ajax({
					url:"<%= request.getContextPath() %>/insertRvAns.bo",
					type:"post",
					data:{rvInput:replyInput, rvWriter:<%= loginUser.getUno() %>, refBno:<%= bmap.get("bno") %>, parentBno:parentRvNo, bLevel:1, pno:<%= bmap.get("pno") %>},
					success:function(data) {
						var $tbody = $("#reviewList>tbody");
						$tbody.html("");
						var ctn = 0;
						for(var key in data) {
							ctn++;
							var $tr = $("<tr>");
							var $titleTd = $("<td>").text(data[key].rvTitle);
							for(var key2 in data[key].rvAttList) {
								var rvAtt = data[key].rvAttList[key2];
								if(rvAtt.fileLevel == 0) {
									var $titleImg = $("<img src='/st/attach_upload/" + rvAtt.changeName + "' width='40px' height='40px'>");
									$titleTd.prepend($titleImg);
								}
							}
							<% if(loginUser.getUno() == (int)bmap.get("uno")) { %>
							if(data[key].ansTitle == null) {
								var $hiddenInput = $("<input type='hidden'>").val(data[key].rvNo);
								var $ansBtn = $("<div class='ui green inverted button addReply reviewReply' data-toggle='modal' data-target='#replyModal'>").text("답글 입력");
								$titleTd.append($hiddenInput);
								$titleTd.append($ansBtn);
							}
							<% } %>
							var $writerTd = $("<td>").text(data[key].rvWriter);
							var $rvUnoHidden = $("<input type='hidden' name='rvUno' value='" + data[key].rvUno + "'>");
							var $rvWriterHidden = $("<input type='hidden' value='" + data[key].rvWriter + "'>");
							var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
							var $icon = $("<i class='bullhorn icon' style='color:red'>");
							$rpPuBtnDiv.append($icon);
							$writerTd.append($rvUnoHidden);
							$writerTd.append($rvWriterHidden);
							if(data[key].rvUno != <%= loginUser.getUno() %>) {
								$writerTd.append($rpPuBtnDiv);
							}	
								
							var $dateTd = $("<td>").text(data[key].rvDate);
							$tr.append($titleTd);
							$tr.append($writerTd);
							$tr.append($dateTd);
							$tbody.append($tr);
							
							var $contentTr = $("<tr>");
							var $contentTd = $("<td>").text(data[key].rvContent);
							for(var key2 in data[key].rvAttList) {
								var rvAtt = data[key].rvAttList[key2];
								var $imgs = $("<img src='/st/attach_upload/" + rvAtt.changeName + "' width='80px' height='80px'>");
								$contentTd.append($imgs);
							}
							var $starTd = $("<td>");
							var $starContent = $("<div class='ui star huge rating ratingContent' data-max-rating='5' data-rating='" + data[key].rvStar + "'>")
							var $emptyTd = $("<td>");
							$starTd.append($starContent);
							$contentTr.append($contentTd);
							$contentTr.append($starTd);
							$contentTr.append($emptyTd);
							$tbody.append($contentTr);

							if(data[key].ansTitle != null) {
								var $ansTr = $("<tr>");
								var $ansTitleTd = $("<td style='color:orangered'>").text("  [답변 :]" + data[key].ansTitle);
								var $ansWriterTd = $("<td>").text(data[key].ansWriter);
								var $ansUnoHidden = $("<input type='hidden' name='ansUno' value='" + data[key].ansUno + "'>");
								var $ansWriterHidden = $("<input type='hidden' value='" + data[key].ansWriter + "'>");
								var $rpPuBtnDiv = $("<div class='ui mini basic icon button reportPuBtn' data-tooltip='해당 유저를 신고하시려면 클릭하세요' data-toggle='modal' data-target='#reportModal'>")
								var $icon = $("<i class='bullhorn icon' style='color:red'>");
								$rpPuBtnDiv.append($icon);
								$ansWriterTd.append($ansUnoHidden);
								$ansWriterTd.append($ansWriterHidden);
								if(data[key].ansUno != <%= loginUser.getUno() %>) {
									$ansWriterTd.append($rpPuBtnDiv);
								}
								var $ansDateTd = $("<td>").text(data[key].ansDate);
								$ansTr.append($ansTitleTd);
								$ansTr.append($ansWriterTd);
								$ansTr.append($ansDateTd);
								$tbody.append($ansTr);
		
								var $ansContentTr = $("<tr>")
								var $ansContentTd = $("<td>").text(data[key].ansContent);
								var $emptyTd = $("<td colspan='2'>");
								$ansContentTr.append($ansContentTd);
								$ansContentTr.append($emptyTd);
								$tbody.append($ansContentTr);
								
							}
						}
						hideContent();
						$("#reviewHead").text("대여 후기 (" + ctn + ")");
						$("#userReviewCnt").text(ctn);
						alert("대여 후기 등록 완료");
						$("#replyModal").modal("hide");
					}, error:function(data) {
						alert("서버 전송 실패");
					}
				});
				
			}
			<% } %>
			
		});
		
		
	</script>
	
	
</body>
</html>








