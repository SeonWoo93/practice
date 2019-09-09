<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

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
 			 <a href="mypgUser.jsp" >내 정보 조회</a>
			  <a href="#" onclick="myUpPd();">내 등록 물품</a>
 			 <a href="#" onclick="myRtPd();">내 대여 현황</a>
  			<a href="#" onclick="myUserPd();">관심물품</a>
 			 <a href="mypgPoint.jsp">적립금 현황</a>
 			 <a href="mypgUser.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				<label>최근 대여 내역 </label> <button style="">?</button>
			<table align="center" width="100%">
				<tr class="titletb">
					<td >날짜</td>
					<td  width="60%">상품정보</td>
					<td >상태</td>
					<td>등록/대여</td>
				</tr>
				<tr>
					<td colspan=12 style="text-align:center; padding:50px">최근 대여한 상품이 없습니다.</td>
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
			<hr />
			<table align="center" style="text-align:center">
				<tr>
					<td><img src="../../resource/img/mypage/level-1.png" alt="" style="width:150px; height:150px;"/></td>
				</tr>
				<tr>
				<%
				/* int level = loginUser.getLevel();
				
				switch(loginUser.getLevel()){
				case 1 : loginUser.setRank("바보"); break;
				case 2 : loginUser.setRank("공"); break;
				case 3 : loginUser.setRank("멍게"); break;
				case 4 : loginUser.setRank("렌탈킹"); break;
				} */
				
				%>
					<td style="padding:10px"><h5>현재 고객님의 회원 등급은  "임시" 입니다.</h5></td>
				</tr>
			
				<tr>
					<td>
						<input type="button" value="에!"/>
					</td>
				</tr>
			</table>
			<hr />
			
			
			<label>최근 문희 내역 </label> <button style="">?</button>
			<table align="center" width="100%">
				<tr class="titletb">
					<td colspan=2>날짜</td>
					<td colspan=6 width="60%">내용</td>
					<td colspan=1>처리상태</td>
				</tr>
				<tr>
					<td colspan=12 style="text-align:center; padding:50px">최근 대여한 상품이 없습니다.</td>
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
			
			<table align="center" style="height:200px;">
			<tr>
				<td colspan=2 width=10%>나의 배송지 정보</td>
				<td colspan=6 width="70%" align="center"><%= loginUser.getAddress() %></td>
				<td colspan=1 width="10%"><button>변경하기</button></td>
			</tr>
			
			</table>
			
			
			
			
			</div>
	
	</div>
	<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
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
			