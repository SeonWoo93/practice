<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,
	com.kh.st.attachment.model.vo.*,
	com.kh.st.product.model.vo.*,
	com.kh.st.member.model.vo.*,
	com.kh.st.request.model.vo.ReqProduct, 
	com.kh.st.common.*"%>
<%
	Product reqProduct = (Product) request.getAttribute("reqProduct");
	Member m = (Member) request.getAttribute("m");
	ArrayList<Attachment> fileList = 
			(ArrayList<Attachment>) request.getAttribute("fileList");
	HashMap<String, Object> req =
			(HashMap<String, Object>) request.getAttribute("req");
	ArrayList<Attachment> confirmList =
			(ArrayList<Attachment>) request.getAttribute("confirmList");
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
.productPic {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

table {
	font-size: 20px;
}
textarea {
	border:0;
	resize:none;
}
.img {
	width: 100%;
	height: 100%;
}
.confirmImg {
	display:inline-block;
	margin:30px;
	width:150px;
	height:150px;
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
						<h1 class="h3 mb-0 text-gray-800">등록 물품 관리</h1>
					</div>
					<br> <br>
					<div class="row">
					<h3>물품상태 : <%= req.get("status") %></h3>
						<div class="col-lg-10">
							<div class="card shadow mb-4">
							<input type="hidden" name="nums" id="nums" value="<%= reqProduct.getPno() %>">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										요청날짜 : <%= req.get("reqpDate") %><br>
										등록자 : <%= m.getUserName() %><br>
										물품 : <%= req.get("pName") %><br>
										등록기간 : <%= req.get("pStart") %> ~ <%= req.get("pEnd") %>
									</h6>
								</div>
								<div class="card-body">
									<table class="col-lg-12">
										<tr>
										<% for(int i = 0; i < fileList.size(); i ++)  { %>
											<td>
												<div class="productPic">
													<img class="img" src="<%= request.getContextPath()%>/attach_upload/<%= fileList.get(i).getChangeName() %>">
												</div>
											</td>
										<% } %>
										</tr>
										<tr>
											<td colspan="3">구입시기 : <%= reqProduct.getPurchaseDate() %></td>
										</tr>
										<tr>
											<td colspan="3">모델명 : <%= reqProduct.getModel() %></td>
										</tr>
										<tr>
											<td colspan="3">구입가 : <%= reqProduct.getPurchasePrice() %>원</td>
										</tr>
										<tr>
											<td colspan="3">물품상태</td>
										</tr>
										<tr>
											<td colspan="3"><%= req.get("bContent") %></td>
										</tr>
										<tr>
											<td colspan="3">렌탈비 : <%= reqProduct.getPrice() %>원</td>
										</tr>
										<tr>
											<td colspan="3">보증금 : <%= reqProduct.getDeposite() %>원</td>
										</tr>
										<tr>
											<td colspan="3">전화번호 : <%= m.getPhone() %></td>
										</tr>
										<tr>
											<td colspan="3">주소 : <%= m.getAddress() %></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">검수 사진</h6>
							</div>
							<div class="card-body">
								<!-- <div id="fileConfirmArea" class="col-md-12 col-lg-12"> -->
								<% if(confirmList.size() >= 1)  { 
								 		for(int i = 0; i < confirmList.size(); i ++)  { %>
											<div class="confirmImg" id="confirm<%= i + 1 %>">
												<img id="confirmImg<%= i + 1 %>" 
													 src="<%= request.getContextPath()%>/attach_upload/<%= confirmList.get(i).getChangeName() %>"
													 style="width: 150px; height: 150px;">
											</div>
									<% } %>
								<% } else { %>
									<div class="confirmImg" id="confirm1">
										<img id="confirmImg1" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm2">
										<img id="confirmImg2" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm3">
										<img id="confirmImg3" width="150" height="150">
									</div>
									<div class="confirmImg" id="confirm4">
										<img id="confirmImg4" width="150" height="150">
									</div>
								<% } %>
								<!-- </div> -->
								<div id="fileArea">
									<input type="file" id="img1" name="img1" onchange="loadImg(this, 1);">
									<input type="file" id="img2" name="img2" onchange="loadImg(this, 2);">
									<input type="file" id="img3" name="img3" onchange="loadImg(this, 3);">
									<input type="file" id="img4" name="img4" onchange="loadImg(this, 4);">
								</div>
							</div>
							<div>
							<% if(confirmList.size() >= 1)  { %>
								<label>물품상태 : <%= req.get("condition") %></label>
							<% } else { %>
								<label>물품상태 : 검수 대기</label>
							<% } %>
							</div>
						</div>
					</div>
					<div class="row answer">
						<div class="col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">검수 내용</h6>
								</div>
								<div class="card-body">
								<% if(confirmList.size() >= 1)  { %>
								<textarea class="col-lg-12" rows="5" id="noResult" name="textResult"><%= req.get("chkContent") %></textarea>
								<% } else { %>
								<textarea class="col-lg-12" rows="5" id="noResult" name="textResult">검수 대기</textarea>
								<% } %>
								</div>
							</div>
						</div>
					</div>
					<div class="button">
						<a
							href="<%= request.getContextPath() %>/checkHistoryAdProduct.bo"
							class="btn btn-success btn-icon-split"><span
							class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
							class="text">돌아가기</span> </a>
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
			//검수사진
			$("#fileArea").hide();
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

