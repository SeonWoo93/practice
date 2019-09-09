<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.st.product.model.vo.PCategory"%>
<%
	HashMap<String, Object> listMap = (HashMap<String, Object>)request.getAttribute("listMap");
	ArrayList<PCategory> ctgList = (ArrayList<PCategory>)listMap.get("ctgList");
	ArrayList<HashMap<String, Object>> bList = (ArrayList<HashMap<String, Object>>)listMap.get("bList");
	String ctgLv2 = (String)request.getAttribute("ctgLv2");
	
	HashMap<String, Object> filterMap = (HashMap<String, Object>)request.getAttribute("filterMap");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-물품리스트</title>
<style>
	.header {
		width:100%;
		background:white;
	}
	.main {
		padding:20px 10px 20px 10px;
		margin:0;
		width:100%;
		height:auto;
	}
	.footer {
		padding:0;
		margin:0;
		width:100%;
	}
	.filterArea {
		/* min-height:300px; */
	}
	.thumbnailArea {
		height:100%;
	}
	.thumbnail {
		margin:5px;
		height:350px;
	}
	.thumbnail:hover {
		cursor:pointer;
	}
	.thumbnailImg {
		width:100% !important;
		height:60% !important;
		border:1px solid lightgray;
		background-size:contain; 
		background-repeat:no-repeat;
		background-position:center; 
	}
	.filter {
		background:whitesmoke;
		border:1px solid gray;
		border-radius:5px;
		padding:10px;
		width:100%;
	}
	.ctgLv3Btn {
		display:inline-block;
		background:white;
		border:1px solid lightgray;
		border-radius:5px;
		padding:5px;
		margin:5px;
		
	}
	.ctgLv3Btn:hover {
		border:1px solid #0CB6F4;
		border-radius:5px;
	}
	#startFilter, #endFilter {
		 width:100% !important;
	}
	
	
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10">
		<!-- 헤더 -->
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>


		<!-- 메인바디 -->
		<div class="main">

			<br><br>
			<div class="row filterArea">
			<form id="filterForm" method="post">
				<div class="filter">
					<div class="ui red ribbon label" style="font-size:100%">
	        			<i class="check icon"></i> 상세검색
	      			</div>
	      			<br>
					<!-- <p>항목 선택</p> -->
					<% for(int i = 0; i < ctgList.size(); i++) { %>
					<div class="ctgLv3Btn">
						<div style="width:100%">
							<i class="check icon"></i>
							<label style="margin:0"><%= ctgList.get(i).getCtgName() %></label>
						</div>
					</div>
					<% } %>
					<hr style="border:1px solid lightgray">
					<div class="row">
						<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12" style="margin-bottom:5px;">
							<label>대여 날짜 검색</label>
							<div class="ui left icon fluid input datePicker" style="display:inline-block; margin-right:10px; width:130px;">
								<input type="text" name="startFilter" id="startFilter" placeholder="시작일" autoComplete="off">
								<i class="calendar alternate outline icon"></i>
							</div>
							
							<div class="ui left icon fluid input datePicker" style="display:inline-block; margin:0; width:130px;">
								<input type="text" name="endFilter" id="endFilter" placeholder="종료일" autoComplete="off">
								<i class="calendar alternate outline icon"></i>
							</div>
							<label style="font-size:0.8em; color:gray; font-style:italic">
							(일주일 단위로 대여가능하며, 최소대여기간은 일주일(7일)입니다.)</label>
						</div>
						<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
							<p>
								<label for="priceFilter">대여 가격 설정(/주)</label>
								<input type="text" name="priceFilter" id="priceFilter" readonly style="border:0; color:#F44A0C; font-weight:bold;">
							</p>
							<div id="slider-range"></div>
						</div>
					</div>
					<hr style="border:1px solid lightgray">
					<div>
						<label>정렬기준</label> &nbsp;&nbsp;
						<input type="radio" name="orderBy" value="recent" id="byRecent" checked>
						<label for="byRecent" style="font-size:0.8em">최신순</label>
						<input type="radio" name="orderBy" value="popular" id="byPopular"> 
						<label for="byPopular" style="font-size:0.8em">인기순</label>
						<input type="radio" name="orderBy" value="review" id="byReview"> 
						<label for="byReview" style="font-size:0.8em">리뷰 점수 높은순</label>
						<input type="radio" name="orderBy" value="priceAsc" id="byPriceAsc"> 
						<label for="byPriceAsc" style="font-size:0.8em">가격 낮은 순</label>
						<input type="radio" name="orderBy" value="priceDesc" id="byPriceDesc"> 
						<label for="byPriceDesc" style="font-size:0.8em">가격 높은 순</label>
					</div>
					<br>
					<div align="right">
						<div class="ui big red button" id="doFilter" align="right">적용하기</div>
					</div>
				</div>
				<br>
			</form>
			</div> <!-- end of filterArea -->
			
			<div class="row thumbnailArea">
			
				<% 
					for(int i = 0; i < bList.size(); i++) {
						HashMap<String, Object> hmap = bList.get(i);
				%>
				<div class="col col-lg-3 col-md-3 col-sm-6 col-xs-6">
					<div class="thumbnail">
						<div class="ui fluid image thumbnailImg" 
						style="background-image:url('/st/attach_upload/<%= hmap.get("changeName") %>')">
							<a class="ui left corner label">
	        					<i class="heart red icon"></i>
	      					</a>
	      					<a class="ui circular red label" style="position:absolute; top:75%; left:70%;
	      					width:50px; height:50px">
	      						<i class="cart plus icon" style="font-size:30px; position:absolute; top:40%; left:10%"></i>
	      					</a>
						</div>
						<div class="thumbnailCaption">
							<input type="hidden" name="bno" id="bno" value="<%= hmap.get("bno") %>">
							<p style="font-size:1.2em; font-weight:bold">
							<%= hmap.get("bTitle") %></p>
							<p style="color:#F44A0C">
								<b><%= hmap.get("price") %>원</b>
								<label style="font-size:0.8em; color:black"> / 보증금 <%= hmap.get("deposit") %>원</label>
							</p>
							<%-- <p style="font-size:0.8em; color:orange;"> / 보증금 <%= hmap.get("deposit") %>원</p> --%>
							<p align="right" style="font-size:0.8em; color:gray;">
								등록일 : <%= hmap.get("bDate") %> / 조회수 : <%= hmap.get("bCount") %>
							</p>
							<p align="right" style="font-size:0.8em; color:gray;">
							총 대여횟수:<%= hmap.get("rtCount") %>회</p>
							
							<div align="right" style="font-size:0.8em; color:gray;">대여후기 
								<div class="ui star large rating ratingContent" data-rating="<%= hmap.get("rvStar") %>" data-max-rating="5"></div>
								(<%= hmap.get("rvCount") %>개)
							</div>
						</div>
					</div>
				</div>
				<%  } %>

			</div>
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	<script>
		
		$(function() {
			$(".ratingContent").rating("disable");
			//대여 시작일, 종료일 지정
			var startDate;
			var endDate;
			var startDay;
			var endDay;
			var today = new Date();
			start = $("#startFilter").datepicker({
				dateFormat:"yy-mm-dd",
				defaultDate:"+1w",
				changeMonth:true,
				minDate:today,
				onSelect:function(selectedDate) {
					startDate = $(this).datepicker('getDate');
					endDate = new Date(startDate);
					endDate.setDate(startDate.getDate() + 6);
					endDay = endDate.getDay();
					$("#endFilter").datepicker("option", "minDate", endDate);
				}, 
				beforeShowDay:function(date) {
					if(startDay != null) {
						if(date.getDay() != startDay) {
							return [false];
						}else {
							return [true];
						}
					}else {
						return [true];
					}
				}
			});
		    end = $("#endFilter").datepicker({
		    	dateFormat:"yy-mm-dd",
		    	defaultDate:"+1w",
		    	changeMonth:true,
		    	onSelect:function(selectedDate) {
		    		endDate = $(this).datepicker('getDate');
		    		startDate = new Date(endDate);
		    		startDate.setDate(endDate.getDate() - 6);
		    		startDay = startDate.getDay();
		    		$("#startFilter").datepicker("option", "maxDate", startDate);
		    	},
		    	beforeShowDay:function(date) {
		    		if(endDay != null) {
			    		if(date.getDay() != endDay) {
			    			return [false];
			    		}else {
			    			return [true];
			    		}
		    		}else {
		    			return [true];
		    		}
		    	}
		    });
			
			
		    //가격설정 슬라이더
		    $( "#slider-range" ).slider({
			      range:true,
			      min:0,
			      max:100000,
			      step:1000,
			      values:[0, 100000],
			      slide:function(event, ui) {
			        $("#priceFilter").val(ui.values[0] + "원-" + ui.values[1] + "원");
			      }
			});
			$("#priceFilter").val($("#slider-range").slider("values", 0) +
			      "원-" + $("#slider-range").slider("values", 1) + "원");
			
			
			//필터 유지
			<% 
				
				if(filterMap != null) { 
					String ctgLv3Str = (String)filterMap.get("ctgLv3Str");
					String[] ctgLv3Arr = ctgLv3Str.split(",");
					for(int i = 0; i < ctgLv3Arr.length; i++) {
						for(int j = 0;  j < ctgList.size(); j++) {
							if(ctgLv3Arr[i].equals(ctgList.get(j).getCtgName())) {
								String selected = ctgLv3Arr[i];
			%>
			$(".ctgLv3Btn").each(function() {
				if($(this).find("label").text() == '<%= selected %>') {
					$(this).css("background", "#0CB6F4");
					$(this).find("i").css("color", "red");
				}
			});
			
			
			
			<%
								break;
							}
						}
					}
					
					Date startDate = (Date)filterMap.get("startDate");
					Date endDate = (Date)filterMap.get("endDate");
					int minPrice = (int)filterMap.get("minPrice");
					int maxPrice = (int)filterMap.get("maxPrice");
					String orderBy = filterMap.get("orderBy").toString();
					if(startDate != null) {
			%>
			$("#startFilter").val("<%= startDate %>");
			
			<% 
					}
					if(endDate != null) {
			%>
			$("#endFilter").val("<%= endDate %>");
			<% 
					}
			%>
			$( "#slider-range" ).slider({
			      range:true,
			      min:0,
			      max:100000,
			      step:1000,
			      values:[<%= minPrice %>, <%= maxPrice %>],
			      slide:function(event, ui) {
			        $("#priceFilter").val(ui.values[0] + "원-" + ui.values[1] + "원");
			      }
			});
			$("#priceFilter").val($("#slider-range").slider("values", 0) +
			      "원-" + $("#slider-range").slider("values", 1) + "원");
			
			$("input[name=orderBy]").each(function() {
				if($(this).val() == '<%= orderBy %>') {
					$(this).prop("checked", true);
				}
			});
			<%
			
				}
			%>
			
			
		});
		
		//하위카테고리 선택시 css변화
		$(".ctgLv3Btn").click(function() {
			if($(this).css("backgroundColor") != "rgb(12, 182, 244)") {
				$(this).css("background", "#0CB6F4");
				$(this).find("i").css("color", "red");
			}else {
				$(this).css("background", "white");
				$(this).find("i").css("color", "black");
			}
		});
		
		
		//필터적용
		$("#doFilter").click(function() {
			var ctgLv3Arr = [];
			$(".ctgLv3Btn").each(function() {
				if($(this).css("backgroundColor") == "rgb(12, 182, 244)") {
					var ctgName = $(this).find("label").text();
					ctgLv3Arr.push(ctgName);
				}
			});
			console.log(ctgLv3Arr);
			if(ctgLv3Arr.length == 0) {
				$(".ctgLv3Btn").each(function() {
					var ctgName = $(this).find("label").text();
					ctgLv3Arr.push(ctgName);
				});
			}
			var ctgLv3Str = ctgLv3Arr.toString();
			//encodeURIComponent
			var ctgLv2 = '<%= ctgLv2 %>';
			var ctgLv2query = encodeURIComponent(ctgLv2);
			var ctgLv3query = encodeURIComponent(ctgLv3Str);
			$("#filterForm").attr("action", "<%= request.getContextPath()%>/filter.bo?ctgLv2=<%= ctgLv2 %>" + "&ctgLv3Arr=" + ctgLv3Str);
			$("#filterForm").submit();
			
			
		});

		
		$(".thumbnail").click(function() {
			var bno = $(this).find("input[id=bno]").val();
			location.href="<%= request.getContextPath() %>/selectOne.bo?bno=" + bno;
		});
		
	</script>
</body>
</html>








