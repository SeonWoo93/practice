<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	int totalProfit = 0;
	String[] type = null;
	for(int i = 0; i < list.size(); i++){
		totalProfit += (int)list.get(i).get("netProfit");
	}
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
<script>


</script>
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
#filter td {
	padding: 5px;
}

.paging {
	margin-left: auto;
	margin-right: auto;
}

#dataTables-detail td {
	padding: 8px;
}

.MTR {
	color: black;
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
					<h1 class="h3 mb-2 text-gray-800">기업 매출</h1>
					<img src="<%=request.getContextPath()%>/resource/img/adminHr.png"
						width="100%">
					<div class="row" id="filter" align="center">
						<div class="col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">조회 필터</div>
								<div class="card-body">
								<form>
									<table class="col-lg-12" id="filter">
										<tr>
											<td width="5%">기간 :</td>
											<td><input type="date" id="startDate"
												style="width: 20%"> &nbsp;&nbsp;&nbsp; ~
												&nbsp;&nbsp;&nbsp; <input type="date" id="endDate"
												style="width: 20%">
											</td>
										</tr>
									</table>
									<div>
										<button type="button" onclick="filtering()">조회하기</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset">초기화</button>
									</div>
									</form>
								</div>
							</div>
							<div class="row">
					            <div class="col-xl-12 col-lg-12">
					
					              <!-- Area Chart -->
					              <div class="card shadow mb-4 col-lg-9" style="width:70%; height:430; display:inline-block; float:left">
						                <div class="card-header py-3">
						                  <h6 class="m-0 font-weight-bold text-primary">카테고리별 매출</h6>
						                </div>
						                <div class="card-body">
						                  <div class="chart-bar" id="chart-bar">
						                    <canvas id="myBarChart"></canvas>
						                  </div>
						                </div>
						              </div>
					              <div class="card shadow mb-4 col-lg-3" style="width:70%; height:430; display:inline-block; float:right">
					                <!-- Card Header - Dropdown -->
					                <div class="card-header py-3">
					                  <h6 class="m-0 font-weight-bold text-primary">카테고리별 건수</h6>
					                </div>
					                <!-- Card Body -->
					                <div class="card-body">
					                  <div class="chart-pie pt-4" id="chart-circle">
					                    <canvas id="myPieChart"></canvas>
					                  </div>
					                </div>
					              </div>
					           </div>
					        </div>
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="table-responsive">
										<div id="dataTable_wrapper"
											class="dataTables_wrapper dt-bootstrap4">
											<div class="row">
												<div class="col-sm-12">
												<div>
													<p id="totalProfit" style="float:left">총 순이익 : <%= totalProfit %>원</p>
												</div>
												<br>
													<table class="table table-bordered dataTable"
														id="dataTable" width="100%" cellspacing="0" role="grid"
														aria-describedby="dataTable_info" style="width: 100%;"
														style="height:100px;">
														<thead>
															<tr align="center" class="even">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-sort="ascending"
																	aria-label="Name: activate to sort column descending"
																	style="width: 10%;">구분</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 20%;">건수</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 32%;">대여매출</th>
																<th class="sorting" tabindex="0"
																	aria-controls="dataTable" rowspan="1" colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 10%;">순이익</th>
															</tr>
														</thead>
														<tbody>
															<% for(int i = 0; i < list.size(); i++){ 
																	HashMap<String,Object> hmap = list.get(i);%>
																<tr align="center" class="even">
																	<td><%= hmap.get("type") %></td>
																	<td><%= hmap.get("count") %>건</td>
																	<td><%= hmap.get("price") %>원</td>
																	<td><%= hmap.get("netProfit") %>원</td>
																</tr>	
															<% } %>
														</tbody>
													</table>
												</div>
											</div>
											<div class="row"></div>
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
				function filtering(){
					var startDate = $("#startDate").val();
					var endDate = $("#endDate").val();
					
					if(startDate > endDate || (endDate != "" && startDate == "")){
						alert("기간 설정이 잘못되었습니다.");
						return;
					}
					
					$.ajax({
						url:"<%=request.getContextPath()%>/selectStatFilter.st",
						data:{
							startDate:startDate,
							endDate:endDate
						},
						type:"get",
						success:function(data){
							$("#myBarChart").remove();
							$cd = $("<canvas id='myBarChart' style='display: block; height: 320px; width: 924px;' width='1039' height='360' class='chartjs-render-monitor'>");
							$("#chart-bar").append($cd);
							
							$("#myPieChart").remove();
							$pd = $("<canvas id='myPieChart' width='324' height='283' class='chartjs-render-monitor' style='display: block; height: 360px; width: 288px;'>");
							$("#chart-circle").append($pd);
							
							$("#dataTable > tbody > tr").remove();
							var $dataTable = $("#dataTable");
							
							var typeArr = new Array();
							var priceArr = new Array();
							var countArr = new Array();
							var max = 0;
							var total = 0;
							for(var key in data){
								typeArr.push(data[key].type);
								priceArr.push(data[key].price);
								countArr.push(data[key].count);
								total += data[key].netProfit;
								if(data[key].price > max){
									max = data[key].price;
								}
							}
							
							$("#totalProfit").text("총 순이익 : " + total + "원");
							
							console.log(typeArr);
							console.log(priceArr);
							var ctx = document.getElementById("myBarChart");
							var myBarChart = new Chart(ctx, {
							  type: 'bar',
							  data: {
							    labels: typeArr,
							    datasets: [{
							      label: "매출",
							      backgroundColor: ['#4e73df', '#0F3299', '#80E2FF','#FFD5BF','#CC6A52'],
							      hoverBackgroundColor: ['#0B3DE0', '#536B99', '#24E4FF','#FF9163','#CC2508'],
							      borderColor: "#4e73df",
							      data: priceArr,
							    }],
							  },
							  options: {
							    maintainAspectRatio: false,
							    layout: {
							      padding: {
							        left: 10,
							        right: 25,
							        top: 25,
							        bottom: 0
							      }
							    },
							    scales: {
							      xAxes: [{
							        time: {
							          unit: 'month'
							        },
							        gridLines: {
							          display: false,
							          drawBorder: false
							        },
							        ticks: {
							          maxTicksLimit: 6
							        },
							        maxBarThickness: 25,
							      }],
							      yAxes: [{
							        ticks: {
							          min: 0,
							          max: max + 20000,
							          maxTicksLimit: 5,
							          padding: 10,
							          callback: function(value, index, values) {
							            return "￦" + number_format(value);
							          }
							        },
							        gridLines: {
							          color: "rgb(234, 236, 244)",
							          zeroLineColor: "rgb(234, 236, 244)",
							          drawBorder: false,
							          borderDash: [2],
							          zeroLineBorderDash: [2]
							        }
							      }],
							    },
							    legend: {
							      display: false
							    },
							    tooltips: {
							      titleMarginBottom: 10,
							      titleFontColor: '#6e707e',
							      titleFontSize: 14,
							      backgroundColor: "rgb(255,255,255)",
							      bodyFontColor: "#858796",
							      borderColor: '#dddfeb',
							      borderWidth: 1,
							      xPadding: 15,
							      yPadding: 15,
							      displayColors: false,
							      caretPadding: 10,
							      callbacks: {
							        label: function(tooltipItem, chart) {
							          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
							          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
							        }
							      }
							    },
							  }
							});
							
							var mpc = document.getElementById("myPieChart");
							var myPieChart = new Chart(mpc, {
							  type: 'doughnut',
							  data: {
							    labels: typeArr,
							    datasets: [{
							      data: countArr,
							      backgroundColor: ['#4e73df', '#0F3299', '#80E2FF','#FFD5BF','#CC6A52'],
							      hoverBackgroundColor: ['#0B3DE0', '#536B99', '#24E4FF','#FF9163','#CC2508'],
							      hoverBorderColor: "rgba(234, 236, 244, 1)",
							    }],
							  },
							  options: {
							    maintainAspectRatio: false,
							    tooltips: {
							      backgroundColor: "rgb(255,255,255)",
							      bodyFontColor: "#858796",
							      borderColor: '#dddfeb',
							      borderWidth: 1,
							      xPadding: 15,
							      yPadding: 15,
							      displayColors: false,
							      caretPadding: 10,
							    },
							    legend: {
							      display: false
							    },
							    cutoutPercentage: 80,
							  },
							});
							
							
							
							for(var key in data){
								var $tr = $("<tr role='row' class='even' align='center'>");
								
								var $typeTd = $("<td>").text(data[key].type);
								var $countTd = $("<td>").text(data[key].count + "건");
								var $priceTd = $("<td>").text(data[key].price + "원");
								var $profitTd = $("<td>").text(data[key].netProfit + "원");
								
								
								$tr.append($typeTd);
								$tr.append($countTd);
								$tr.append($priceTd);
								$tr.append($profitTd);
								
								$dataTable.append($tr);
							}
						}
					})
				};
			
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
			<script>
			Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#858796';
			
			function number_format(number, decimals, dec_point, thousands_sep) {
			  number = (number + '').replace(',', '').replace(' ', '');
			  var n = !isFinite(+number) ? 0 : +number,
			    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			    s = '',
			    toFixedFix = function(n, prec) {
			      var k = Math.pow(10, prec);
			      return '' + Math.round(n * k) / k;
			    };
			  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
			  if (s[0].length > 3) {
			    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
			  }
			  if ((s[1] || '').length < prec) {
			    s[1] = s[1] || '';
			    s[1] += new Array(prec - s[1].length + 1).join('0');
			  }
			  return s.join(dec);
			}
			
			
			
			var ctx = document.getElementById("myBarChart");
			var myBarChart = new Chart(ctx, {
			  type: 'bar',
			  data: {
			    labels: ["전자기기", "취미/레저", "패션뷰티", "유아동", "반려동물"],
			    datasets: [{
			      label: "매출",
			      backgroundColor: ['#4e73df', '#0F3299', '#80E2FF','#FFD5BF','#CC6A52'],
			      hoverBackgroundColor: ['#0B3DE0', '#536B99', '#24E4FF','#FF9163','#CC2508'],
			      borderColor: "#4e73df",
			      data: [<%=list.get(0).get("price")%>,<%=list.get(1).get("price")%>,
			    	  <%=list.get(2).get("price")%>,<%=list.get(3).get("price")%>,
			    	  <%=list.get(4).get("price")%>],
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    layout: {
			      padding: {
			        left: 10,
			        right: 25,
			        top: 25,
			        bottom: 0
			      }
			    },
			    scales: {
			      xAxes: [{
			        time: {
			          unit: 'month'
			        },
			        gridLines: {
			          display: false,
			          drawBorder: false
			        },
			        ticks: {
			          maxTicksLimit: 6
			        },
			        maxBarThickness: 25,
			      }],
			      yAxes: [{
			        ticks: {
			          min: 0,
			          max: 180000,
			          maxTicksLimit: 5,
			          padding: 10,
			          callback: function(value, index, values) {
			            return "￦" + number_format(value);
			          }
			        },
			        gridLines: {
			          color: "rgb(234, 236, 244)",
			          zeroLineColor: "rgb(234, 236, 244)",
			          drawBorder: false,
			          borderDash: [2],
			          zeroLineBorderDash: [2]
			        }
			      }],
			    },
			    legend: {
			      display: false
			    },
			    tooltips: {
			      titleMarginBottom: 10,
			      titleFontColor: '#6e707e',
			      titleFontSize: 14,
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			      callbacks: {
			        label: function(tooltipItem, chart) {
			          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
			          return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
			        }
			      }
			    },
			  }
			});
			</script>
			<script>
			Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#858796';

			var mpc = document.getElementById("myPieChart");
			var myPieChart = new Chart(mpc, {
			  type: 'doughnut',
			  data: {
			    labels: ["전자기기", "취미/레저", "패션뷰티", "유아동", "반려동물"],
			    datasets: [{
			      data: [<%=list.get(0).get("count")%>,<%=list.get(1).get("count")%>,
			    	  <%=list.get(2).get("count")%>,<%=list.get(3).get("count")%>,
			    	  <%=list.get(4).get("count")%>],
			      backgroundColor: ['#4e73df', '#0F3299', '#80E2FF','#FFD5BF','#CC6A52'],
			      hoverBackgroundColor: ['#0B3DE0', '#536B99', '#24E4FF','#FF9163','#CC2508'],
			      hoverBorderColor: "rgba(234, 236, 244, 1)",
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    tooltips: {
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			    },
			    legend: {
			      display: false
			    },
			    cutoutPercentage: 80,
			  },
			});
			</script>
</body>

</html>

