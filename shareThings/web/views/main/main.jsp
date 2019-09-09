<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.HashMap, com.kh.st.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> notice5List = (ArrayList<Notice>)request.getAttribute("notice5List");
	HashMap<String, Object> ctgTop5map = (HashMap<String, Object>)request.getAttribute("ctgTop5map");
	ArrayList<HashMap<String, Object>> top5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg0");
	ArrayList<HashMap<String, Object>> elecTop5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg1");
	ArrayList<HashMap<String, Object>> hobbTop5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg2");
	ArrayList<HashMap<String, Object>> bnfTop5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg3");
	ArrayList<HashMap<String, Object>> babyTop5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg4");
	ArrayList<HashMap<String, Object>> petTop5List = (ArrayList<HashMap<String, Object>>)ctgTop5map.get("ctg5");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스</title>
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
	.row1 {
		min-height:300px;
	}
	#top5 {
		height:300px;
		padding:15px; 
	}
	#notice5 {
		padding:0 0 15px 35px;
	}
	
	#notice5>table th {
		border-bottom:2px solid gray;
	}
	#notice5>table td {
		vertical-align:middle;
	}
	.row2 {
		min-height:300px;	
	}
	.categoryTop5 {
		width:100%;
		padding:0;	
	}
	.tab-content {
		/* height:200px; */
		padding:15px 0;
		border:2px solid #0CB6F4;
		border-bottom-right-radius:5px;
		border-bottom-left-radius:5px;
	}
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
		color: white !important;
    	cursor: default;
   		background-color: #0CB6F4 !important;
    	border: 2px solid #0CB6F4 !important;
    	border-bottom-color: transparent;
	}
	#notice5Table tr:hover {
		cursor:pointer;
	}
	.carouselImage:hover, .ctgTop5Image:hover {
		cursor:pointer;
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

			<!-- top5, 공지사항 행 -->
			<div class="row row1">
				<!-- top5 상품 캐러셀 -->
				<div id="top5"
					class="carousel slide col col-lg-6 col-md-6 col-sm-6 col-xs-12"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#top5" data-slide-to="0" class="active"></li>
						<li data-target="#top5" data-slide-to="1"></li>
						<li data-target="#top5" data-slide-to="2"></li>
						<li data-target="#top5" data-slide-to="3"></li>
						<li data-target="#top5" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" style="height: 100%">
						<% 
							for(int i = 0; i < top5List.size(); i++) { 
								if(i == 0) {
						%>
						<div class="item active carouselImage" style="height: 100%" align="center">
							<img src="/st/attach_upload/<%= top5List.get(i).get("changeName") %>" alt=""
								style="height: 100%; width: auto">
							<div class="carousel-caption">
								<input type="hidden" value="<%= top5List.get(i).get("bno") %>">
								<h3 style="color:orange;font-weight:bold"><%= top5List.get(i).get("bTitle") %></h3>
								<div>
									<label style="color:#0CB6F4; font-size:1.2em; "><%= top5List.get(i).get("price") %></label>원/주
									(보증금 :<label><%= top5List.get(i).get("deposit") %></label>원)
								</div>
								<div>
									총 대여횟수 : <label><%= top5List.get(i).get("rtCount") %></label>
									/ 후기 :<div class="ui star large rating ratingContent" 
									data-rating="<%= top5List.get(i).get("rvStar") %>" data-max-rating="5"></div>
									(<label><%= top5List.get(i).get("rvCount") %></label>)
								</div>
							</div>
						</div>
						<% 
								}else {
						%>
						<div class="item carouselImage" style="height: 100%" align="center">
							<img src="/st/attach_upload/<%= top5List.get(i).get("changeName") %>" alt=""
								style="height: 100%; width: auto">
							<div class="carousel-caption">
								<input type="hidden" value="<%= top5List.get(i).get("bno") %>">
								<h3 style="color:orange; font-weight:bold"><%= top5List.get(i).get("bTitle") %></h3>
								<div>
									<label style="color:#0CB6F4; font-size:1.2em"><%= top5List.get(i).get("price") %></label>원/주
									(보증금 :<label><%= top5List.get(i).get("deposit") %></label>원)
								</div>
								<div>
									총 대여횟수 : <label><%= top5List.get(i).get("rtCount") %></label>
									/ 후기 :<div class="ui star large rating ratingContent" data-rating="<%= top5List.get(i).get("rvStar") %>" data-max-rating="5"></div>
									(<label><%= top5List.get(i).get("rvCount") %></label>)
								</div>
							</div>
						</div>
						<% 
									}
								} 
						%>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#top5" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#top5" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>
				<!-- end of top5 상품 캐러셀 -->

				<!-- 공지사항 -->
				<div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12" id="notice5">
					<table class="table table-hover" id="notice5Table"
						style="width: 100%;">
						<caption style="font-size:1.5em">공지사항
							<button class="ui basic button" onclick="goToNotice();"
							style="float:right">전체보기</button>
						</caption>
						<thead>
							<tr>
								<th width="10%">No.</th>
								<th width="70%">Title</th>
								<th width="20%">Date</th>
							</tr>
						</thead>
						<tbody>
							<% for(int i = 0; i < notice5List.size(); i++) { %>
							<tr>
								<td><%= notice5List.get(i).getNno() %></td>
								<td><%= notice5List.get(i).getnTitle() %></td>
								<td><%= notice5List.get(i).getnDate() %></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div><!-- end of 공지사항 -->

			</div> <!-- end of row1 -->
			<br><br>
			<!-- 카테고리별 toP5 -->
			<div class="row row2">
				<a class="ui left icon basic label" style="font-size:1.5em">
					<i class="trophy yellow icon"></i>카테고리별 TOP5
				</a>
				<br><br>			
				<div class="">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#electronic">전자기기</a></li>
						<li><a data-toggle="tab" href="#hobby">취미레저</a></li>
						<li><a data-toggle="tab" href="#fashion">패션뷰티</a></li>
						<li><a data-toggle="tab" href="#baby">유아동</a></li>
						<li><a data-toggle="tab" href="#pet">반려동물</a></li>
					</ul>
					<div class="tab-content" style="min-height:200px;">
						<div id="electronic" class="tab-pane fade in active" align="center" style="width:100%">
							<% for(int i = 0; i < elecTop5List.size(); i++) { %>
							<div class="ctgTop5Image" style="display:inline-block; width:19%">
								<input type="hidden" value="<%= elecTop5List.get(i).get("bno") %>">
								<img src="/st/attach_upload/<%= elecTop5List.get(i).get("changeName") %>" class="categoryTop5">
								<a class="ui blue basic label"><%= elecTop5List.get(i).get("price") %>원/1주 <br>(보증금: <%= elecTop5List.get(i).get("deposit") %>원)</a>
							</div>
							<% } %>
						</div>
						<div id="hobby" class="tab-pane fade" align="center" style="width:100%">
							<% for(int i = 0; i < hobbTop5List.size(); i++) { %>
							<div class="ctgTop5Image" style="display:inline-block; width:19%">	
								<input type="hidden" value="<%= hobbTop5List.get(i).get("bno") %>">
								<img src="/st/attach_upload/<%= hobbTop5List.get(i).get("changeName") %>" class="categoryTop5">
								<a class="ui blue basic label"><%= hobbTop5List.get(i).get("price") %>원/1주<br> (보증금: <%= hobbTop5List.get(i).get("deposit") %>원)</a>
							</div>
							<% } %>
						</div>
						<div id="fashion" class="tab-pane fade" align="center" style="width:100%">
							<% for(int i = 0; i < bnfTop5List.size(); i++) { %>
							<div class="ctgTop5Image" style="display:inline-block; width:19%">
								<input type="hidden" value="<%= bnfTop5List.get(i).get("bno") %>">
								<img src="/st/attach_upload/<%= bnfTop5List.get(i).get("changeName") %>" class="categoryTop5">
								<a class="ui blue basic label"><%= bnfTop5List.get(i).get("price") %>원/1주<br> (보증금: <%= bnfTop5List.get(i).get("deposit") %>원)</a>
							</div>
							<% } %>
							
						</div>
						<div id="baby" class="tab-pane fade" align="center" style="width:100%">
							<% for(int i = 0; i < babyTop5List.size(); i++) { %>
							<div class="ctgTop5Image" style="display:inline-block; width:19%">	
								<input type="hidden" value="<%= babyTop5List.get(i).get("bno") %>">
								<img src="/st/attach_upload/<%= babyTop5List.get(i).get("changeName") %>" class="categoryTop5">
								<a class="ui blue basic label"><%= babyTop5List.get(i).get("price") %>원/1주<br> (보증금: <%= babyTop5List.get(i).get("deposit") %>원)</a>
							</div>
							<% } %>
						</div>
						<div id="pet" class="tab-pane fade" align="center" style="width:100%">
							<% for(int i = 0; i < petTop5List.size(); i++) { %>
							<div class="ctgTop5Image" style="display:inline-block; width:19%">
								<input type="hidden" value="<%= petTop5List.get(i).get("bno") %>">
								<img src="/st/attach_upload/<%= petTop5List.get(i).get("changeName") %>" class="categoryTop5">
								<a class="ui blue basic label"><%= petTop5List.get(i).get("price") %>원/1주<br> (보증금: <%= petTop5List.get(i).get("deposit") %>원)</a>
							</div>
							<% } %>
						</div>
						
					</div>
				</div>
				
				
			</div> <!-- end of row2 -->
			


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
		});
		
		function goToNotice() {
			location.href="/st/selectList.no";
		}
		$("#notice5Table>tbody tr").click(function() {
			var nno = $(this).children("td").eq(0).text();
			console.log(nno);
			location.href="/st/selectOne.no?nno=" + nno;
		});
		
		$(".ctgTop5Image").click(function() {
			var bno = $(this).children("input:hidden").val();
			location.href="/st/selectOne.bo?bno=" + bno;
		});
		$(".carouselImage").click(function() {
			var bno = $(this).children(".carousel-caption").children("input:hidden").val();
			location.href="/st/selectOne.bo?bno=" + bno;
		});
	</script>
</body>
</html>








