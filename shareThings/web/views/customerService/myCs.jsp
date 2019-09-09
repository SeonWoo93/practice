<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.customerService.model.vo.*, java.util.*"%>
<%
	ArrayList<Cs> list = (ArrayList<Cs>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
h3 {
margin-left:10%;
}
.cus {
float:left;
display:block;
}
/* #cus2 {
clear:left;
} */

#main {
width:100%;
}
	#info {
		width:100%;
	}
	
	#footer{
		clear:left;
	}
	.que {
	margin-left:22%;
	margin-top:0 auto;
	}
	.vertical-menu {
     width: 15%;
     margin-top:10px;
     float:left;
   }

   .vertical-menu a {
   text-align: center;
     background-color: #eee;
     color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
   }

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #4CAF50;
  color: white;
}
.detail {

      display:block;
      float:left;
      width:80%;
      margin-left: 3%;
   }
	
</style>

</head>
<body>

<div class="col-lg-1 col-md-1">
	</div>
	
	
	<div class="pageWrapper col-lg-10 col-md-10">
		<div id="header">
			<%@ include file="../common/header.jsp" %>
		</div>
		<div id="main" style="">
		
<!-- header -->


<div id="info" style="margin-top:50px;">

<div class="cus">
<table>
<tr>
<td></td>
</tr>
<tr>

<td><i class="fas fa-headset fa-4x"></i></td>
</tr>
</table>

</div> <!-- cus -->
<div class="cus" id="cus2" style="margin-left:5%;">
<table>
<tr >

<td id="text1" style="font-size:25px;"><label>Customer Service</label></td>


</tr>

<tr>
<td id="text1" style="font-size:25px;"><label>02-1234</label></td>
</tr>
</table>
</div> <!-- dus -->


</div> <!-- info -->
</div> <!-- main -->


<div style="clear:left;"></div>
<hr>

<div>
<label class="que" style="font-size:30px;">나의 문의 관리</label>


</div> <!-- 자주 묻는 질문 -->

<div class="vertical-menu" style=" align:center; ">
 <a href="/st/views/customerService/cs.jsp" >자주 묻는 질문 FAQ</a>
           <a href="/st/views/customerService/mtmQue.jsp">1 : 1 문의하기</a>
           <a onclick="myQue();">나의 문의 관리</a>
 <a href="/st/views/customerService/guide.jsp">이용안내 / 약관</a>


</div> <!-- 옆에 메뉴 -->

    <!-- 여기부터 하면 됨! -->
    
    <div class="detail" style="margin-top:18px; margin-bottom:18px;">
   <div>
   <table style="text-align:center;" id="listArea">
   <tr style="font-weight:bold;">
   <th style="width:200px; height:50px; border:1px solid black; text-align:center;">글번호</th>
   <th style="width:200px; height:50px; border:1px solid black; text-align:center;">날짜</th>
   <th style="width:600px; height:50px; border:1px solid black; text-align:center;">문의 내용</th>
   <th style="width:200px; height:50px; border:1px solid black; text-align:center;">상태</th>
   
   </tr>
  <!--  <tr>
   <td style="width:200px; height:50px; border:1px solid black;">2019.05.11</td>
   <td style="width:600px; height:50px; border:1px solid black;">아니 시발 킥보드 금요일까지 보내준다면서 왜 안와요????</td>
   <td style="width:200px; height:50px; border:1px solid black;">미확인</td>
   
   </tr>
   <tr>
   <td style="width:200px; height:50px; border:1px solid black;">2019.04.02</td>
   <td style="width:600px; height:50px; border:1px solid black;">캣타워 냄새나는데 어떡하죠?</td>
   <td style="width:200px; height:50px; border:1px solid black;">미확인</td>
   
   </tr>
   
	<tr>
   <td style="width:200px; height:50px; border:1px solid black;">2019.02.08</td>
   <td style="width:600px; height:50px; border:1px solid black;">보증금 왜 다 안보내줘요?</td>
   <td style="width:200px; height:50px; border:1px solid black;">미확인</td>
   
   </tr> -->
   	<%for(Cs p : list) {%>
				<tr class="pdlist">
					<td style="width:200px; height:50px; border:1px solid black;"><%= p.getCno() %></td>
					<td style="width:200px; height:50px; border:1px solid black;"><%= p.getcDate() %></td>
					<td style="width:200px; height:50px; border:1px solid black;"><%= p.getcContent() %></td>
					<td style="width:200px; height:50px; border:1px solid black;"><%= p.getcCategory() %></td>
					
				</tr>
				<%} %>
   
   </table>
   
   </div>
    
    </div> <!-- detail -->
    
    
    
   
</div> <!-- detail -->
    
  
<!-- footer -->
<div id="footer" >
			<%@ include file="../common/footer.jsp" %>
		</div>
	
	<div class="col-lg-1 col-md-1">
	</div>
<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"#ececec", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				
				console.log(num);
				
				location.href = "<%=request.getContextPath()%>/selectOne.cs?num=" + num;
			});
		});
	</script>
	<script>
function myQue(){
	location.href="/st/cslist.cs";
}
</script>
</body>
</html>