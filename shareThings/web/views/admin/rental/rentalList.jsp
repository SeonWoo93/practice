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
<style>
#filter {
	margin-top: 30px;
}

#filterArea td {
	padding: 20px;
}
</style>
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
						<h1 class="h3 mb-2 text-gray-800">대여 조회</h1>
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
															<td width="5%">대여상태</td>
															<td width="5%">
																<select class="form-control" id="rentalStatus" name="rentalStatus">
																		<option value="0">전체</option>
																		<option value="RTS1">대여대기</option>
																		<option value="RTS2">대여승인</option>
																		<option value="RTS3">대여거절</option>
																		<option value="RTS4">대여송장입력(발송대기)</option>
																		<option value="RTS5">대여중</option>
																		<option value="RTS6">수거종장입력(발송대기)</option>
																		<option value="RTS7">수거중</option>
																		<option value="RTS8">대여완료</option>
																		<option value="RTS9">대여취소요청</option>
																		<option value="RTS10">대여취소</option>  
																</select>
															</td>
															<td width="5%">상세조건</td>
															<td width="25%">
															<select class="form-control" id="details" name="details" onchange = detailsChg();>
																	<option value="0">전체</option>
																	<option value="rtNo">대여주문번호</option>
																	<option value="rtUserName">대여자이름</option>
																	<option value="model">물품명</option>
																	<option value="pno">물품번호</option>
															</select>
															</td>
															<td width="30%">
																<input type="text" class="form-control" placeholder="상세정보입력" disabled id="filterContent" name="filterContent">
															</td>
															<td>
															</td>
														</tr>

														<tr>
															<td>대여요청일</td>
															<td width="30%"><input type="date" id="startDate" name="startDate"
																style="width: 140px"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~ &nbsp;<input
																type="date" id="endDate" name="endDate" style="width: 140px">
															</td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
														<tr>
              
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
								<h5 class="m-0 font-weight-bold text-primary" id="listSize"><%= list.size()%>건</h5>
							</div>
							<div class="card-body">
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
																aria-controls="dataTable" style="width: 57px;"
																rowspan="1" colspan="1" id="th_rtNo">대여주문번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 61px;"
																rowspan="1" colspan="1" id="th_rtUser">대여자</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 50px;"
																aria-sort="ascending" rowspan="1" colspan="1" id="th_rtPd">물품번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 31px;"
																rowspan="1" colspan="1">물품명</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">대여요청일</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여상태</th>
														</tr>
													</thead>
													<tbody>
														<% for(int i = 0; i<list.size(); i++){
															HashMap<String, Object> hmap = list.get(i);	
														
														%> 
														
														<tr class="even" role="row" align="center">
															<td><%= hmap.get("rno") %></td>
															<td><%= hmap.get("userName")%></td>
															<td><%= hmap.get("pno")%></td>
															<td><%= hmap.get("model")%></td>
															<td><%= hmap.get("rtReqDate")%></td>
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
							<div id="replySelectArea">
								<table id="dataTable2" border="1" align="center"></table>
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

	<script>
		<!-- 조회필터 ajax -->
		$(function(){
			$("#inquiry").click(function(){
				var rentalStatus = $("#rentalStatus").val();
				var details = $("#details").val();
				var filterContent = $("#filterContent").val();
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				console.log(rentalStatus);
				/* 조회기간을 한쪽만 설정하거나 시작일이 더 클 때 alert 창 띄운후 리턴 */
				if(startDate>endDate || (endDate!="" && startDate=="")){
					alert("기간이 잘못 되었습니다");
					return;
				}
				/*상세정보가 전체가 아닌경우 alert 창 띄운후 리턴*/
				if(details != "0"){
					if(filterContent == ""){
						alert("상세정보를 입력하세요");
						return;
					}
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/selectFilter.rt",
					data:{rentalStatus:rentalStatus,
						details:details,
						filterContent:filterContent,
						startDate:startDate,
						endDate:endDate
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
								var $tr = $("<tr class='odd' role='row' align='center'>");
								var $rtNoTd =  $("<td>").text(data[key].rno);
								var $userNameTd = $("<td>").text(data[key].userName);
								var $pnoTd = $("<td>").text(data[key].pno);
								var $modelTd = $("<td>").text(data[key].model);
								var $stdateTd = $("<td>").text(data[key].rtReqDate);
								var $statusTd = $("<td>").text(data[key].rtStatus);
								
								/* tr에 td추가 */
								$tr.append($rtNoTd);
								$tr.append($userNameTd);
								$tr.append($pnoTd);
								$tr.append($modelTd);
								$tr.append($stdateTd);
								$tr.append($statusTd);
								
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
		};
	
	</script>
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

