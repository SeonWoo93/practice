<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.member.model.vo.*, com.kh.st.common.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
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
.even:hover {
	cursor: pointer;
}

#filter td {
	padding: 5px;
}

.paging {
	margin-left: auto;
	margin-right: auto;
}

#dataTables-detail td {
	padding: 8px;
}

.MTR {
	color: black;
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
					<h1 class="h3 mb-2 text-gray-800">회원정보관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12 col-sm-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									
										<table class="col-lg-12 col-sm-12" id="filter">
											<tr style="height: 20px">
												<td style="width: 70px">회원ID :</td>
												<td><input type="text" id="userIdF" style="width: 80%"></td>
												<td style="width: 70px">회원명 :</td>
												<td><input type="text" id="userNameF" style="width: 80%"></td>
												<td style="width: 90px">회원등급 :</td>
												<td><select style="heigth: 30px; width: 80%;" id="userLvF">
														<option value="0">전체</option>
														<option value="MLV1">Bronze</option>
														<option value="MLV2">Silver</option>
														<option value="MLV3">Gold</option>
														<option value="MLV4">VIP</option>
														<option value="MLV5">VVIP</option>
												</select></td>
												<td style="width: 60px">상태 :</td>
												<td><select style="heigth: 30px; width: 80%;" id="statusF">
														<option value="0">전체</option>
														<option value="Y">가입</option>
														<option value="N">탈퇴</option>
												</select></td>
											</tr>
											<tr>
												<td style="width: 70px">가입일 :</td>
												<td colspan="3"><input type="date" id="startD" style="width: 20%">&nbsp;&nbsp;&nbsp; ~
													&nbsp;&nbsp;&nbsp; <input type="date" id="endD" style="width: 20%"></td>
											</tr>
										</table>
										<div>
											<button id="inquiry" onclick="filteringP(1)">조회하기</button>
											&nbsp;&nbsp;&nbsp;
											<button type="reset">초기화</button>
										</div>
									
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<div>
														<p align="left">
															
														</p>
													</div>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width:2%;">No</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width: 10%;">회원ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width:10%;">회원명</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width:15%;">전화번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width:15%;">주소</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 10%;">보유 수익금</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">보유 적립금</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">보유 벌점</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">가입일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 8%;">상태</th>
															</tr>
														</thead>

														<tbody>
															<%
																for (Member m : list) {
															%>
															<tr role="row" class="even" align="center" data-toggle="modal" data-target="#detail">
																<td><%=m.getUno()%></td>
																<td><%=m.getUserId()%></td>
																<td><%=m.getUserName()%></td>
																<td><%=m.getPhone()%></td>
																<td><%=m.getAddress()%></td>
																<td><%=m.getProfits()%></td>
																<td><%=m.getTotalPoint()%></td>
																<td><%=m.getPenaltyPoint()%></td>
																<td><%=m.getEnrollDate()%></td>
																<td><%=m.getStatus()%></td>
															</tr>
															<%
																}
															%>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
		<div class="paging">
			<div class="col-sm-12 col-lg-12">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<ul class="pagination" id="pagingUl">
						<li class="paginate_button page-item"
							id="dataTable_first"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=1"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">First</a></li>

						<%
								if (currentPage <= 1) {
						%>
						<li class="paginate_button page-item disabled"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								}
						%>
						<%
								for (int p = startPage; p <= endPage; p++) {
								    if (p == currentPage) {
						%>
						<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								}
						%>


						<%
								}
						%>
						
						<%
								if (currentPage >= maxPage) {
						%>
						<li class="paginate_button page-item disabled" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%      }     %>
						<li class="paginate_button page-item next" id="dataTable_end"><a
							href="<%=request.getContextPath()%>/selectList.me?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">End</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="modal fade" id="detail" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title MTR">회원 상세보기</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="row">
									<div class="col-md-12 col-lg-12">
										<div class="modal-body">
											<div class="panel-body">
												<table width="100%"
													 id="dataTables-detail">
													<tbody>
														<tr>
															<td width="20%" class="MTR">No.</td>
															<td id="noTd" colspan="2" width="13%"></td>
															<td width="20%" class="MTR">상태</td>
															<td id="statusTd" colspan="2" width="13%"></td>
														</tr>
														<tr>
															<td width="20%" class="MTR">ID</td>
															<td id="idTd" width="13%"></td>
															<td width="20%" class="MTR">회원명</td>
															<td id="nameTd" width="13%"></td>
															<td width="20%" class="MTR">등급</td>
															<td id="levelTd" width="13%"></td>
														</tr>
														<tr>
															<td width="25%" class="MTR">계정연동</td>
															<td width="17%" id="socialTd"></td>
															<td width="25%" class="MTR">선택약관</td>
															<td id="optionTd"></td>
															<td width="25%" class="MTR">메일인증</td>
															<td id="emailVTd"></td>
														</tr>
														<tr>
															<td width="20%" class="MTR">수익금</td>
															<td id="profitsTd"></td>
															<td width="20%" class="MTR">적립금</td>
															<td id="pointTd"></td>
															<td width="20%" class="MTR">벌점</td>
															<td id="penaltyTd"></td>
														</tr>
														<tr>
															<td class="MTR">생년월일</td>
															<td id="birthTd" colspan="2"></td>
															<td class="MTR">성별</td>
															<td id="genderTd" colspan="2"></td>
															
														</tr>
														<tr>
															<td class="MTR">전화번호</td>
															<td id="phoneTd" colspan="5"></td>
														</tr>
														<tr id="hide" style="display:none">
															<td class="MTR">비상번호</td>
															<td id="subPhoneTd" colspan="5"></td>
														</tr>
														<tr>
															<td class="MTR">주소</td>
															<td id="addressTd" colspan="5"></td>
														</tr>
														<tr>
															<td class="MTR">이메일</td>
															<td id="emailTd" colspan="5"></td>
														</tr>
														<tr>
															<td class="MTR">가입일</td>
															<td id="enrollTd" colspan="2"></td>
															<td class="MTR" id="stn">수정일</td>
															<td id="modifyTd" colspan="2"></td>
														</tr>
														<tr>
															<td class="MTR">등록</td>
															<td id="inputTd" colspan="2"></td>
															<td class="MTR">대여</td>
															<td id="outputTd" colspan="2"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<br><br>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
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

			<script>
			$(document).on('click', '.even', function(){
	    		var no = $(this).children().eq(0).text();
				console.log(no);
				$.ajax({
					url:"selectOneMember.me?no=" + no,
					type:"post",
					success:function(data){
						$("#noTd").text(data.userNo);
						$("#statusTd").text(data.status);
						$("#idTd").text(data.userId);
						$("#nameTd").text(data.userName);
						$("#levelTd").text(data.level);
						$("#socialTd").text(data.social);
						$("#optionTd").text(data.option);
						$("#emailVTd").text(data.verif);
						$("#profitsTd").text(data.profits);
						$("#pointTd").text(data.totalPoint);
						$("#penaltyTd").text(data.penaltyPoint);
						$("#birthTd").text(data.birth);
						$("#genderTd").text(data.gender);
						$("#phoneTd").text(data.phone);
						$("#addressTd").text(data.address);
						$("#emailTd").text(data.email);
						$("#enrollTd").text(data.enrollDate);
						$("#modifyTd").text(data.modifyDate);
						$("#inputTd").text(data.input);
						$("#outputTd").text(data.output);
						$("#subPhoneTd").text(data.subPhone);
						
						if(data.status == "탈퇴"){
							$("#stn").text("탈퇴일");
						}else{
							$("#stn").text("수정일");
						}
						
						if(data.subPhone != null){
							$("#hide").show();
						}else{
							$("#hide").hide();
						}
					}
				});
	    	});
			
			$(document).on('mouseenter', '.even', function(){
				$(this).css({"background":"lightblue", "color":"black" ,"cursor":"pointer"})
			}).on('mouseout', '.even', function(){
				$(this).css({"background":"white", "color":"gray"})
			});
			
			
			function filteringP(currentPage){
	    		var userId = $("#userIdF").val();
	    		var userName = $("#userNameF").val();
	    		var userLv = $("#userLvF").val();
	    		var userStatus = $("#statusF").val();
	    		var startDate = $("#startD").val();
	    		var endDate = $("#endD").val();
	    		
	    		if(startDate>endDate || (endDate!="" && startDate=="")){
	    			alert("기간이 잘못 되었습니다");
	    			return;
	    		}
	    		
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/selectMemberFilter.me",
	    			data:{
	    				userId:userId,
	    				userName:userName,
	    				userLv:userLv,
	    				userStatus:userStatus,
	    				startDate:startDate,
	    				endDate:endDate,
	    				currentPage:currentPage
	    			},
	    			type:"get",
	    			success:function(data){
	    				$("#dataTable > tbody > tr").remove();
	    				$("#dataTable_paginate > ul > li").remove();
	    				
	    				var $dataTable = $("#dataTable");
						var $paging = $("#pagingUl");
						
						
						console.log(data.pi.currentPage);
						
						if(data.list.length > 0){
							var currentPage = data.pi.currentPage;
							var maxPage = data.pi.maxPage;
							var startPage = data.pi.startPage;
							var endPage = data.pi.endPage;
							
							var $firstLi = $("<li class='paginate_button page-item' id='dataTable_first'>");
							var $firstA = $("<a onclick='filteringP(1)' aria-controls='dataTable' data-dt-idx='0' tabindex='0' class='page-link'>").text("first");
							$firstLi.append($firstA);
							$paging.append($firstLi);
							
							if(currentPage <= 1){
								var $preLi = $("<li class='paginate_button page-item disabled' id='dataTable_previous'>");
								var $preA = $("<a onclick='filteringP(" + (currentPage - 1) + ")' aria-controls='dataTable' data-dt-idx='" + (currentPage - 1) + "' tabindex='0' class='page-link'>").text("Previous");
								$preLi.append($preA);
								$paging.append($preLi);
							}else{
								var $preLi = $("<li class='paginate_button page-item' id='dataTable_previous'>");
								var $preA = $("<a onclick='filteringP(" + (currentPage - 1) + ")' aria-controls='dataTable' data-dt-idx='" + (currentPage - 1) + "' tabindex='0' class='page-link'>").text("Previous");
								$preLi.append($preA);
								$paging.append($preLi);
							}
							
							for(var p = startPage; p <= endPage; p++){
								if(p == currentPage){
									var $numLi = $("<li class='paginate_button page-item disabled'>");
									var $numA = $("<a onclick='filteringP(" + p + ")' aria-controls='dataTable' data-dt-idx='" + p + "' tabindex='0' class='page-link'>").text(p);
									$numLi.append($numA);
									$paging.append($numLi);
								}else{
									var $numLi = $("<li class='paginate_button page-item'>");
									var $numA = $("<a onclick='filteringP(" + p + ")' aria-controls='dataTable' data-dt-idx='" + p + "' tabindex='0' class='page-link'>").text(p);
									$numLi.append($numA);
									$paging.append($numLi);
								}
							}
							
							if(currentPage >= maxPage){
								var $nextLi = $("<li class='paginate_button page-item disabled' id='dataTable_next'>");
								var $nextA = $("<a onclick='filteringP(" + (currentPage + 1) + ")' aria-controls='dataTable' data-dt-idx='" + (currentPage + 1) + "' tabindex='0' class='page-link'>").text("Next");
								$nextLi.append($nextA);
								$paging.append($nextLi);
							}else{
								var $nextLi = $("<li class='paginate_button page-item' id='dataTable_next'>");
								var $nextA = $("<a onclick='filteringP(" + (currentPage + 1) + ")' aria-controls='dataTable' data-dt-idx='" + (currentPage + 1) + "' tabindex='0' class='page-link'>").text("Next");
								$nextLi.append($nextA);
								$paging.append($nextLi);
							}
							
							var $endLi = $("<li class='paginate_button page-item' id='dataTable_end'>");
							var $endA = $("<a onclick='filteringP(" + maxPage + ")' aria-controls='dataTable' data-dt-idx='" + maxPage + "' tabindex='0' class='page-link'>").text("End");
							$endLi.append($endA);
							$paging.append($endLi);
							
							for(var key in data.list){
								var $tr = $("<tr role='row' class='even' align='center' data-toggle='modal' data-target='#detail'>");
								var $noTd = $("<td>").text(data.list[key].uno);
								var $idTd = $("<td>").text(data.list[key].userId);
								var $nameTd = $("<td>").text(data.list[key].userName);
								var $phTd = $("<td>").text(data.list[key].phone);
								var $addressTd = $("<td>").text(data.list[key].address);
								var $profitsTd = $("<td>").text(data.list[key].profits);
								var $tpTd = $("<td>").text(data.list[key].totalPoint);
								var $ppTd = $("<td>").text(data.list[key].penaltyPoint);
								var $edTd = $("<td>").text(data.list[key].enrollDate);
								var $stTd = $("<td>").text(data.list[key].status);
								
								$tr.append($noTd);
								$tr.append($idTd);
								$tr.append($nameTd);
								$tr.append($phTd);
								$tr.append($addressTd);
								$tr.append($profitsTd);
								$tr.append($tpTd);
								$tr.append($ppTd);
								$tr.append($edTd);
								$tr.append($stTd);
								
								$dataTable.append($tr);
								 
							}
						}
						
	    			}
	    		});
	    		
	    	};
			
			
			
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

