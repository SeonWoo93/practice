<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1 class="h3 mb-2 text-gray-800">검수기준</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" class="col-lg-12">
						<div class="col-sm-12 col-lg-12">
							<div class="card shadow mb-4" id="filter" align="center">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
									<table class="col-lg-12" id="filterArea">
										<tr style="height: 20px">
											<td style="width: 80px">대분류 :</td>
											<td style="width:25%;">
												<select id="big" class="cc" style="heigth: 30px; width: 60%;">
													<option>대분류</option>
													<option>전자기기</option>
													<option>취미/레저</option>
													<option>유아동</option>
													<option>반려동물</option>
												</select>
											</td>
											<td style="width: 80px">중분류 :</td>
											<td>
												<select id="mid"class="cc" style="heigth: 30px; width: 40%;">
													<option>중분류</option>
												</select>
											</td>
											<td style="width: 80px">소분류 :</td>
											<td>
												<select id="small"class="cc" style="heigth: 30px; width: 50%;">
													<option>소분류</option>
												</select>
											</td>
										</tr>
									</table>
									<div>
										<button id="result">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button>초기화</button>
									</div>
								</div>
							</div>
							<div class="card shadow mb-4 col-lg-8" style="margin-left:auto; margin-right:auto;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary" id="product">검수 기준</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending" style="width: 10px;">NO.</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 30px;">기준</th>
															</tr>
														</thead>
														<tbody>
															
														</tbody>
													</table>
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
				 
				 $("#result").click(function() {
					var result = $("#small").val();
					$.ajax({
						url:"<%= request.getContextPath() %>/checkStandard.bo",
						data:{result:result},
						type:"get",
						success:function(data) {
							console.log(data);
							var $dataTable = $("#dataTable");
							var $product = $("#product");

							$("#dataTable > tbody > tr").remove();
							
							for(var key in data) {
								$tr = $("<tr>");
								$numTd = $("<td>").text(data[key].num);
								$standardTd = $("<td>").text(data[key].standard);
								
								$tr.append($numTd);
								$tr.append($standardTd);
								
								$dataTable.append($tr);
							}
							$product.text(result + " 검수 기준");
							
						},
						error:function(data) {
							console.log("실패");
						}
					});
				 });
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

