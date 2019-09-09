<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* , com.kh.st.notice.model.vo.*"%>
<%
	ArrayList<Notice> list = 
		(ArrayList<Notice>) request.getAttribute("list");
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
		cursor:pointer;
	}
	#dataTable_wrapper {
		overflow:hidden;
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
					<h1 class="h3 mb-2 text-gray-800">공지사항</h1>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"><%= list.size() %>건</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4" >
									<div class="row" >
										<div class="col-sm-12" > 
											<table class="table table-bordered dataTable" id="dataTable" 
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;"
												>
												<thead>
													<tr role="row" align="center">
														<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 3px;"
																aria-label="Name: activate to sort column ascending"
														rowspan="1" colspan="1"><input type="checkBox" id="checkAll"></th>
														<th class="sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-label="Name: activate to sort column descending"
															aria-sort="ascending" style="width: 50px;"> 글번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 10px;">등록자</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 10px;">제목</th>
													</tr>
												</thead>

												<tbody>
														<% for(Notice reqNotice : list){ %>
														<tr class="even" role="row" align="center">
															<td class="checkBox"><input type="checkBox" class="check"></td>
															<td><%= reqNotice.getNno() %></td>
															<td><%= reqNotice.getnWriter()%></td>
															<td><%= reqNotice.getnTitle()%></td>
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
									 <a href="<%= request.getContextPath() %>/views/admin/notice/noticeInsert.jsp"
										class="btn btn-success btn-icon-split"><span
										class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
										class="text">공지 등록</span> </a>

									<button onclick= "deleteNotice()" class="btn btn-danger btn-icon-split" id="deleteBtn">
										<span class="icon text-white-50"> <i class="fas fas fa-trash"></i>
										</span> <span class="text">공지삭제</span>
									</button>
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
		$(".checkBox").click(function() {
			$(this).parent().each(function() {
				var check = $(this).find(".check").is(":checked");
				if(!check) {
					$(this).find(".check").prop("checked", true);
				} else {
					$(this).find(".check").prop("checked", false);
				}
			});
		});
		//체크박스 클릭해도 동작 X(해당 번호 가져옴)
		$(".checkBox").siblings().click(function() {
			$(this).parent().each(function() {
				var nno = $(this).children().eq(1).text();
				location= "<%= request.getContextPath()%>/selectAdminOne.no?nno=" + nno ;
			});
		});
		
		//공지사항 삭제
		$("#deleteBtn").click(function(){
			
			var status = new Array();
			var nnos = new Array();
			$(".even").each(function() {
				if($(this).find(".check").is(":checked")) {	
					status.push($(this).find("td").eq(1).text());
					
					nnos = $(this).find("td").eq(1).text();
				}
				
				
			});
			if(status.length == 0 ){
				alert("삭제하실 공지사항을 선택해주세요");
				return false;
			}
			if(confirm(status.length + "건을 삭제 하시겠습니까?")){
			}else {
				return false;
			}
			
			location = "<%= request.getContextPath() %>/delete.no?nnos=" + nnos;

			
		});
	</script>
	<script>
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

