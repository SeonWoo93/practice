<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.sql.Date, com.kh.st.notice.model.vo.Notice, com.kh.st.common.PageInfo"%>
<%
	ArrayList<Notice> nList = (ArrayList<Notice>)request.getAttribute("nList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-공지사항</title>
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
	}
	.noticeTable tr:last-child {
		border-bottom:2px solid red;
	}
	.noticeTable>tbody tr:hover {
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

			
			<div class="noticeArea">
				<div class="row noticeHead">
					<br><br>
					<h1 class="ui center aligned icon header">
						<i class="clipboard list icon"></i>
						공지사항
					</h1>
				</div>
				<br><br>
				<div class="row searchArea" align="right" style="margin:10px 5px">
					<div class="col col-lg-1 col-md-1"></div>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12 ui search">
						<div class="ui icon input">
							<input class="prompt" type="text" id="searchNotice" placeholder="공지(제목+내용) 검색"> 
							<i class="search icon"></i>
						</div>
						<!-- <div class="results"></div> -->
					</div>
					
				</div>
				<div class="row noticeTableArea" align="center">
					<div class="col col-lg-1 col-md-1"></div>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<table class="table table-hover noticeTable">
							<thead>
								<tr style="border-top:2px solid red; background:whitesmoke">
									<th width="15%">번호</th>
									<th width="45%">제목</th>
									<th width="20%">작성자</th>
									<th width="20%">작성일</th>
								</tr>
							</thead>
							<tbody>
								<% for(int i = 0; i < nList.size(); i++) { %>
								<tr>
									<td><%= nList.get(i).getNno() %></td>
									<td><%= nList.get(i).getnTitle() %></td>
									<td><%= nList.get(i).getnWriter() %></td>
									<td><%= nList.get(i).getnDate() %></td>
								</tr>
								<% } %>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="row pagingArea" align="center">
					<div class="col col-lg-1 col-md-1"></div>
					<div class="col col-lg-10 col-md-10 col-sm-12 col-xs-12">
						<a class="ui red circular label" href="<%= request.getContextPath()%>/selectList.no?currentPage=1"><<</a>
						<% if(currentPage <= 1) { %>
						<a class="ui orange circular label"><</a>
						<% }else { %>
						<a class="ui orange circular label" href="<%= request.getContextPath()%>/selectList.no?currentPage=<%= currentPage - 1%>"><</a>
						<% } %>
						
						
						<%
							for(int p = startPage; p <= endPage; p++) {
								if(p == currentPage) {
						%>
						<a class="ui gray circular label"><%= p %></a>
						<% 		}else { %>
						<a class="ui gray circular label" href="<%= request.getContextPath()%>/selectList.no?currentPage=<%= p %>"><%= p %></a>
						<% 		}
							}
						%>
						
						<% if(currentPage >= maxPage) { %>
						<a class="ui orange circular label">></a>
						<% }else { %>
						<a class="ui orange circular label" href="<%= request.getContextPath()%>/selectList.no?currentPage=<%= currentPage + 1 %>">></a>
						<% } %>
						<a class="ui red circular label" href="<%= request.getContextPath()%>/selectList.no?currentPage=<%= maxPage %>">>></a>
						
					</div>
				</div>
			</div> <!-- end of noticeArea -->
			<br><br><br><br>
			
			


		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		$(".noticeTable").children("tbody").children("tr").click(function() {
			var nno = $(this).children("td").eq(0).text();
			location.href="<%= request.getContextPath() %>/selectOne.no?nno=" + nno;
		});
		
		$("#searchNotice").change(function() {
			var input = $(this).val();
			$.ajax({
				url:"/st/search.no",
				type:"post",
				data:{input:input},
				success:function(data) {
					var $tbody = $(".noticeTable>tbody");
					$tbody.html("");
					for(var key in data) {
						var $tr = $("<tr>");
						var $nnoTd = $("<td>").text(data[key].nno);
						var $nTitleTd = $("<td>").text(data[key].nTitle);
						var $nWriterTd = $("<td>").text(data[key].nWriter);
						var $nDateTd = $("<td>").text(data[key].nDate);
						$tr.append($nnoTd);
						$tr.append($nTitleTd);
						$tr.append($nWriterTd);
						$tr.append($nDateTd);
						$tbody.append($tr);
					}
					$(".noticeTable").children("tbody").children("tr").click(function() {
						var nno = $(this).children("td").eq(0).text();
						location.href="<%= request.getContextPath() %>/selectOne.no?nno=" + nno;
					});
				}, error:function() {
					alert("서버 전송 실패");
				}
			});
		});
		
	</script>
</body>
</html>








