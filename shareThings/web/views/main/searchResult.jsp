<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> bList = (ArrayList<HashMap<String, Object>>)request.getAttribute("bList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-검색결과</title>
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
		}); 

		
		$(".thumbnail").click(function() {
			var bno = $(this).find("input[id=bno]").val();
			location.href="<%= request.getContextPath() %>/selectOne.bo?bno=" + bno;
		});
		
	</script>
</body>
</html>








