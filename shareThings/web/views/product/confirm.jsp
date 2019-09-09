<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	
	
	
}

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
	#pic1{
		width:200px;
		height:500px;
		text-align:center;
		
	}
	#pic2 {
	width:1000px;
	
	}
	 td{
	border:1.5px solid #c4c4c0;
	
	
	} 
	#title1{
	height:100px;
	text-align:center;
	}
	#category1{
	height:100px;
	text-align:center;
	}
	#lental1 {
	height:100px;
	text-align:center;
	}
	#info1 {
	height:200px;
	text-align:center;
	}
	#tag1 {
	height:100px;
	text-align:center;
	}
	#deal1 {
	height:100px;
	text-align:center;
	}
	#phone1 {
	height:100px;
	text-align:center;
	}
	#address1 {
	height:100px;
	text-align:center;
	}
	#time1 {
	height:100px;
	text-align:center;
	}
	#modelName1 {
	height:100px;
	text-align:center;
	}
	.pho1 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.pho0 {
	display:block;

	}
	.pho2 {
	display:block;
	float:left;
	width:30%;
	height:220px;
	border:1px solid #c4c4c0;
	clear:left;
	margin-left:2.5%;
	margin-bottom:1.5%;
	}
	.tb{
	margin-left:2.5%;
	
	}
	.ta{
	margin-left:2.5%;
	}
	.dta{
	margin-left:2.5%;
	}
	.p {
	margin-left:2.5%;
	}
	.zad {
	margin-left:2.5%;
	
	}
	.tta {
		margin-left:2.5%;
	
	}
	.mta{
		margin-left:2.5%;
	
	}
	.cc{
	margin-left:2.5%;
	}
	.price {
	margin-left:2.5%;
	height:100px;
	
	}
	.brand {
	margin-left:2.5%;
	
	}
	#purchasePrice2{
	height:100px;
	}
	#brand2 {
	height:100px;
	}
	.brand3 {
	margin-left:2.5%;
	}
	#as2{
	height:100px;
	}
	.as3{
	margin-left:2.5%;
	}
	#rentPrice2{
	height:100px;
	
	}
	.rentPrice3 {
	margin-left:2.5%;
	}
	#deposit2{
	height:100px;
	}
	.deposit3{
	margin-left:2.5%;
	}
</style>
</head>
<body>

<div>
<div class="col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main">
		
<div style="width:100%; height:500px;">
<div style="width:100%; height:200px;margin-top:5%;">
<label style="margin:2%;"> * 등록정보</label>

<table align="center" style="width:100%;">
<tr align="center" style="font-weight:bold;">
<td style="padding:10px;">등록 날짜 </td>
<td>등록 상품</td>
<td colspan=2>금액</td>
<td>등록 상태</td>



</tr>
<tr align="center">
<td rowspan="3">2019-05-13</td>
<td rowspan="3">삼천리 킥보드</td>
<td style="padding:10px; font-weight:bold">렌트비</td>
<td>30000</td>
<td rowspan="3">결제완료</td>


</tr>
</tr>
<tr align="center">


<td style="padding:10px; font-weight:bold">보증금</td>
<td>30000</td>


</tr>
</tr>
<tr align="center">


<td style="padding:10px; font-weight:bold">total</td>
<td>30000</td>


</tr>



</table> <!-- 등록정보 -->

</div><!-- yellow -->


<hr>


<label  style="margin:2%;"> * 배송 정보</label>


<div>
<table align="center" style="width:100%; text-align:center">
<tr >
<td style="width:30%; padding:10px; font-weight:bold;">이름</td>
<td>차소희</td>


</tr>
<tr>
<td style="width:30%; padding:10px;font-weight:bold;">연락처</td>
<td>010 - 2830 - 1660</td>


</tr>
<tr>
<td style="width:30%; padding:10px; font-weight:bold;">주소</td>
<td>서울특별시 선유로 53길 16-7 금강하우징</td>


</tr>
<tr>
<td style="width:30%; padding:10px; font-weight:bold;">배송 요청 사항</td>
<td>벨 누르지말고 집 앞에 두세요.</td>


</tr>

</table>

<label style="margin:2%; color:#F44A0C"> * 이미 배송중이라면, 정보를 변경해도 적용되지 않습니다</label>


</div> <!-- 배송정보 -->



</div> <!-- pink -->

<div style="margin:50px 0">
		
		<ul class="pager">
    <li><a href="productInsertPage.jsp" style="color:#F44A0C">이전</a></li>
    <li><a href="" style="color:#0CB6F4">다음</a></li>
  </ul>
</div>



		<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	</div> <!-- main -->
	<div class="col-lg-1 col-md-1">
	</div>
	</div>
	
	
	
	
</body>
</html>