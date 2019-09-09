<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
 			  <a href="mypgUser.jsp" class="active">내 정보 조회</a>
			  <a href="mypgUpPd.jsp" >내 등록 물품</a>
 			 <a href="mypgRtPd.jsp">내 대여 현황</a>
  			<a href="mypgUserPd.jsp">관심물품</a>
 			 <a href="mypgPoint.jsp">적립금 현황</a>
 			 <a href="mypgUser.jsp">내 문의 내역</a>
 			 
			</div>
		
			<div class="detail">
				
				<!-- <table align="center" width="100%">
					<tr>
						<td colspan=6 style="width:50%; text-align:center ;border-right:1px solid black">회원 정보 설정</td>
						<td colspan=6 style="width:50%; text-align:center">배송지 설정</td>
					</tr>
					
				</table> -->
				<div class="btn-group btn-group-justified">
  		  			<a href="#" class="btn btn-primary" style="background:#0CB6F4;">회원 정보 수정</a>
    				<a href="#" class="btn btn-primary" style="background:#0CB6F4;">배송지 설정</a>
  				</div>
  				<hr>
  				<div style="height:420px;">
  					<form action="<%=request.getContextPath() %>/updateUser.me">
    					<!-- <div class="form-group">
      						<label for="userId">아이디:</label>
      						<input type="text" class="form-control" id="userId" readonly value="wnsgur3280">
    					</div>
    					<div class="form-group">
      						<label for="pwd">비밀번호:</label>
      						<input type="password" class="form-control" id="pwd">
    					</div>
    					<div class="form-group">
      						<label for="pwdcf">비밀번호 확인:</label>
      						<input type="password" class="form-control" id="pwdcf">
    					</div>
    					<div class="form-group" style="width:20%;">
      						<label for="usr">이름:</label>
      						<input type="text" class="form-control" id="usr" >
    					</div> -->

							
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="userId">아이디:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요." value="<%= loginUser.getUserId()%>" readonly>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="pwd">비밀번호:</label>
						    <div class="col-sm-10"> 
						      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요.">
						    </div>
						  </div>
						  
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="userName">이름:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요." value="<%= loginUser.getUserName()%>">
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">이메일:</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="email" name="email" placeholder="이메일 입력하세요." value="<%= loginUser.getEmail()%>">
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="phone">휴대전화:</label>
						    <div class="col-sm-10">
						      <input type="phone" class="form-control" id="phone" name="phone" placeholder="휴대전화번호를 입력하세요." value="<%= loginUser.getPhone()%>">
						   	  <button type="button" class="btn btn-default pull-right" id="identify" style="background:#ececec">휴대폰 인증</button>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="phone2">전화번호:</label>
						    <div class="col-sm-10">
						      <input type="phone" class="form-control" id="phone2" name="phone2" placeholder="비상연락망을 입력하세요." value="<%= loginUser.getSubPhone()%>">
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10" id="result" style="text-align:center" hidden>
						      회원 정보 수정
						    </div>
						  </div>
						   <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default center-block">회원 정보 수정</button>
						    </div>
						  </div>
						</form>


  				</div>
			
			<hr>
			<div >
				<form>
					 <div class="form-group">
						    <label class="control-label col-sm-2" for="phone">배송지 :</label>
						    <div class="col-sm-10">
						    	<select>
						    		<option>기본 배송지</option>
						    		<option>두번째 배송지</option>
						    		<option>세번째 배송지</option>
						    	</select>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						  </div>
						   <div class="form-group">
						    <div class="col-sm-10" style="width:20%;">
						    <%
					String add[] = loginUser.getAddress().split("[|]");
					String zipCode =  add[0];
					String address1 = add[1];
					String address2 = add[2];%>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						    
						    <div class="form-group">
						    <label class="control-label col-sm-2" for="phone">배송지 :</label>
						    <div class="col-sm-10">
						    <table style="width:50%;">
											<tr>
												<td>
												<input type="text" placeholder="우편번호" name="zipCode" id="zipCode"
										class="mandatory" value="<%= zipCode%>">
										</td>
												<td>
												<div class="ui orange button" id="addressSearch" style="height:35px">주소검색</div>
												</td>
											</tr>
										</table>
						    	
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						   <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		<table style="width:100%;">
						     			<tr style="width:100%;">
						     				<td>
						     		<input type="text" placeholder="기본주소" name="address1" id="address1" class="mandatory" value="<%= address1%>">
						     		</td>
						     		<td style="width:40%;">
						     		<input type="text" placeholder="상세주소" name="address2" id="address2" class="mandatory" value="<%= address2%>">
						     		</td>
						     		</tr>
						     		</table>
						     	</div>
						    </div>
						  </div>
						 
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
						 
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default center-block">배송지 정보 수정</button>
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						     	<div>
						     		&nbsp;
						     	</div>
						    </div>
				</form>
			</div>
			
			
			</div>
	
	</div>
		
	<div id="footer">
			<%@ include file="../common/footer.jsp" %>
		</div>
	<div class="col-lg-1 col-md-1">
	</div>
</body>
</html>
			