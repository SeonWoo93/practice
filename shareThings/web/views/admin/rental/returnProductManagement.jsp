<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = 
		(ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap core JavaScript-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Share Things</title>
<style>
/*  input number 스피너 제거  */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
#filter {
	margin-top: 30px;
}
#filterArea td {
	padding: 20px;
}
/* 모달 */
.examineImg {
   display:inline-block;
   margin:30px;
}
#fileExamineArea:hover {
   cursor:pointer;
}
#hidden {
   display:none;
}
.hidden {
	display:none;
}
</style>

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resource/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resource/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 인클루드 -->
		<%@ include file="../common/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!--콘텐츠 영역 시작-->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- 메인 콘텐츠 영역 시작 -->
			<div id="content">
				<!-- 헤더 인클루드 -->
				<%@ include file="../common/header.jsp"%>
				<!-- 컨텐츠바디 영역 실제 작성 영역 -->
				<div class="container-fluid">
					<h1>대여 관리</h1>
					<div class="container-fluid">
						<hr>

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">수거 관리</h1>
						<hr>
						<div class="card-body">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-12" align="center">
										<div class="card shadow mb-4">
											<div class="card-header py-3">조회 필터</div>
											<div class="card-body">
												<div>
													<span>대여 남은 일 수 : </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-success btn-icon-split" class="dayBtn" onclick="dayFilter(1)">
													<span class="text">1일</span>
													</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-success btn-icon-split" class="dayBtn" onclick="dayFilter(3)">
													<span class="text">3일</span>
													</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-success btn-icon-split" class="dayBtn" onclick="dayFilter(7)">
													<span class="text">7일</span>
													</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-success btn-icon-split"  class="dayBtn" onclick="dayFilter(30)">
													<span class="text">30일</span>
													</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-success btn-icon-split"  class="dayBtn" onclick="dayFilter(99999)">
													<span class="text">전체</span>
													</button>
												</div>
												<form id="filterArea">
													<table class="col-lg-12" id="filter">
														<tr>

															<td width="5%">상태</td>
															<td width="15%"><select class="form-control" id="rentalStatus" name="rentalStatus">
																	<option disabled>상태</option>
																	<option value="0">전체</option>
																	<option value="RTS5">대여중</option>
																	<option value="RTS6">수거송장입력</option>
																	<option value="RTS7">수거중</option>
															</select></td>
															<td width="5%">상세조건</td>
															<td width="15%"><select class="form-control" id="details" name="details" onchange = detailsChg();>
																	<option disabled >상세조건</option>
																	<option value="0">전체</option>
																	<option value="rtNo">대여주문번호</option>
																	<option value="rtUserName">대여자이름</option>
																	<option value="pno">물품번호</option>
															</select></td>
															<td width="20%"><input type="text"
																class="form-control" placeholder="상세정보입력" disabled id="filterContent" name="filterContent"></td>

														</tr>
													</table>
													<br>
													<div align="center">
														<button type="button" id="inquiry">조회하기</button>
														&nbsp;&nbsp;
														<button type="reset">초기화</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 리스트 테이블  -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary" id="listSize"><%= list.size() %>건</h6>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12 col-md-6 col-xs-6 col-sm-6">
										<form class="form-inline">
											<div class="form-group col-md-10">
												<span>송장 정보 입력 : </span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select class="form-control" id="dCom">
													<option disabled>택배사</option>
													<option value="대한통운">대한통운</option>
													<option value="로젠택배">로젠택배</option>
													<option value="우체국택배">우체국택배</option>
													<option value="CVSnet">CVSnet 편의점택배</option>
													<option value="한진택배">한진택배</option>
												</select> 
												&nbsp;&nbsp;&nbsp;&nbsp; <span> <input type="number"
													class="form-control" id="invoiceNum" placeholder="송장번호">
												</span> 
												&nbsp;
												<br><br>
												<button type="button" class="btn btn-success btn-icon-split btn-sm" id="applyBtn">
													<span class="icon text-white-50"> <i
														class="fas fas fa-check"></i>
													</span> <span class="text">송장적용하기</span>
												</button>
												
												&nbsp;&nbsp;&nbsp;
											
												<button type="button"
													class="btn btn-danger btn-icon-split btn-sm" id="applyCancelBtn">
													<span class="icon text-white-50"> <i
														class="fas fas fa-trash"></i>
													</span> <span class="text">송장적용취소</span>
												</button>
												 
											</div>
										</form>
										<br>
										<form>
											&nbsp;&nbsp;
											<button type="button" class="btn btn-secondary btn-icon-split btn-sm" id="returnPdBtn">
												<span class="icon text-white-50"> <i
													class="fas fas fa-arrow-right"></i>
												</span> <span class="text">수거요청</span>
											</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button"
												class="btn btn-secondary btn-icon-split btn-sm" id="returnBtn"
												data-toggle="modal" data-target="#returnModal">
												<span class="icon text-white-50"> <i
													class="fas fas fa-arrow-left"></i>
												</span> <span class="text">수거처리</span>
											</button>
										</form>
									</div>
								</div>
								<br>
								<div class="table-responsive">
									<div class="dataTables_wrapper dt-bootstrap4"
										id="dataTable_wrapper">

										<div class="row">
											<div class="col-sm-12">
												<table width="100%" class="table table-bordered dataTable table-hover"
													id="dataTable" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;"
													cellspacing="0">
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 10px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox" id="checkAll"></th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">대여주문번호</th>
															<th tabindex="0" class="sorting_asc"
																aria-controls="dataTable" style="width: 50px;"
																aria-sort="ascending" rowspan="1" colspan="1">물품번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 50px;"
																rowspan="1" colspan="1">대여 시작일</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여 만료일</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">남은 일 수</th>

															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 45px;"
																rowspan="1" colspan="1">대여자 ID</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 45px;"
																rowspan="1" colspan="1">대여자 이름</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 55px;"
																rowspan="1" colspan="1">대여자 연락처</th>
															
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">수거상태</th>
														</tr>
													</thead>
													<tbody>
														<% for(int i = 0; i<list.size(); i++){
															HashMap<String, Object> hmap = list.get(i);	
														
														%> 
														<tr class="even" role="row" align="center">
															<td><input type="checkBox" class="check"></td>
															<td><%= hmap.get("rtNo") %></td>
															<td><%= hmap.get("pno")%></td>
															<td><%= hmap.get("rtStDate")%></td>
															<td><%= hmap.get("rtEndDate")%></td>
															<td id="endDay"><%= hmap.get("endDay") %></td>
															<td><%= hmap.get("userId")%></td>
															<td><%= hmap.get("userName")%></td>
															<td><%= hmap.get("phone")%></td>
															<td><%= hmap.get("rtStatus")%></td>
														</tr>
														<% } %>
													</tbody>
												</table>
												<div id="result-null">
													<% if(list.size() <= 0){ %>
														<br><br><br><br><br><br>
														<h3 align="center"> 조회 결과가 없습니다.</h3>
														<br><br><br><br><br><br>
													<% } %>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- 메인 콘텐트 영역 끝 -->
				<!-- Footer 인클루드 -->
			</div>
			<%@ include file="../common/footer.jsp"%>
			<!-- 메인 콘텐츠 영역 끝 -->
		</div>
		<!-- 콘텐츠 영역 끝 -->
	</div>

	<!-- 맨위로-->
	<%@ include file="../common/toTop.jsp"%>

	<!-- 로그아웃 모달-->
	<%@ include file="../common/logoutModal.jsp"%>

	
	<form action="<%= request.getContextPath() %>/returnPdexamine.rt" method="post"
	     encType="multipart/form-data">
		<div class="modal fade" id="returnModal" role="dialog">
		  <div class="modal-dialog">
		     <!-- Modal content-->
		     <div class="modal-content">
		        <div class="modal-header">
		           <h4 class="modal-title">수거 처리(검수 처리)</h4>
		           <button type="button" class="close" >&times;</button>
		        </div>
		        <div class="row">
		           <div class="col-md-12 col-lg-12">
		              <div class="modal-body">
		                 <p>물품명과 검수상태를 확인하고 처리하세요</p>
		                 <div class="panel-body">
		                    <table width="100%"
		                       class="table table-striped table-bordered table-hover"
		                       id="dataTables-example">
		                       <thead>
		                          <tr>
		                             <th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
		                             <th style="text-align: center;" class="text-black-50 small">물품번호</th>
		                             <th style="text-align: center;" class="text-black-50 small">물품명</th>
		                             <th style="text-align: center;" class="text-black-50 small">등록자</th>
		                             <th style="text-align: center;" class="text-black-50 small">등록아이디</th>
		                          </tr>
		                       </thead>
		                       <tbody>
		                       </tbody>
		                    </table>
		                 </div>
		                 <hr>
		                 <h5>*검수사진</h5>   
		                    <div id="fileExamineArea" class="col-md-12 col-lg-12">
		                       <div class="examineImg" id="examine1">
		                          <img id="examineImg1" width="150" height="150">
		                       </div>
		                       <div class="examineImg" id="examine2">
		                          <img id="examineImg2" width="150" height="150">
		                       </div>
		                       <div class="examineImg" id="examine3">
		                          <img id="examineImg3" width="150" height="150">
		                       </div>
		                       <div class="examineImg" id="examine4">
		                          <img id="examineImg4" width="150" height="150">
		                       </div>
		                    </div>
		                    <div id="fileArea">
		                       <input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
		                       <input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
		                       <input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
		                       <input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
		                    </div>
		                 <hr>
		                 <h5>*검수내용</h5>
		                	 <input type="hidden" name="checker" value="<%= loginUser.getUno() %>">
		                    <textarea id="textResult" required name="textResult" class="col-lg-12" placeholder="EX)이상없음"></textarea>
		              </div>
		              <div class="modal-footer">
		                 <button type="submit" class="btn btn-default"
		                     id="result">수거처리</button>
		                 <button type="button" class="btn btn-default"
		                    data-dismiss="modal">닫기</button>
		              </div>
		           </div>
		        </div>
		     </div>
		  </div>
		</div>
	</form>
	<script>
	//대여상태 코드
	var RTS1 = "대여대기";
	var RTS2 = "대여승인";
	var RTS3 = "대여취소";
	var RTS4 = "대여송장입력(발송대기)";
	var RTS5 = "대여중";
	var RTS6 = "수거송장입력(발송대기)";
	var RTS7 = "수거중";
	var RTS8 = "대여완료";
	var RTS9 = "대여취소요청";
	var RTS10 = "대여취소";
	
	//체크박스 전체 선택
	$("#checkAll").click(function() {
		var check = $(this).is(":checked");
		var result = $(".even").find("td").eq(6).text();
		if(check) {
			$(".check").prop("checked", true);
		} else {
			$(".check").prop("checked", false);
		}
	});
	//대여기간이 3일이하로 남은 물품 강조
	$(function(){
		
		$(".even").each(function(){
			var endDay = $(this).find("td").eq(5).text();
			if(endDay<=3){
				$(this).find("td").eq(5).prop("color","red");
				console.log($(this).attr("bgColor","lightgray"));
			}else {
				
			}
		});
	});
	//택배송장 입력 
	$("#applyBtn").click(function(){
		if(confirm("송장번호를 적용하시겠습니까?")){
			
			var status = new Array();
			var dCom =  $("#dCom").val();
			var rtNos = new Array();
			var pnos = new Array();
			var invoiceNum = $("#invoiceNum").val();
			var rtStatus = "";
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					status.push($(this).find("td").eq(1).text());
					
					rtNos = $(this).find("td").eq(1).text();
					pnos = $(this).find("td").eq(2).text();
					rtStatus = $(this).find("td").eq(9).text();
				}
			});
			console.log(rtStatus);
			if(rtStatus == RTS6){
				alert("이미 입력된 물품입니다");
				return false;
			}
			if(rtStatus == RTS7){
				alert("수거중인 물품입니다");
				return false;
			}
			if(invoiceNum == ""){
				alert("송장번호를 입력하세요");
				return false;
			}
			if(status.length != 1 ) {
				alert("적용하실 물품을 1개 선택하세요");
				return false;
			}
			//송장번호 받아오기
			
			location = "<%= request.getContextPath() %>/insertReturnInvcNum.rt?rtNos=" + rtNos + 
														"&invoiceNum=" + invoiceNum + 
														"&pnos=" + pnos + 
														"&dCom=" + dCom ;
		}
		
	});
	//택배송장 취소
	$("#applyCancelBtn").click(function(){
		if(confirm("송장번호 입력 취소하시겠습니까?")){
			
			var status = new Array();
			var dCom =  $("#dCom").val();
			var rtNos = new Array();
			var pnos = new Array();
			var invoiceNum = $("#invoiceNum").val();
			var rtStatus = "";
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {
					status.push($(this).find("td").eq(1).text());
					
					rtNos.push($(this).find("td").eq(1).text());
					pnos.push($(this).find("td").eq(2).text());
					rtStatus = $(this).find("td").eq(9).text();
				}
			});
			if(rtStatus != RTS6){
				alert("송장번호가 입력되지 않은 물품입니다");
				return false;
			}
			if(status.length == 0) {
				alert("적용하실 물품을 한개이상 선택하세요");
				return false;
			}
			
			location = "<%= request.getContextPath() %>/deleteReturnInvcNum.rt?rtNos=" + rtNos + 
														"&pnos=" + pnos;
		}
	
	});
	
	//수거요청
	$("#returnPdBtn").click(function(){
		if(confirm("수거 요청 처리 하시겠습니까?")){
			var status = new Array();
			var rtNos = new Array();
			var pnos = new Array();
			var rtStatus = "";
			var rtStatusCheck = true;
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {
					//운송장번호가 입력되지않은  물품이 있는경우
					if($(this).find("td").eq(9).text() != RTS6){
						console.log($(this).find("td").eq(9).text());
						rtStatusCheck = false;
					}
					
					status.push($(this).find("td").eq(0).text());
					
					rtNos.push($(this).find("td").eq(1).text());
					pnos.push($(this).find("td").eq(2).text());
					rtStatus = $(this).find("td").eq(9).text();
				}
			});
			if(rtStatusCheck == false){
				alert("송장번호가 입력되지 않은 물품이 있습니다");
				return false;
			}
			if(status.length == 0) {
				alert("적용하실 물품을 한개이상 선택하세요");
				return false;
			}
			
			location = "<%= request.getContextPath() %>/updateReturnPd.rt?rtNos=" + rtNos + 
														"&pnos=" + pnos;
		}
		
		
	});
	
	/****************************************************************************/
		//검수사진
        $("#fileArea").hide();
        $("#examine1").click(function() {
           $("#img1").click();
        });
        $("#examine2").click(function() {
           $("#img2").click();
        });
        $("#examine3").click(function() {
           $("#img3").click();
        });
        $("#examine4").click(function() {
           $("#img4").click();
        });
	
		//사진, 검수내용 등록
      function loadImg(value, num) {
			console.log("onload");
			console.log(value);
			console.log(num);
         if(value.files && value.files[0]) {
        	 console.log("if");
            var reader = new FileReader();
            reader.onload = function(e) {
               switch(num) {
               case 1 :
                  $("#examineImg1").attr("src", e.target.result);
                  console.log( e.target.result);
                  break;
               case 2 :
                  $("#examineImg2").attr("src", e.target.result);
                  break;
               case 3 :
                  $("#examineImg3").attr("src", e.target.result);
                  break;
               case 4 :
                  $("#examineImg4").attr("src", e.target.result);
                  break;
               }
            }
            reader.readAsDataURL(value.files[0]);
         }
      }
	//수거처리 버튼
	$("#returnBtn").click(function() {
		var status = new Array();
		var rtStatus = new Array();
		var pno = new Array();
		var rtStatusCheck = true;
		$(".even").each(function() {
			if($(this).find(".check").is(":checked")) {	
				//상태가 수거중이 아닌  물품이 있는경우
				if($(this).find("td").eq(9).text() != RTS7){
					rtStatusCheck = false;
				}
				status.push($(this).find("td").eq(1).text());
				rtStatus.push($(this).find("td").eq(8).text());
				pno.push($(this).find("td").eq(2).text());
			}
		});
		if(status.length != 1) {
			alert("적용하실 물품을 한개 선택하세요");
			return false;
		}
		if(rtStatusCheck==false){
			alert("수거중이지 않은 물품이 있습니다");
			return false;
		}
		
		
		$.ajax({
			url:"selectShpNum.rt?status=" + status,
			type:"get",
			async:false,
			success:function(data) {
				var $dataTables = $("#dataTables-example tbody");
				var $textarea = $("<textarea id='textResult' name='textResult' class='col-lg-12' placeholder='EX)거짓 정보 등록'></textarea>");
				//기존 테이블 행 제거
				$("#dataTables-example > tbody > tr").remove();
				$textarea.remove();
				
				console.log(data);
				for(var key in data) {
					console.log(data[key]);
					var $tr = $("<tr class='odd gradeX'>");
					var $rnoTd =  $("<td>").text(data[key].rno);
					var $pnoTd =  $("<td>").text(data[key].pno);
					var $modelTd =  $("<td>").text(data[key].model);
					var $userNameTd =  $("<td>").text(data[key].userName);
					var $userIdTd =  $("<td>").text(data[key].userId);
					var $hidden1 = $("<textarea class='hidden' name='rno'>").text(data[key].rno);
					var $hidden2 = $("<textarea class='hidden' name='pno'>").text(data[key].pno);
					var $hidden3 = $("<textarea class='hidden' name='userId'>").text(data[key].userId);
					
					
					$tr.append($rnoTd);
					$tr.append($pnoTd);
					$tr.append($modelTd);
					$tr.append($userNameTd);
					$tr.append($userIdTd);
					$dataTables.append($tr);
					$dataTables.append($hidden1);
					$dataTables.append($hidden2);
					$dataTables.append($hidden3);
				}
			},
			error:function(data){
				console.log("에러");
			}
		});
	});
	
	
	</script>
	<script>

		/* 상세조건이 전체일때 상세정보입력 비활성화 */
		function detailsChg(){
			if($("#details").val()=="0"){
				$("#filterContent").attr("disabled",true);
				$("#filterContent").val("");
			}else {
				$("#filterContent").attr("disabled",false);
				$("#filterContent").val("");
			}
		}
		
		
	
	</script>
	<script>
		<!-- 조회필터 ajax -->
		$(function(){
			$("#inquiry").click(function(){
				var rentalStatus = $("#rentalStatus").val();
				var details = $("#details").val();
				var filterContent = $("#filterContent").val();
				console.log(rentalStatus);
				console.log(details);

				/*상세정보가 전체가 아닌경우 alert 창 띄운후 리턴*/
				if(details != "0"){
					if(filterContent == ""){
						alert("상세정보를 입력하세요");
						return;
					}
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/selectRtPdFilter.rt",
					data:{rentalStatus:rentalStatus,
						details:details,
						filterContent:filterContent
					},
					type:"get",
					success:function(data){
						 /* 기존 테이블 행 제거 */
						$("#dataTable > tbody > tr").remove();
						var $dataTable = $("#dataTable");
						/* 조회된 값이 없을때 출력할 공간 */
						var $resultNull = $("#result-null");
						/* 조회된 건수 출력할 공간 */
						var $listSize = $("#listSize");
						
						
						/* 값넣을 공간 비우기 */
						$resultNull.html('');
						$listSize.prop("innerHTML",'');
						if(data.length>0){
							
							for(var key in data){
								
								/* 가져온 값 td에 입력 */
								var $tr = $("<tr class='even' role='row' align='center'>");
								
								var $chkTd = $("<td><input type='checkBox' class='check'>");
								var $rtNoTd =  $("<td>").text(data[key].rtNo);
								var $pNoTd =  $("<td>").text(data[key].pno);
								var $rtStDateTd =  $("<td>").text(data[key].rtStDate);
								var $rtEndDateTd =  $("<td>").text(data[key].rtEndDate);
								var $endDayTd =  $("<td id='endDay'>").text(data[key].endDay);
								var $userIdTd = $("<td>").text(data[key].userId);
								var $userNameTd = $("<td>").text(data[key].userName);
								var $phoneTd = $("<td>").text(data[key].phone);
								
								var $rtStatusTd = $("<td>").text(data[key].rtStatus);
								
								/* tr에 td추가 */
								$tr.append($chkTd);
								$tr.append($rtNoTd);
								$tr.append($pNoTd);
								$tr.append($rtStDateTd);
								$tr.append($rtEndDateTd);
								$tr.append($endDayTd);
								$tr.append($userIdTd);
								$tr.append($userNameTd);
								$tr.append($phoneTd);
								$tr.append($rtStatusTd);
								
								/* table에 tr추가 */
								$dataTable.append($tr);  
							}
						}else {
							/* 조회된 값이 없을때 출력 */
							$resultNull.append("<br><br><br><br><br><br>");
							$resultNull.append("<h3 align='center'> 조회 결과가 없습니다.</h3>");
							$resultNull.append("<br><br><br><br><br><br>");
						}
						$listSize.prop("innerHTML",data.length+"건");
					},
					error:function(){
						console.log("error");
					}
					
				});
			});
			
			
		});	
		
		function dayFilter(selectDay){
			$.ajax({
				url:"<%=request.getContextPath()%>/selectRtPdDayFilter.rt",
				data:{selectDay:selectDay
				},
				type:"get",
				success:function(data){
					 /* 기존 테이블 행 제거 */
					$("#dataTable > tbody > tr").remove();
					var $dataTable = $("#dataTable");
					/* 조회된 값이 없을때 출력할 공간 */
					var $resultNull = $("#result-null");
					/* 조회된 건수 출력할 공간 */
					var $listSize = $("#listSize");
					
					
					/* 값넣을 공간 비우기 */
					$resultNull.html('');
					$listSize.prop("innerHTML",'');
					if(data.length>0){
						
						for(var key in data){
							
							/* 가져온 값 td에 입력 */
							var $tr = $("<tr class='even' role='row' align='center'>");
							
							var $chkTd = $("<td><input type='checkBox' class='check'>");
							var $rtNoTd =  $("<td>").text(data[key].rtNo);
							var $pNoTd =  $("<td>").text(data[key].pno);
							var $rtStDateTd =  $("<td>").text(data[key].rtStDate);
							var $rtEndDateTd =  $("<td>").text(data[key].rtEndDate);
							var $endDayTd =  $("<td id='endDay'>").text(data[key].endDay);
							var $userIdTd = $("<td>").text(data[key].userId);
							var $userNameTd = $("<td>").text(data[key].userName);
							var $phoneTd = $("<td>").text(data[key].phone);
							
							var $rtStatusTd = $("<td>").text(data[key].rtStatus);
							
							/* tr에 td추가 */
							$tr.append($chkTd);
							$tr.append($rtNoTd);
							$tr.append($pNoTd);
							$tr.append($rtStDateTd);
							$tr.append($rtEndDateTd);
							$tr.append($endDayTd);
							$tr.append($userIdTd);
							$tr.append($userNameTd);
							$tr.append($phoneTd);
							$tr.append($rtStatusTd);
							
							/* table에 tr추가 */
							$dataTable.append($tr);  
						}
					}else {
						/* 조회된 값이 없을때 출력 */
						$resultNull.append("<br><br><br><br><br><br>");
						$resultNull.append("<h3 align='center'> 조회 결과가 없습니다.</h3>");
						$resultNull.append("<br><br><br><br><br><br>");
					}
					$listSize.prop("innerHTML",data.length+"건");
				},
				error:function(){
					console.log("error");
				}
				
			});
			
		}
		

	</script>
	
	<script
		src="<%=request.getContextPath()%>/resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/resource/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/resource/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-pie-demo.js"></script>

</body>

</html>