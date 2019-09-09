<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = 
		(ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Share Things</title>
<style>
/*  input number 스피너 제거  */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#filter {
	margin-top: 30px;
}

#filterArea td {
	padding: 20px;
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
					<h1>대여 관리</h1>
					<div class="container-fluid">
						<hr>

						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">배송 조회</h1>
						<hr>
						<div class="card-body">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-12" align="center">
										<div class="card shadow mb-4">
											<div class="card-header py-3">조회 필터</div>
											<div class="card-body">
												<form id="filterArea">
													<table class="col-lg-12" id="filter">
														<tr>
															<td width="10%">배송상태</td>
															<td width="15%"><select class="form-control">
																	<option value="hidden">배송상태</option>
																	<option value="0">배송중</option>
																	<option value="10">배송완료</option>
															</select></td>
															<td width="10%">상세조건</td>
															<td width="15%"><select class="form-control">
																	<option>상세조건</option>
																	<option value="0">대여주문번호</option>
																	<option value="10">대여자이름</option>
																	<option value="20">물품명</option>
																	<option value="30">물품번호</option>
															</select></td>
															<td width="15%"><input type="text"
																class="form-control" placeholder="상세정보입력"></td>

														</tr>
														<tr>
															<td>대여기간</td>
															<td width="25%"><input type="date" name="startDate"
																style="width: 140px"> &nbsp; ~ &nbsp;<input
																type="date" name="endDate" style="width: 140px">
															</td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</table>
													<br>
													<div align="center">
														<button type="submit">조회하기</button>
														&nbsp;&nbsp;
														<button type="reset">초기화</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 리스트 테이블  -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary" id="listSize"><%= list.size()%>건</h6>
							</div>
							<div class="card-body">
								<div class="row"></div>
								<br>
								<div class="table-responsive">
									<div class="dataTables_wrapper dt-bootstrap4"
										id="dataTable_wrapper">

										<div class="row">
											<div class="col-sm-12">
												<table width="100%" class="table table-bordered dataTable"
													id="dataTable" role="grid"
													aria-describedby="dataTable_info" style="width: 100%;"
													cellspacing="0">
													<thead>
														<tr role="row" align="center">
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 40px;"
																rowspan="1" colspan="1">대여주문번호</th>
															<th tabindex="0" class="sorting_asc"
																aria-controls="dataTable" style="width: 40px;"
																aria-sort="ascending" rowspan="1" colspan="1">물품번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 40px;"
																rowspan="1" colspan="1">택배사</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">송장번호</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 55px;"
																rowspan="1" colspan="1">발송일</th>

															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">대여요청일시</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 40px;"
																rowspan="1" colspan="1">대여자 ID</th>
															<!-- <th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 45px;"
																rowspan="1" colspan="1">대여자 이름</th> -->
															<!-- <th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 55px;"
																rowspan="1" colspan="1">대여자 연락처</th> -->
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 68px;"
																rowspan="1" colspan="1">배송지</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">배송타입</th>
															<th tabindex="0" class="sorting"
																aria-controls="dataTable" style="width: 67px;"
																rowspan="1" colspan="1">배송상태</th>

														</tr>
													</thead>
													<tbody>
														<% for(int i = 0; i<list.size(); i++){
															HashMap<String, Object> hmap = list.get(i);	
														
														%> 
														
														<tr class="even" role="row" align="center">
															<td><%= hmap.get("rtNo") %></td>
															<td><%= hmap.get("pno")%></td>
															<td id="dCom"><%= hmap.get("dCom")%></td>
															<td><%= hmap.get("invc")%></td>
															<td><%= hmap.get("spDate")%></td>
															<td><%= hmap.get("reqDate")%></td>
															<td><%= hmap.get("userId")%></td>
															<%-- <td><%= hmap.get("userName")%></td> --%>
															<%-- <td><%= hmap.get("phone")%></td> --%>
															<td><%= hmap.get("address")%></td>
															<td><%= hmap.get("inOut")%></td>
															<td class="tracking"> </td>
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
		$(document).ready(function(){
		    var myKey = "paDJdMz9NHdA8oZ69C2sgg"; // sweet tracker에서 발급받은 자신의 키 넣는다.
		    
		        // 택배사 목록 조회 company-api
		        $.ajax({
		        	
		            type:"GET",
		            dataType : "json",
		            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
		            success:function(data){
		                    var parseData = JSON.parse(JSON.stringify(data));
		                     console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
		                    
		                    var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
		                    console.log(CompanyArray); 
		                     
		                    var myData="";
		                    $.each(CompanyArray,function(key,value) {
		                            myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');                        
		                    });
		                    $("#tekbeCompnayList").html(myData);
		                    
		                    var t_code = new Array();
				            var t_invoice = new Array();
		                    
		           			 $(".even").each(function(){
		           				 
		           				var t_code = $(this).find("td").eq(2).text();
		           				console.log(t_code);
		           				if(t_code == "대한통운") t_code = "04";
		           				if(t_code == "우체국택배") t_code = "01";
		           				if(t_code == "로젠택배") t_code = "06";
		           				if(t_code == "CVSnet") t_code = "24";
		           				if(t_code == "한진택배") t_code = "05";
		           				console.log(t_code);
		           					
		           					
					            var t_invoice = $(this).find("td").eq(3).text();
					            var $trackingTd = $(this).find("td").eq(9);
				            $.ajax({
				                type:"GET",
				                dataType : "json",
				                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
				                success:function(data){
				                    var $dataTable = $(".dataTable");
				                    console.log(data);
				                    console.log("data.result : " + data.result);
				                    if(data.result == "N" || data.result =="" || data.status == false){
				                        $trackingTd = $trackingTd.text("배송 준비 중");
				                    }else {
				                    	switch(data.level){
				                    	case 1 : $trackingTd = $trackingTd.text("배송준비중"); break;
				                    	case 2 : $trackingTd = $trackingTd.text("집화완료"); break;
				                    	case 3 : $trackingTd = $trackingTd.text("배송중"); break;
				                    	case 4 : $trackingTd = $trackingTd.text("지점 도착"); break;
				                    	case 5 : $trackingTd = $trackingTd.text("배송출발"); break;
				                    	case 6 : $trackingTd = $trackingTd.text("배송 완료"); break;
				                    	}
				                    }
				                }
				            	});
		           			});
		           			
		            }
		        });
		        // 배송정보와 배송추적 tracking-api
		        $("#trackingNumBtn").click(function() {
		            var t_code = $(".even").find("td").eq(2).text();
		            var t_invoice = $(".even").find("td").eq(3).text();
					
		            $.ajax({
		                type:"GET",
		                dataType : "json",
		                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
		                success:function(data){
		                    console.log(data);
		                    var myInvoiceData = "";
		                    if(data.status == false){
		                        myInvoiceData += ('<p>'+data.msg+'<p>');
		                    }else{
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"보내는사람"+'</td>');                     
		                        myInvoiceData += ('<th>'+data.senderName+'</td>');                     
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
		                        myInvoiceData += ('<th>'+data.itemName+'</td>');                     
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
		                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
		                        myInvoiceData += ('</tr>');     
		                        myInvoiceData += ('<tr>');                
		                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
		                        myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
		                        myInvoiceData += ('</tr>');                                       
		                    }
		                    
		                    
		                    $("#myPtag").html(myInvoiceData)
		                    
		                    var trackingDetails = data.trackingDetails;
		                    
		                    
		                    var myTracking="";
		                    var header ="";
		                    header += ('<tr>');                
		                    header += ('<th>'+"시간"+'</th>');
		                    header += ('<th>'+"장소"+'</th>');
		                    header += ('<th>'+"유형"+'</th>');
		                    header += ('<th>'+"전화번호"+'</th>');                     
		                    header += ('</tr>');     
		                    
		                    $.each(trackingDetails,function(key,value) {
		                        myTracking += ('<tr>');                
		                        myTracking += ('<td>'+value.timeString+'</td>');
		                        myTracking += ('<td>'+value.where+'</td>');
		                        myTracking += ('<td>'+value.kind+'</td>');
		                        myTracking += ('<td>'+value.telno+'</td>');                     
		                        myTracking += ('</tr>');                                    
		                    });
		                    
		                    $("#myPtag2").html(header+myTracking);
		                    
		                }
		            });
		        });
		        
		});
		</script>


	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%= request.getContextPath() %>/resource/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="<%= request.getContextPath() %>/resource/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-area-demo.js"></script>
	<script
		src="<%= request.getContextPath() %>/resource/js/demo/chart-pie-demo.js"></script>
</body>

</html>

