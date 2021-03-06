<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,
	com.kh.st.adProduct.model.vo.*, 
	com.kh.st.common.*"%>
<%
	ArrayList<EndProduct> list =
		(ArrayList<EndProduct>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = (int) request.getAttribute("listCount");
	
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

#dataTable_wrapper {
	overflow: hidden;
}
.paging {
	margin-left: auto;
	margin-right: auto;
}
.rejectImg {
	display:inline-block;
	margin:30px;
}
#fileRejectArea:hover {
	cursor:pointer;
}
#hidden {
	display:none;
}
.confirmImg {
	display:inline-block;
	margin:30px;
}
#fileConfirmArea:hover {
	cursor:pointer;
}
#textResult, #textResult1 {
	resize:none;
}
#dlocation {
	resize:none;
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
					<h1 class="h3 mb-2 text-gray-800">등록 반환 관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" class="col-lg-12">
						<div class="col-sm-12 col-lg-12">
						<form action="#">
							<div class="card shadow mb-4"  id="filter" align="center">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<td style="width: 90px">상세조건 :</td>
											<td><select style="heigth: 30px; width: 20%;"
											id="details" name="details" onchange = "detailsChg();">
													<option value="0">전체</option>
													<option value="pno">물품번호</option>
													<option value="name">등록자명</option>
													<option value="reqName">물품명</option>
											</select>&nbsp;&nbsp;&nbsp;
											<input type="text" placeholder="상세정보입력" disabled id="filterContent" name="filterContent" style="width: 20%">
											</td>
										</tr>
										<tr>
											<td style="width: 70px">등록기간 :</td>
											<td colspan="3"><input type="date" id="startD" name="startD">&nbsp;&nbsp;&nbsp;
												~ &nbsp;&nbsp;&nbsp; <input type="date" id="endD"name="endD">
											</td>
										</tr>
									</table>
									<div align="center">
										<button type="button" id="inquiry" onclick="filteringP(1)">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset" id="initial">초기화</button>
									</div>
								</div>
							</div>
							</form>
							<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary" id="listSize"><%= listCount %>건</h6>
						</div>
							<div class="card-body">
							<a href="#" class="btn btn-info btn-icon-split" id="ok" data-toggle="modal" data-target="#okModal">
								<span class="icon text-white-50"> <i
									class="fas fa-info-circle"></i>
							</span> <span class="text">반환 처리</span>
							</a>
								<div class="table-responsive">
									<div id="dataTable_wrapper"
										class="dataTables_wrapper dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table class="table table-bordered dataTable" id="dataTable"
													width="100%" cellspacing="0" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;">
													<br>
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 10px;"
																aria-label="Name: activate to sort column ascending"
																rowspan="1" colspan="1"><input type="checkBox" id="checkAll"></th>
															<th class="sorting_asc" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Name: activate to sort column descending"
																aria-sort="ascending" style="width: 30px;">물품 번호</th>
															<th class="sorting_asc" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Name: activate to sort column descending"
																aria-sort="ascending" style="width: 30px;">모델명</th>
															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 30px;">물품명</th>
															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 30px;">등록자</th>
															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 30px;">만료날짜</th>
															<th class="sorting" tabindex="0"
																aria-controls="dataTable" rowspan="1" colspan="1"
																aria-label="Start date: activate to sort column ascending"
																style="width: 30px;">물품상태</th>
														</tr>
													</thead>

													<tbody>
													<% for(EndProduct ep : list) { %>
													<!-- 물품번호, 모델명, 물품명, 등록자, 만료일, 물품 상태 -->
															<tr role="row" class="even" align="center">
																<td class="sorting_1"><input type="checkbox" class="check"></td>
																<td><%= ep.getPno() %></td>
																<td><%= ep.getModel() %></td>
																<td><%= ep.getpName() %></td>
																<td><%= ep.getUserName() %></td>
																<td><%= ep.getdDay() %> 일 전</td>
																<td><%= ep.getStatus() %></td>
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
	<div class="row">
		<div class="paging">
			<div class="col-sm-12 col-md-3">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<ul class="pagination" id="pagingUl">
						<li class="paginate_button page-item"
							id="dataTable_first"><a
							href="<%=request.getContextPath()%>/reqOkProduct.bo?currentPage=1"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">First</a></li>

						<%
								if (currentPage <= 1) {
						%>
						<li class="paginate_button page-item disabled"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								}
						%>
						<%
								for (int p = startPage; p <= endPage; p++) {
								    if (p == currentPage) {
						%>
						<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=p%>"
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
							href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%      }     %>
						<li class="paginate_button page-item next" id="dataTable_end"><a
							href="<%=request.getContextPath()%>/endProductList.bo?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
				</div>
			</div>
					
					<form action="<%= request.getContextPath() %>/endProductDelivery.bo" method="post">
					<div class="modal fade" id="okModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">만료 반환 처리</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="row">
									<div class="col-md-12 col-lg-12">
										<div class="modal-body">
											<p>물품명과 만료상태를 확인하고 처리하세요</p>
											<div class="panel-body">
												<table width="100%"
													class="table table-striped table-bordered table-hover"
													id="dataTables-example">
													<thead>
														<tr>
															<th style="text-align: center;" class="text-black-50 small">물품번호</th>
															<th style="text-align: center;" class="text-black-50 small">만료일</th>
															<th style="text-align: center;" class="text-black-50 small">등록자</th>
														</tr>
													</thead>
													<tbody>
												
													</tbody>
												</table>
											</div>
											<hr>
											<h5>*배송지</h5>
												<textarea id="dlocation" class="col-lg-12" name="dlocation" readonly></textarea>
											<hr>
											<h5>*택배사</h5>
												<select id="delivery" name="delivery">
													<option value="대한통운">CJ대한통운</option>
													<option value="로젠택배">로젠택배</option>
													<option value="우체국택배">우체국택배</option>
													<option value="CVSnet">CVSnet 편의점택배</option>
													<optoin value="한진택배">한진택배</optoin>
												</select>
											<h5>*송장번호</h5>
												<textarea id="dNo" name="dNo" class="col-lg-12" placeholder="EX)송장번호 입력"></textarea>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">반환 처리</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form>
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
			//전체 선택, 해제
			$("#checkAll").click(function() {
				var check = $(this).is(":checked");
				var result = $(".even").find("td").eq(6).text();
				if(check) {
					$(".check").prop("checked", true);
				} else {
					$(".check").prop("checked", false);
				}
			});
			
			//td클릭해도 체크되게
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
		});
		
		//반환처리 ajax
		$("#ok").click(function() {
			var num = new Array();
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					console.log($(this).find("td").eq(1).text());
					num.push($(this).find("td").eq(1).text());
					var confirm = $(this).find("td").eq(5).text();
					console.log(confirm);
				}
			});
			if(num.length > 1) {
				alert("한개만 선택하세요");
				return false;
			}
			if(status.length > 1) {
				alert("한개만 선택하세요");
				return false;
			}
			console.log(num);
			$.ajax({
				url:"endProductSelect.bo?num=" + num,
				type:"get",
				success:function(data) {
					console.log(data);

					var $dataTables = $("#dataTables-example tbody");
					var $location = $("#location");

					//기존 테이블 행 제거
					$("#dataTables-example > tbody > tr").remove();

					var $tr = $("<tr class='odd gradeX'>");
					var $upNoTd = $("<td align='center'>").text(data.pno);
					var $hidden = $("<textarea id='hidden' name='pno'>").text(data.pno);
					var $bWriterTd = $("<td align='center'>").text(data.dDay + " 일 전");
					var $productNameTd = $("<td align='center'>").text(data.userName);
					var $dLocation = $("#dlocation").text(data.dLocation);
						
					$tr.append($upNoTd);
					$tr.append($bWriterTd);
					$tr.append($productNameTd);
						
					$dataTables.append($tr);
					$dataTables.append($hidden);
					$location.append($dLocation);
					
					console.log($hidden);
				},
				error:function(data) {
					console.log("실패");
				}
			});
		});
		
		//조건 검색
		function filteringP(currentPage) {
			var details = $("#details").val();
			var filterContent = $("#filterContent").val();
			var startD = $("#startD").val();
			var endD = $("#endD").val();
			
			//조회기간 잘못 설정
			if(startD > endD || (endD !="" && startD=="")) {
				alert("기간이 잘못되었습니다");
				return false;
			}
			
			//상세보기 전체 아닐 겨우
			if(details != "0"){
				if(filterContent == ""){
					alert("상세정보를 입력하세요");
					return false;
				}
			}
			
			$.ajax({
				url:"<%= request.getContextPath()%>/endProductFilter.bo",
				data:{
					details:details,
					filterContent:filterContent,
					startD:startD,
					endD:endD,
					currentPage:currentPage
				},
				type:"get",
				success:function(data) {
					console.log(data);
					/* 기존 테이블 행 제거 */
					$("#dataTable > tbody > tr").remove();
					$("#dataTable_paginate > ul > li").remove();
					
					var $dataTable = $("#dataTable");
					/* 조회된 값이 없을때 출력할 공간 */
					var $resultNull = $("#result-null");
					/* 조회된 건수 출력할 공간 */
					var $listSize = $("#listSize");
					/* 페이징 */
					var $paging = $("#pagingUl");
					
					//값 넣을 공간 비우기
					$resultNull.html('');
					$listSize.prop("innerHTML", '');
					
					console.log(data.pi.currentPage);
					console.log(data.pi);
					console.log(data.list);
					
					if(data.list.length > 0) {
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
							
						for(var key in data.list) {
							//data값 td에 입력
							var $check = $("<td class='sorting_1'><input type='checkbox' class='check'>");
							var $tr = $("<tr class='even' role='row' align='center' id='check'>");
							
							var $pnoTd = $("<td>").text(data.list[key].pno);
							var $modelTd = $("<td>").text(data.list[key].model);
							var $pNameTd = $("<td>").text(data.list[key].pName);
							var $userNameTd = $("<td>").text(data.list[key].userName);
							var $dDayTd = $("<td>").text(data.list[key].dDay + " 일 전 ");
							var $statusTd = $("<td>").text(data.list[key].status);
							
							//tr에 td추가
							$tr.append($check);
							$tr.append($pnoTd);
							$tr.append($modelTd);
							$tr.append($pNameTd);
							$tr.append($userNameTd);
							$tr.append($dDayTd);
							$tr.append($statusTd);
							
							//table에 tr추가
							$dataTable.append($tr);
						}
					} else {
						//조회결과 없을때
						$resultNull.append("<br><br><br><br><br><br>");
						$resultNull.append("<h3 align='center'> 조회 결과가 없습니다.</h3>");
						$resultNull.append("<br><br><br><br><br><br>");
					}
					$listSize.prop("innerHTML", data.list.length + "건");
				},
				error:function(data) {
					console.log("실패");
				}
			});
		};
		//상세조회 전체 아닐때 disabled 변경
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

