<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.adProduct.model.vo.AdProduct, 
	com.kh.st.common.*"%>
<%
	ArrayList<AdProduct> list =
		(ArrayList<AdProduct>) request.getAttribute("list");
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
					<h1 class="h3 mb-2 text-gray-800">물품조회</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" class="col-lg-12">
						<div class="col-sm-12 col-lg-12">
						<form action="#">
							<div class="card shadow mb-4" id="filter" align="center">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<td style="width: 90px">
												대분류 :
											</td>
											<td>
												<select id="big" class="cc" style="heigth: 30px; width: 40%;">
													<option>대분류</option>
													<option>전자기기</option>
													<option>취미/레저</option>
													<option>유아동</option>
													<option>반려동물</option>
												</select>
												&nbsp;&nbsp;&nbsp;
											</td>
											<td style="width: 90px">
												중분류 :
											</td>
											<td>
												<select id="mid"class="cc" style="heigth: 30px; width: 40%;">
													<option>중분류</option>
											</select>
											&nbsp;&nbsp;&nbsp;
											</td>
											<td style="width: 90px">
												소분류 :
											</td>
											<td>
												<select id="small"class="cc" style="heigth: 30px; width: 40%;">
													<option>소분류</option>
											</select>
											&nbsp;&nbsp;&nbsp;	
											</td>
										</tr>
										<tr>
											<td style="width: 70px">등록기간 :</td>
											<td colspan="3"><input type="date" id="startD" name="startD">&nbsp;&nbsp;&nbsp;
												~ &nbsp;&nbsp;&nbsp; <input type="date" id="endD"name="endD">
											</td>
										</tr>
									</table>
									<div>
										<button type="button" id="inquiry" onclick="filteringP(1)">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset">초기화</button>
									</div>
								</div>
							</div>
						</form>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary" id="listSize"><%= listCount %>건</h6>
					</div>
                  <div class="card-body">
                     <div class="table-responsive">
                        <div id="dataTable_wrapper"
                           class="dataTables_wrapper dt-bootstrap4">
                           <div class="row">
                              <div class="col-sm-12">
                                 <table class="table table-bordered dataTable" id="dataTable"
                                    width="100%" cellspacing="0" role="grid"
                                    aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                       <tr role="row" align="center">
                                          <th class="sorting" tabindex="0"
                                             aria-controls="dataTable" rowspan="1" colspan="1"
                                             aria-label="Name: activate to sort column descending"
                                             aria-sort="ascending" style="width: 30px;">물품번호</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="Position: activate to sort column ascending"
                                             style="width: 30px;">등록자</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="Office: activate to sort column ascending"
                                             style="width: 30px;">모델명</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="Office: activate to sort column ascending"
                                             style="width: 30px;">물품명</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="Age: activate to sort column ascending"
                                             style="width: 30px;">등록기간</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="Start date: activate to sort column ascending"
                                             style="width: 30px;">상태</th>
                                       </tr>
                                    </thead>

                                    <tbody>
                                    <% for(AdProduct ap : list) { %>
                                       <tr role="row" class="even" align="center">
                                          <td class="sorting_1"><%= ap.getPno() %></td>
                                          <td><%= ap.getpWriter() %></td>
                                          <td><%= ap.getModel() %></td>
                                          <td><%= ap.getCtgName() %></td>
                                          <td><%= ap.getPstartDate() %> ~ <%= ap.getPendDate() %></td>
                                          <td><%= ap.getStatus() %></td>
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
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=1"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">First</a></li>

						<%
								if (currentPage <= 1) {
						%>
						<li class="paginate_button page-item disabled"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item"
							id="dataTable_previous"><a
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=currentPage - 1%>"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<%
								}
						%>
						<%
								for (int p = startPage; p <= endPage; p++) {
								    if (p == currentPage) {
						%>
						<li class="paginate_button page-item disabled"><a href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=p%>"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link"><%=p%></a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item active"><a href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=p%>"
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
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%
								} else {
						%>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=currentPage + 1%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
							class="page-link">Next</a></li>
						<%      }     %>
						<li class="paginate_button page-item next" id="dataTable_end"><a
							href="<%=request.getContextPath()%>/adProductList.bo?currentPage=<%=maxPage%>" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
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
						<div class="modal fade" id="cancelModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">요청 거절 처리</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="modal-body">
												<p>물품명과 승인상태를 확인하고 처리하세요</p>
												<div class="panel-body">
													<table width="100%"
														class="table table-striped table-bordered table-hover"
														id="dataTables-example">
														<thead>
															<tr>
																<th style="width: 40px; text-align: center;"><input
																	type="checkBox"></th>
																<th style="text-align: center;"
																	class="text-black-50 small">등록요청번호</th>
																<th style="text-align: center;"
																	class="text-black-50 small">물품명</th>
																<th style="text-align: center;"
																	class="text-black-50 small">등록자</th>
																<th style="text-align: center; width: 130px"
																	class="text-black-50 small">거절사유</th>
															</tr>
														</thead>
														<tbody>
															<!-- <tr class="odd gradeX">
																<td><input type="checkBox">
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr> -->
														</tbody>
													</table>
												</div>
												<h5>*거절상세사유</h5>
												<textarea rows="10" cols="55" placeholder="EX)거짓 정보 등록"></textarea>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"
													data-dismiss="modal">거절처리</button>
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
				$(function() {
					$(".even").click(function() {
						var num = $(this).find("td").eq(0).text();
						location = "<%= request.getContextPath()%>/adProductDetail.bo?num=" + num;
						console.log(num);
					});	
				});
				
				//카테고리 분류
				$("#big").change(function() {
					//대분류
					var big = $(this).children("option:selected").val().replace("/", "");
					console.log(big);
					//중분류
					var $mid = $("#mid");
					$.ajax({
						url:"<%= request.getContextPath() %>/categoryList.do",
						data:{big:big},
						type:"get",
						success:function(data) {
							console.log(data);
							var options = "<option selected> 중분류</option>";
							for(var i = 0; i < data.length; i++){
				                 if(i == 0){
				                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
				                 } else{
				                    options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
				                 }
				            }
							$mid.html(options); 
						},
						error:function(data){
				              console.log("서버 전송 실패!");
				        }
					});
				});
				
				$("#mid").change(function(){
			        var mid = $(this).children("option:selected").val(); // 중분류
			        var $small = $("#small");  // 소분류
			        $.ajax({
			           url:"<%= request.getContextPath() %>/categoryList2.do",
			           data:{mid:mid},
			           type:"get",
			           success:function(data){
			              console.log(data);
			               var options = "<option selected>소분류</option>"; 
			               for(var i = 0; i < data.length; i++){
			                 	if(i == 0){
			                    	options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
			                 	} else{
			                 	   options += "<option value=\"" + data[i] + "\">" + data[i] + "</option>";
			                 	}
			             	 }    
			              	 $small.html(options);     
			           },
			           error:function(data){
			              console.log("서버 전송 실패!");
			           }
			        });
			     });
				
				 $("#small").change(function(){
				       var small = $(this).children("option:selected").val(); // 소분류
				       var $ctgId = $("#ctgId");  // 소분류번호
				       $.ajax({
				          url:"<%= request.getContextPath() %>/getCategoryId.do",
				          data:{small:small},
				          type:"get",
				          success:function(data){
				             console.log(data);   
				             $ctgId.attr("value", data); 
				             
				             console.log(data);
				          },
				          error:function(data){
				             console.log("서버 전송 실패!");
				          }
				       });
				    });
				 
				 //조건 검색
				 function filteringP(currentPage) {
					 var category = $("#small").val();
					 var startD = $("#startD").val();
					 var endD = $("#endD").val();
					 
					//조회기간 잘못 설정
						if(startD > endD || (endD !="" && startD=="")) {
							alert("기간이 잘못되었습니다");
							return false;
						}
					
					console.log(category);
					console.log(startD);
					console.log(endD);
					
					$.ajax({
						url:"<%= request.getContextPath() %>/selectAdProductListFilter.bo",
						data:{
							category:category,
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
								var $tr = $("<tr class='even' role='row' align='center'>");
								
								var $pnoTd = $("<td>").text(data.list[key].pno);
								var $userNameTd = $("<td>").text(data.list[key].userName);
								var $modelTd = $("<td>").text(data.list[key].model);
								var $pNameTd = $("<td>").text(data.list[key].pName);
								var $periodTd = $("<td>").text(data.list[key].pstartD + " ~ " + data.list[key].pendD);
								var $statusTd = $("<td>").text(data.list[key].status);
								
								$tr.append($pnoTd);
								$tr.append($userNameTd);
								$tr.append($modelTd);
								$tr.append($pNameTd);
								$tr.append($periodTd);
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
							$listSize.prop("innerHTML", data.list.length+"건");
							
							$(".even").click(function() {
								var num = $(this).find("td").eq(0).text();
								location = "<%= request.getContextPath()%>/adProductDetail.bo?num=" + num;
								console.log(num);
							});
						},
						error:function(data) {
							console.log("실패");
						}
					});
				 }
			</script>
			<script
				src="<%=request.getContextPath() %>/resource/vendor/jquery/jquery.min.js"></script>
			<script
				src="<%=request.getContextPath() %>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script
				src="<%=request.getContextPath() %>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script
				src="<%=request.getContextPath() %>/resource/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script
				src="<%=request.getContextPath() %>/resource/vendor/chart.js/Chart.min.js"></script>

			<!-- Page level custom scripts -->
			<script
				src="<%=request.getContextPath() %>/resource/js/demo/chart-area-demo.js"></script>
			<script
				src="<%=request.getContextPath() %>/resource/js/demo/chart-pie-demo.js"></script>
</body>

</html>

