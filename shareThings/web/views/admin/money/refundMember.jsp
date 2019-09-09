<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.member.model.vo.*, com.kh.st.common.*"%>
<%
	ArrayList<Refund> list = (ArrayList<Refund>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
					<h1 class="h3 mb-2 text-gray-800">회원환불</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<form>
									<table class="col-lg-12" id="filterArea">
										<tr>
											<td width="5%">회원ID :</td>
											<td><input type="text" id="userIdF"
												style="width: 50%"></td>
											<td width="5%">구분 :</td>
											<td><select style="width: 60%" id="typeF">
													<option value="0">전체</option>
													<option value="RF1">예약취소</option>
													<option value="RF2">중간반납</option>
													<option value="RF3">보증급 반환</option>
											</select></td>
											<td width="5%">상태 :</td>
											<td><select style="width: 25%" id="statusF">
													<option value="0">전체</option>
													<option value="N">처리대기</option>
													<option value="Y">처리완료</option>
											</select></td>
										</tr>
										<tr>
											<td width="6%">신청일 :</td>
											<td colspan="3"><input type="date" id="startReqDF"
												style="width: 40%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" id="endReqDF"
												style="width: 40%"></td>
											<td width="6%">처리일 :</td>
											<td colspan="3"><input type="date" id="startRfDF"
												style="width: 40%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" id="endRfDF"
												style="width: 40%"></td>
										</tr>
									</table>
									<div>
										<button type="button" onclick="filteringP(1)">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset">초기화</button>
									</div>
									</form>
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<div align="left">
														<a href="#" class="btn btn-success btn-circle btn-sm" onclick="ok()">
										                    <i class="fas fa-check"></i></a>
													</div>
													<br>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;"
														style="height:100px;">
														<thead align="center">
															<tr role="row">
																<th width="1%"><input type="checkbox" id="checkAll"></th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 3%;">No.</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 5%;">회원ID</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 7%;">결제번호</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 20%;">환불사유</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 8%;">금액</th>
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 8%;">구분</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 10%;">신청일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 10%;">환불일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 7%;">상태</th>
															</tr>
														</thead>
														<tbody>
															<% for(Refund r : list){ 
															int rendom = (int)(Math.random() * 20) + 1; %>
																<tr align="center" class="even">
																	<td class="sorting_1"><input type="checkbox" class="check"></td>
																	<td><%= r.getRfNo() %></td>
																	<td><%= r.getUserId() %></td>
																	<td>StdpayCARDINIpayTest<%= r.getVerifyCode() %><%= rendom %></td>
																	<td><%= r.getRfReason() %></td>
																	<td><%= r.getPrice() %></td>
																	<td><%= r.getRfType() %></td>
							      									<td><%= r.getReqDate() %></td>
																	<td><%= r.getRfDate() %></td>
																	<td><%= r.getRfStatus() %></td>
																</tr>
															<% } %>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row">
												<div class="paging">
													<div class="col-lg-12">
														<div class="dataTables_paginate paging_simple_numbers"
															id="dataTable_paginate">
															<ul class="pagination" id="pagingUl">
																<li class="paginate_button page-item"
																	id="dataTable_first"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=1"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">First</a></li>
										
																<%
																		if (currentPage <= 1) {
																%>
																<li class="paginate_button page-item disabled"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item"
																	id="dataTable_previous"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage - 1%>"
																	aria-controls="dataTable" data-dt-idx="0" tabindex="0"
																	class="page-link">Previous</a></li>
																<%
																		}
																%>
																<%
																		for (int p = startPage; p <= endPage; p++) {
																		    if (p == currentPage) {
																%>
																<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=p%>"
																	aria-controls="dataTable" data-dt-idx="1" tabindex="0"
																	class="page-link"><%=p%></a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=p%>"
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
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%
																		} else {
																%>
																<li class="paginate_button page-item next" id="dataTable_next"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
																	class="page-link">Next</a></li>
																<%      }     %>
																<li class="paginate_button page-item next" id="dataTable_end"><a
																	href="<%=request.getContextPath()%>/selectRefundList.me?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
				$(function () {
		         $("#checkAll").click(function() {
		            var check = $(this).is(":checked");
		            if(check) {
		               $(".check").prop("checked", true);
		            } else {
		               $(".check").prop("checked", false);
		            }
		         });
		         
		         $(".sorting_1").click(function() {
		             $(this).parent().each(function() {
		                var check = $(this).find(".check").is(":checked");
		                if(!check) {
		                   $(this).find(".check").prop("checked", true);
		                } else {
		                   $(this).find(".check").prop("checked", false);
		                }
		             });
		          });
		         
		         $(".even").mouseenter(function(){
			    		$(this).css({"background":"lightblue", "color":"black" ,"cursor":"pointer"})
			    	}).mouseout(function(){
			    		$(this).css({"background":"white", "color":"gray"})
			    	});
		        });
				
				function filteringP(currentPage){
					var userId = $("#userIdF").val();
					var type = $("#typeF").val();
					var status = $("#statusF").val();
					var startReqD = $("#startReqDF").val();
					var endReqD = $("#endReqDF").val();
					var startRfD = $("#startRfDF").val();
					var endRfD = $("#endRfDF").val();
					
					if(startReqD > endReqD || (endReqD!="" && startReqD=="")){
						alert("신청일 기간이 잘못 선택되었습니다.");
						return;
					}
					
					if(startRfD > endRfD || (endRfD!="" && startRfD=="")){
						alert("처리일 기간이 잘못 선택되었습니다.");
						return;
					}
					
					$.ajax({
						url:"<%=request.getContextPath()%>/selectRefundFilter.me",
						data:{
							userId:userId,
							type:type,
							status:status,
							startReqD:startReqD,
							endReqD:endReqD,
							startRfD:startRfD,
							endRfD:endRfD,
							currentPage:currentPage
						},
						type:"get",
						success:function(data){
							$("#dataTable > tbody > tr").remove();
		    				$("#dataTable_paginate > ul > li").remove();
		    				
		    				var $dataTable = $("#dataTable");
							var $paging = $("#pagingUl");
							
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
									
									var $tr = $("<tr role='row' class='even' align='center'>");
									
									var $checkTd = $("<td class='sorting_1'>");
									var $checkIp = $("<input type='checkbox' class='check'>");
									$checkTd.append($checkIp);
									
									var $noTd = $("<td>").text(data.list[key].rfNo);
									var $idTd = $("<td>").text(data.list[key].userId);
									var $vcTd = $("<td>").text(data.list[key].verifyCode);
									var $rsTd = $("<td>").text(data.list[key].rfReason);
									var $prTd = $("<td>").text(data.list[key].price);
									var $tpTd = $("<td>").text(data.list[key].type);
									var $qdTd = $("<td>").text(data.list[key].reqDate);
									var $rdTd = $("<td>").text(data.list[key].rfDate);
									var $stTd = $("<td>").text(data.list[key].status);
									
									$tr.append($checkTd);
									$tr.append($noTd);
									$tr.append($idTd);
									$tr.append($vcTd);
									$tr.append($rsTd);
									$tr.append($prTd);
									$tr.append($tpTd);
									$tr.append($qdTd);
									$tr.append($rdTd);
									$tr.append($stTd);
									
									$dataTable.append($tr);
								}
							}
						}
					});
					
					
					
					
					
					
				};
				
				
				function ok() {
			         var result = confirm("처리완료 하시겠습니까?");
			         if(result) {
			            var no = new Array();
			            $(".even").each(function() {
			               if($(this).find(".check").is(":checked")) {   
			                  console.log($(this).find("td").eq(1).text());
			                  no.push($(this).find("td").eq(1).text());
			               }
			                  
			            });
			            console.log(no);
			            location = "<%=request.getContextPath()%>/refundOk.me?no="+ no;
						} else {
							location = location;
						}
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

