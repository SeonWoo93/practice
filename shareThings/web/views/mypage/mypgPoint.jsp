<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
	
	
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
	
	.btn{
		background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;
		font-size:5;
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
			<h1 align="left"><a href="mypgMain.jsp" style="text-decoration: none; background: white; margin:-10px;"><img id="mlogo" src="../../resource/img/mypage/mypage.png"></a></h1>
 			  <a href="mypgUser.jsp">내 정보 조회</a>
			<a href="#" onclick="myUpPd();">내 등록 물품</a>
 			 <a href="#" onclick="myRtPd();">내 대여 현황</a>
  			<a href="#" onclick="myUserPd();">관심물품</a>
 			 <a href="/st/views/mypage/mypgPoint.jsp" class="active">적립금 현황</a>
 			 <a href="mypgUser.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				
				<table align="center" style="text-align:center">
				<tr>
					<td><img src="../../resource/img/mypage/<%= loginUser.getmLevel() %>.png" alt="" style="width:150px; height:150px;"/></td>
				</tr>
				<tr>
				<%-- <%
				String level = loginUser.getmLevel();
				
				switch(loginUser.getmLevel()){
				case "MLV1" : String levelname="바보"; break;
				case "MLV2" : String levelname="바보"; break;
				case "MLV3" : loginUser.setRank("멍게"); break;
				case "MLV4" : loginUser.setRank("렌탈킹"); break;
				} 
				
				%> --%>
					<td style="padding:10px"><h5>현재 고객님의 회원 등급은  "<%= loginUser.getmLevel() %>" 입니다.</h5></td>
				</tr>
			
				<tr>
					<td>
						<input type="button" value="등급별 혜택 보기" style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;"/>
					</td>
				</tr>
			</table>
			<hr />
			
			<h3 style="float:right;">나의 적립금 | <label style="color:#F44A0C"><%= loginUser.getTotalPoint() %> Point</label></h3> <label></label>
			<br>	
			
			<label>적립금 적립 내역</label> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none; font-size:10px;">지난 날짜 검색</button>
			<table align="center" width="100%">
				<tr class="titletb">
					<td >날짜</td>
					<td  width="60%">상품정보</td>
					<td>증감</td>
				</tr>
				<tr>
					<td colspan=12 style="text-align:center; padding:50px; height:200px">적립한 내역이 없습니다.</td>
				</tr>
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
			<hr>
			<label>적립금 사용 내역</label> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none; font-size:10px;">지난 날짜 검색</button>
			<table align="center" width="100%">
				<tr class="titletb">
					<td >날짜</td>
					<td  width="60%">상품정보</td>
					<td>증감</td>
				</tr>
				<tr>
					<td colspan=12 style="text-align:center; padding:50px; height:200px">사용한 내역이 없습니다.</td>
				</tr>
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
			