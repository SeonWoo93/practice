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
<style>
html {
	heigth: 100%
}
#content-wrapper {
	min-height: 90%;
}

.card-body {
	height: 200px;
}
.card {
	width: 80%; text-align : center;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.row {
	margin-top:50px;
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
		<%@ include file="common/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!--콘텐츠 영역 시작-->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- 메인 콘텐츠 영역 시작 -->
			<div id="content">
				<!-- 헤더 인클루드 -->
				<%@ include file="common/header.jsp"%>
				<!-- 컨텐츠바디 영역 실제 작성 영역 -->
				<div class="container-fluid">
					<div>
						<h1 align="center" style="color:black">오늘 하루도 열심히 코딩하는 사람이 되도록 노력합시다!!</h1>
					</div>
					<hr>
					<div class="row">
						<div class="col-lg-6 mb-4">
							<div class="card bg-primary text-white shadow">
								<div class="card-body" id="adProduct">
									<b>등록관리</b>
									<hr color="white">
						
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-success text-white shadow">
								<div class="card-body" id="rental">
									<b>대여관리</b>
									<hr color="white">
									
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-info text-white shadow">
								<div class="card-body" id="cs">
									<b>게시글 현황</b>
									<hr color="white">
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
		                     <div class="card bg-warning text-white shadow">
		                        <div class="card-body" id="money">
		                           <b>정산 현황</b>
		                           <hr color="white">
		                        </div>
		                     </div>
		                  </div>
					</div>
				</div>
				<!-- 메인 콘텐트 영역 끝 -->
				<!-- Footer 인클루드 -->
			</div>
			<%@ include file="common/footer.jsp"%>
			<!-- 메인 콘텐츠 영역 끝 -->
		</div>
		<!-- 콘텐츠 영역 끝 -->
	</div>

	<!-- 맨위로-->
	<%@ include file="common/toTop.jsp"%>

	<!-- 로그아웃 모달-->
	<%@ include file="common/logoutModal.jsp"%>


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
	<%-- <script
		src="<%=request.getContextPath()%>/resource/vendor/chart.js/Chart.min.js"></script> --%>

	<!-- Page level custom scripts -->
	<%-- <script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/js/demo/chart-pie-demo.js"></script> --%>
		
		<script>
		$(function(){
			//대여관리 목록
			$.ajax({
				url:"<%=request.getContextPath()%>/selectReqSize.rt",
				type:"get",
				success:function(data){
					console.log("1번 ");
					var $approval_div = $("<h4><div>").text("대여승인 " +data.approvalSize + " 건");
					var $cancel_div = $("<h4><div>").text("대여반품요청 " +data.returnSize + " 건");
					var $return_div = $("<h4><div>").text("대여취소요청 " +data.cancelSize + " 건");
					
					
					
					$("#rental").append($approval_div);
					$("#rental").append($cancel_div);
					$("#rental").append($return_div);
				},
				error:function(){
					console.log("error");
				}
				
			});
			$("#rental").click(function(){
				location.href="<%=request.getContextPath()%>/selectRantalList.pd";
			}).mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			});
			
			//1:1문의 건수
			$.ajax({
				url:"<%=request.getContextPath()%>/selectReqSize.cs",
				type:"get",
				success:function(data){
					console.log("2번 ");
					var $cs_div = $("<h4><div").text("1:1문의 처리대기 " +data + " 건");
					
					
					$("#cs").append($cs_div);
				},
				error:function(){
					console.log("error");
				}
				
			});
			
			$("#cs").click(function(){
				location.href="<%=request.getContextPath()%>/selectAdminList.cs";
			}).mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			});

			$.ajax({
	            url:"<%=request.getContextPath()%>/selectMoneySize.me",
	            type:"get",
	            success:function(data){
	               var $payback_div = $("<h4><div id='payback'>").text("수익금 환급 대기 " +data.pb + " 건");
	               var $refund_div = $("<h4><div id='refund'>").text("환불 대기 " +data.rf + " 건");
	               
	               $("#money").append($payback_div);
	               $("#money").append($refund_div);
	            },
	            error:function(){
	               console.log("error");
	            }
	         });
			
			//등록 업무 현황
			$.ajax({
				url:"<%= request.getContextPath() %>/selectReqProductList.bo",
				type:"get",
				success:function(data) {
					var $reqList = $("<h4><div>").text("등록요청 " + data.reqList + " 건");
					var $confirmList = $("<h4><div>").text("등록승인현황 " + data.confirmList + " 건");
					var $adProduct = $("<h4><div>").text("등록물품 " + data.adProduct + " 건");
					
					$("#adProduct").append($reqList);
					$("#adProduct").append($confirmList);
					$("#adProduct").append($adProduct);
				},
				error:function() {
					console.log("실패");
				}
			});
			
			//메인에서 클릭 이동
			$("#adProduct").click(function() {
				location = "<%= request.getContextPath() %>/reqProduct.bo";
			}).mouseenter(function(){
				$(this).css({"cursor":"pointer"});
			});
		});
		</script>
</body>

</html>

