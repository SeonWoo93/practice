<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.product.model.vo.*, java.util.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		html {
		height:100%;
	}
	.pageWrapper {
		padding:0;
		margin:0;
		height:100%;
	}
	#header {
		padding:0;
		margin:0;
		width:100%;
		
	}
	#main {
		padding:0;
		margin:0;
		width:100%;
		min-height:80%;
	}
	#footer {
		padding:0;
		margin:0;
		width:100%;
		height:100px;
	}
	.vertical-menu {
 	 width: 15%;
 	 margin-top:10px;
 	 float:left;
	}

	.vertical-menu a {
	text-align: center;
  	background-color: #0CB6F4;
  	color: white;
  display: block;
  padding: 12px;
  text-decoration: none;
	}

.vertical-menu a:hover {
  background-color: #78DBFF;
  text-decoration: none;
  color:white;
}

.vertical-menu a.active {
  background-color: #78DBFF;
  color: white;
}
	.detail {
		margin-top:70px;
		display:block;
		float:left;
		width:80%;
		margin-left: 3%;
	}
	.detail .titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
	
	}
	.icon1 {
		width:70px;
	}

	#footer {
		float:right;
	}
	
	.titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
		width:1000px;
	}
	#mlogo { width:100%;}
		
	.pdlist{
		text-align: center;
		padding: 5px;
		color: #9e9e9e;
		height: 40px;
		
	}
	
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
			<div class="vertical-menu">
			<h1 align="left"><a href="/st/views/mypage/mypgMain.jsp" style="text-decoration: none; background: white; margin:-10px;"><img id="mlogo" src="/st/resource/img/mypage/mypage.png"></a></h1>
 			  <a href="/st/views/mypage/mypgUser.jsp" >내 정보 조회</a>
			  <a href="#" onclick="myUpPd();" class="active">내 등록 물품</a>
 			 <a href="#" onclick="myRtPd();">내 대여 현황</a>
  			<a href="#" onclick="myUserPd();">관심물품</a>
 			 <a href="/st/views/mypage/mypgPoint.jsp">적립금 현황</a>
 			 <a href="/st/views/mypage/mypgReport.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				
				<label>나의 등록 내역 </label> 
			<table align="center" width="100%">
				<tr class="titletb">
					<td>날짜</td>
					<td width="60%">상품정보</td>
					<td>상태</td>
					<td></td>
				</tr>
				<!-- <tr>
					<td colspan=12 style="text-align:center; padding:50px; height:500px">등록한 상품이 없습니다.</td>
				</tr> -->
				<%for(Product p : list) {%>
				<tr class="pdlist">
					<td><%= p.getpStartDate() %> ~ <%= p.getpEndDate() %></td>
					<td><%= p.getModel() %></td>
					<td><%= p.getSid() %></td>
					<td><% if(p.getSid().equals("등록 요청")) { %> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">취소</button><%}else{} %> </td>
				</tr>
				<%} %>
			<%-- 	<% for(no n : list){ %>
				<tr>
					<td><%= n.getNno() %></td>
					<td><%= n.getnTitle() %></td>
					<td><%= n.getnWriter() %></td>
					<td><%= n.getnCount() %></td>
					<td><%= n.getnDate() %></td>
				</tr>
				<% } %> --%>
			</table>
			
			
			</div>
	
	</div>
		
	<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	<div class="col-lg-1 col-md-1">
	</div>
	<script>
		function myUpPd(){
			location.href="/st/selectList.pd";
		}
		function myRtPd(){
			location.href="/st/selectListrental.pd";
		}
		function myUserPd(){
			location.href="/st/zzimList.pd";
		}
	</script>
</body>
</html>
			