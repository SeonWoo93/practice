<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-Error</title>
<style>
	.main {
		padding:20px 10px 20px 10px;
		margin:0;
		width:100%;
		height:auto;
		min-height:400px;
	}
	.footer {
		padding:0;
		margin:0;
		width:100%;
	}
	
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10 col-xs-12">
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>

		<div class="main" align="center">
			<br><br>
			<h1 class="ui center aligned icon header">
  				<i class="x icon"></i>
   			 	<%= msg %>
			</h1>
			<h3><i class="frown outline icon"></i></h3>
			
			<br><br><br>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
		
	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		
	</script>
</body>
</html>