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
	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	HashMap<String, Object> req =
			(HashMap<String, Object>) request.getAttribute("req");
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
						<h1 class="h3 mb-0 text-gray-800">등록 요청 관리</h1>
					</div>
					<br> <br>
					<form action="<%= request.getContextPath()%>/reqNo.bo" method="post" id="go">
					<div class="row">
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
									<table class="col-lg-10">
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
					<div class="row answer">
						<div class="col-lg-4">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">거절 사유</h6>
								</div>
								<div class="card-body">
								<% if(req.get("rejectReason") == null) { %>
								<textarea class="col-lg-12" rows="5" id="noResult" name="textResult"></textarea>
								<% } else { %>
								<textarea class="col-lg-12" rows="5" id="noResult" name="textResult"><%= req.get("rejectReason") %></textarea>
								<% } %>
								</div>
							</div>
						</div>
					</div>
					</form>
					<div class="button">
						<a
							href="<%= request.getContextPath() %>/reqProduct.bo"
							class="btn btn-success btn-icon-split"><span
							class="icon text-white-50"> <i class="fas fa-check"></i></span> <span
							class="text">돌아가기</span> </a>
						<a href="#" class="btn btn-info btn-icon-split" id="ok"
							data-toggle="modal" data-target="#okModal">
								<span class="icon text-white-50"> <i
									class="fas fa-info-circle"></i>
								</span>
									<span class="text">요청 승인</span>
						</a>
						<a href="#" id="no"
							class="btn btn-danger btn-icon-split" data-toggle="modal" 
							data-target="#cancelModal"> <span
							class="icon text-white-50"> <i class="fas fa-trash"></i>
						</span> <span class="text">거절하기</span>
						</a>
					</div>
				</div>
				<div class="modal fade" id="okModal" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">요청 승인 처리</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-12 col-lg-12">
											<div class="modal-body">
												<p>물품명과 승인상태를 확인하고 처리하세요</p>
												<div class="panel-body">
													<table width="100%"
														class="table table-striped table-bordered table-hover"
														id="dataTablesOk">
														<thead>
															<tr>																
																<th style="text-align: center;"
																	class="text-black-50 small">등록요청번호</th>
																<th style="text-align: center;"
																	class="text-black-50 small">물품명</th>
																<th style="text-align: center;"
																	class="text-black-50 small">등록자</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
													</table>
												</div>
												<h5>*택배사</h5>
												<select id="delivery" name="delivery">
													<option value="04">CJ대한통운</option>
													<option value="05">로젠택배</option>
												</select>
												<h5>*송장번호</h5>
												<textarea id="dNo" name="dNo" class="col-lg-12" placeholder="EX)송장번호 입력"></textarea>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default"
													data-dismiss="modal" id="okResult">승인처리</button>
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
		$("#no").click(function() {
			$("#go").submit();
		});
	
		
		$("#ok").click(function() {
			var status = $("#nums").val();
			console.log(status);
			$.ajax({
				url:"reqOkSelect.bo?status=" + status,
				type:"get",
				success:function(data) {
					console.log(data);
					
					var $dataTables = $("#dataTablesOk tbody");
					var $delivery = $("<textarea id='delivery' name='delivery' class='col-lg-12' placeholder='EX)CJ대한통운'></textarea>");
					var $dNo = $("<textarea id='dNo' name='dNo' class='col-lg-12' placeholder='EX)송장번호 입력'></textarea>"); 		
			
					//기존 테이블 행 제거
					$("#dataTablesOk > tbody > tr").remove();
					$delivery.remove();
					$dNo.remove();
					
					var $tr = $("<tr class='odd gradeX'>");
					var $upNoTd = $("<td>").text(data.upNo);
					var $productNameTd = $("<td>").text(data.productName);
					var $bWriterTd = $("<td>").text(data.bWriter);
						
					$tr.append($upNoTd);
					$tr.append($productNameTd);
					$tr.append($bWriterTd);
						
					$dataTables.append($tr);
				},
				error:function(data) {
					console.log("실패");
				}
			});
		});
		
		$("#okResult").click(function() {
			var num = $(".gradeX").find("td").eq(0).text();
			
			var delivery = $("#delivery").val();
			var dNo = $("#dNo").val();
			console.log(delivery);
			console.log(dNo);
			console.log(num)
			var textResult = $("#textResult").val();
			location = "<%= request.getContextPath() %>/reqOk.bo?num=" + num + "&delivery=" + delivery + "&dNo=" + dNo;
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

