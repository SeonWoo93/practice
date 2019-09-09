<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.st.member.model.vo.*"%>
<%
	ArrayList<Mlevel> list = (ArrayList<Mlevel>) request.getAttribute("list");
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
#filter {
	margin-top: 50px;
}
#filterArea td, #allList td, #alterList td{
	padding : 10px;
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
					<h1 class="h3 mb-2 text-gray-800">회원등급관리</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<table class="col-lg-12">
										<tr align="center">
											<th style="width:33%">등급명</th>
											<th style="width:33%">기준</th>
											<th style="width:33%">혜택</th>
										</tr>
									</table>
								</div>
								<div class="card-body">
								
									<table class="col-lg-12" id="allList">
										<% for(Mlevel ml : list){ %>
										<tr align="center">
											<td style="width:33%"><%= ml.getLevelName() %></td>
											<td style="width:33%">대여 <%= ml.getLevelStd() %>원 이상</td>
											<td style="width:33%">대여시 <%= ml.getPerPoint() %>% 적립</td>
										</tr>
										<% } %>
									</table>
									<form id="updateForm" method="post" action="<%=request.getContextPath()%>/updateMlevel.me">
									<table class="col-lg-12" id="alterList">
										<% for(Mlevel ml : list){ %>
										<tr align="center">
											<td style="width:33%"><input type="hidden" value="<%= ml.getLevelCode() %>" name="levelCode" id="levelCode">
																  <input type="text" value="<%= ml.getLevelName() %>" name="levelName" id="levelName">
																  </td> 
											<td style="width:33%">대여 <input type="text" value="<%= ml.getLevelStd() %>" name="levelStd" id="levelStd">원 이상</td>
											<td style="width:33%">대여 시 <input type="text" value="<%= ml.getPerPoint() %>" name="perPoint" id="perPoint">% 적립</td>
										</tr>
										<% } %>
									</table>
									
									<br><br><br><br>
								</form>
								<div>
									<button id="changeLevel" onclick="changeLevel();">수정하기</button>
									<button id="complate" type="button" onclick="complate();">수정완료</button>
								</div>
								</div>
								<script>
									$(function(){
										$("#alterList").hide();
										$("#complate").hide();
									})
				
									function changeLevel(){
										$("#allList").remove();
										$("#changeLevel").remove();
										$("#alterList").show();
										$("#complate").show();
										return false;
									};
									
									function complate(){
					            		$("#updateForm").submit();
					            	}
									 
								</script>
								
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

