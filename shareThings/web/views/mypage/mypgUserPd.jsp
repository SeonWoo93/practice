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
	
		
	}
	
	.titletb {
		background:#0CB6F4;
		text-align: center;
		color:white;
		border: 1px solid black;
		
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
			<h1 align="left"><a href="/st/views/mypage/mypgMain.jsp" style="text-decoration: none; background: white; margin:-10px;"><img id="mlogo" src="/st/resource/img/mypage/mypage.png"></a></h1>
 			  <a href="mypgUser.jsp" >내 정보 조회</a>
			 <a href="#" onclick="myUpPd();">내 등록 물품</a>
 			 <a href="#" onclick="myRtPd();">내 대여 현황</a>
  			<a href="#" onclick="myUserPd();" class="active">관심물품</a>
 			 <a href="/st/views/mypage/mypgPoint.jsp">적립금 현황</a>
 			 <a href="mypgUser.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				<div id="iconspace">
				<table align="center" width="100%">
					<tr>
						<td colspan=6 style="width:50%; text-align:center"><img src="/st/resource/img/mypage/userPd.png" class="icon1"></td>
						<td colspan=6 style="width:50%; text-align:center"><img src="/st/resource/img/mypage/userPd.png" class="icon1"></td>
					</tr>
					<tr>
						<td colspan=6 style="width:50%; text-align:center"><button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">관심상품</button></td>
						<td colspan=6 style="width:50%; text-align:center"><button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">최근 본 상품</button></td>
					</tr>
					
				</table>
				</div>
			
			<label style="margin-top:70px;">관심 상품 </label> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">?</button>
			<table align="center" style="width:100%;">
				<tr class="titletb" style="">
					<td><input type="checkbox" checked></td>
					<td width="10%;">물품 등록 기간</td>
					<td colspan=2 width="65%;">상품정보</td>
					<td>상태</td>
					<td>렌탈금액/주</td>
					
				</tr>
				<%for(Product p : list) {%>
				<tr style="text-align:center; height:100px; border-bottom:1px solid gray;">
					<td><input type="checkbox" checked></td>
					<td><%= p.getpStartDate() %> ~ <%= p.getpEndDate() %></td>
					<td><img alt="" src="/st/attach_upload/<%= p.getAsHistory()%>" height="100px" width="auto"></td>
					<td><%= p.getModel() %></td>
					<td><%= p.getSid() %></td>
					<td><%= (p.getPrice())%> 원</td>
					<td><% if(p.getSid().equals("등록 요청")) { %> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">취소</button><%}else{} %> </td>
				</tr>
				<%} %>
				
				<%if(list.size() == 0) {%>
				<tr>
					<td colspan=12 style="text-align:center; padding:50px">관심물품에 추가한 상품이 없습니다.</td>
				</tr>
				<%} %>
				
				
			</table>
			<hr>
			</div>
	
	</div>
		
	<div id="footer" >
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
			