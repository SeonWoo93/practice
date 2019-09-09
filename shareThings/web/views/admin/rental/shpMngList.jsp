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
						<h1 class="h3 mb-2 text-gray-800">발송 관리</h1>
						<hr>
						<div class="card-body">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-12" align="center">
										<div class="card shadow mb-4">
											<div class="card-header py-3">조회 필터</div>
											<div class="card-body">
												<form id="filterArea">
													<table class="col-lg-12" id="filter">
														<tr>
															<td width="5%">주문상태</td>
															<td width="5%"><select class="form-control">
																	<option disabled>주문상태</option>
																	<option value="0">대여승인</option>
																	<option value="10">대여대기</option>
																	<option value="10">대여송장입력</option>
															</select></td>
															<td width="5%">상세조건</td>
															<td width="25%"><select class="form-control">
																	<option>상세조건</option>
																	<option value="0">대여주문번호</option>
																	<option value="10">대여자이름</option>
																	<option value="20">물품명</option>
																	<option value="30">물품번호</option>
															</select></td>
															<td width="30%"><input type="text"
																class="form-control" placeholder="상세정보입력"></td>

														</tr>

														<tr>
															<td>대여기간</td>
															<td width="35%">
																<input type="date"  name="startDate" style="width: 150px"> &nbsp; ~ &nbsp;
																<input type="date"  name="endDate" style="width: 150px">
															</td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</table>
													<br>
													<div align="center">
														<button type="submit">조회하기</button>
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
								<h5 class="m-0 font-weight-bold text-primary" id="listSize"><%= list.size()%>건</h5>
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
												&nbsp;&nbsp;&nbsp;
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
											<button type="button" class="btn btn-secondary btn-icon-split btn-sm" id="forwardingBtn">
												<span class="icon text-white-50"> <i
													class="fas fas fa-arrow-right"></i>
												</span> <span class="text">발송처리</span>
											</button>
											&nbsp;&nbsp;&nbsp;

											<button type="button"
												class="btn btn-danger btn-icon-split btn-sm" id="cancelBtn"
												data-toggle="modal" data-target="#cancelModal">
												<span class="icon text-white-50"> <i
													class="fas fas fa-trash"></i>
												</span> <span class="text">대여취소</span>
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
												<table width="100%"
													class="table table-bordered dataTable table-hover"
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
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여요청일시</th>
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
																rowspan="1" colspan="1">배송지</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">주문상태</th>

														</tr>
													</thead>
													<tbody>
														<% for(int i = 0; i<list.size(); i++){
															HashMap<String, Object> hmap = list.get(i);	
														
														%> 
														
														<tr class="odd" role="row" align="center">
															<td><input type="checkBox" class="check"></td>
															<td><%= hmap.get("rno") %></td>
															<td><%= hmap.get("pno")%></td>
															<td><%= hmap.get("rtReqDate")%></td>
															<td><%= hmap.get("userId")%></td>
															<td><%= hmap.get("userName")%></td>
															<td><%= hmap.get("phone")%></td>
															<td><%= hmap.get("address")%></td>
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
	<!-- 대여취소  Modal -->
	<div class="modal fade" id="cancelModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">대여 취소처리</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="modal-body">
							<p>물품명과 요청자를 확인하고 처리하세요</p>
							<div class="panel-body">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th style="text-align: center;" class="text-black-50 small">등록요청번호</th>
											<th style="text-align: center;" class="text-black-50 small">요청인</th>
											<th style="text-align: center;" class="text-black-50 small">물품번호</th>
											<th style="text-align: center;" class="text-black-50 small">모델명</th>
											<th style="text-align: center;" class="text-black-50 small">요청자ID</th>
											<th style="text-align: center;" class="text-black-50 small">상태</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd" role="row" align="center">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h5>*취소상세사유</h5>
							<textarea id="textResult" class="col-lg-12" placeholder="EX)고객요청으로 인한 취소"></textarea>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default" id="cancel"
								data-dismiss="modal">취소처리</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
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
	
			//대여취소 버튼
			$("#cancelBtn").click(function() {
				var status = new Array();
				var rtStatus = new Array();
				var rtStatusCheck = "";
				$(".odd").each(function() {
					if($(this).find(".check").is(":checked")) {	
						//대여상태가 발송대기인 물품이 있는경우
						if($(this).find("td").eq(8).text() == RTS4){
							rtStatusCheck = "RTS4";
						}
						status.push($(this).find("td").eq(1).text());
						rtStatus.push($(this).find("td").eq(8).text());
					}
				});
				if(status.length == 0) {
					alert("적용하실 물품을 한개이상 선택하세요");
					return false;
				}
				if(rtStatusCheck=="RTS4"){
					alert("송장정보가 있는 물품이 있습니다.");
					return false;
				}
				
				
				$.ajax({
					url:"selectShpNum.rt?status=" + status,
					type:"get",
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
							var $rtStatusTd =  $("<td>").text(data[key].rtStatus);
							
							$tr.append($rnoTd);
							$tr.append($pnoTd);
							$tr.append($modelTd);
							$tr.append($userNameTd);
							$tr.append($userIdTd);
							$tr.append($rtStatusTd);
							$dataTables.append($tr);
						}
					},
					error:function(data){
						console.log("에러");
					}
				});
			});
			
			//모달 취소처리button
			$("#cancel").click(function(){
				var conResult = confirm("취소처리 하시겠습니까?");
				if(conResult == true){
					var rtNos = new Array();
					var pnos = new Array();
					//취소선택된 테이블 가져오기
					$(".gradeX").each(function(){
						rtNos.push($(this).find("td").eq(0).text());
						pnos.push($(this).find("td").eq(0).text());
					});
					var textResult = $("#textResult").val();
					location = "<%= request.getContextPath() %>/cancel.rt?rtNos=" + rtNos + "&textResult=" + textResult + "&pnos=" + pnos;
				}
			});
			
			
			//체크박스 전체 선택
			$("#checkAll").click(function() {
				var check = $(this).is(":checked");
				var result = $(".even").find("td").eq(6).text();
				if(check) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
				console.log(RTS1);
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
					$(".odd").each(function() {
						if($(this).find(".check").is(":checked")) {	
							status.push($(this).find("td").eq(1).text());
							
							rtNos = $(this).find("td").eq(1).text();
							pnos = $(this).find("td").eq(2).text();
							userId = $(this).find("td").eq(4).text();
							rtStatus = $(this).find("td").eq(8).text();
						}
					});
					console.log(rtStatus);
					if(rtStatus == RTS1){
						alert("대여 승인되지않은 물품입니다");
						return false;
					}
					if(rtStatus == RTS4){
						alert("이미 입력된 물품입니다");
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
					
					location = "<%= request.getContextPath() %>/insertInvcNum.rt?rtNos=" + rtNos + 
																"&invoiceNum=" + invoiceNum + 
																"&pnos=" + pnos + 
																"&dCom=" + dCom +
																"&userId=" + userId;
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
					$(".odd").each(function() {
						if($(this).find(".check").is(":checked")) {
							status.push($(this).find("td").eq(1).text());
							
							rtNos.push($(this).find("td").eq(1).text());
							pnos.push($(this).find("td").eq(2).text());
							rtStatus = $(this).find("td").eq(8).text();
							console.log(rtNos);
						}
					});
					if(rtStatus != RTS4){
						alert("송장번호가 입력되지 않은 물품입니다");
						return false;
					}
					if(status.length == 0) {
						alert("적용하실 물품을 한개이상 선택하세요");
						return false;
					}
					//송장번호 받아오기
					
					location = "<%= request.getContextPath() %>/deleteInvcNum.rt?rtNos=" + rtNos + 
																"&pnos=" + pnos;
				}
				
			});
			//발송처리 
			$("#forwardingBtn").click(function(){
				if(confirm("발송 처리 하시겠습니까?")){
					var status = new Array();
					var rtNos = new Array();
					var pnos = new Array();
					var rtStatus = "";
					var rtStatusCheck = true;
					$(".odd").each(function() {
						if($(this).find(".check").is(":checked")) {
							//운송장번호가 입력되지않은  물품이 있는경우
							if($(this).find("td").eq(8).text() != RTS4){
								rtStatusCheck = false;
							}
							
							status.push($(this).find("td").eq(1).text());
							
							rtNos.push($(this).find("td").eq(1).text());
							pnos.push($(this).find("td").eq(2).text());
							rtStatus = $(this).find("td").eq(8).text();
							console.log(rtNos);
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
					
					location = "<%= request.getContextPath() %>/updateForwarding.rt?rtNos=" + rtNos + 
																"&pnos=" + pnos;
				}
				
				
			});
			
	
	</script>
	<!-- 맨위로-->
	<%@ include file="../common/toTop.jsp"%>

	<!-- 로그아웃 모달-->
	<%@ include file="../common/logoutModal.jsp"%>


	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%= request.getContextPath() %>/resource/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-pie-demo.js"></script>
</body>

</html>

