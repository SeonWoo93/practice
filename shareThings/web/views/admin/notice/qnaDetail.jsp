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
.card {
	margin-right: center;
	margin-left: center;
	width: 100%;
}
/* .button {
	margin-top:15%;
} */
.answer {
	margin-top:5%;
}
#dataTable_wrapper {
		overflow:hidden;
}
.card-body {
	required:true;
}
textarea {
	resize:none;
	overflow:hidden;
	border:0;
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
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">1:1 문의</h1>
					</div>
					<br>
					<br>
					<div class="row">
						<div class="col-lg-10">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">user01/배송/처리대기</h6>
								</div>
								<div class="card-body">
									어제 물품 도착한다고 했는데 왜 안와요?<br>
									못쓴 기간만큼 환불해주세요<br>
									어제 물품 도착한다고 했는데 왜 안와요?<br>
									못쓴 기간만큼 환불해주세요<br>
									어제 물품 도착한다고 했는데 왜 안와요?<br>
									못쓴 기간만큼 환불해주세요<br>
									어제 물품 도착한다고 했는데 왜 안와요?<br>
									못쓴 기간만큼 환불해주세요<br>
								</div>
							</div>
						</div>
					</div>
					<div class="row answer">
						<div class="col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">처리내용</h6>
								</div>
								<div class="card-body">
								<textarea class="col-lg-12" rows="5">쓰지마세요</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="button">
						<a href="<%= request.getContextPath() %>/views/admin/notice/noticeList.jsp"
							class="btn btn-success btn-icon-split"><span
							class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
							class="text">돌아가기</span>
						</a>
						<%-- <% if(loginUser != null && 
							loginUser.getUserId().equals("admin"))  { %> --%>
						<a href="#" class="btn btn-info btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-info-circle"></i>
							</span> <span class="text">처리하기</span></a>
						<%-- <% } %> --%>
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

