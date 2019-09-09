<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-로그인</title>
<style>
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
	#loginArea {
		height:500px;
	}
	#loginTable td, #loginBtnTable td{
		width:100px;
		padding:5px;
		text-align:center;
	}
	#loginBtn {
		font-size:15px;
		width:100%; 
		height:100px;
	}
	.otherJoinBtn {
		 width:50px; 
		 height:50px;
		 margin:0;
	}
</style>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="12788994986-3ejndvo3ft5erfdit8ash84jvl6spu01.apps.googleusercontent.com">
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
  				<i class="user circle outline icon"></i>
   			 	회원 로그인
			</h1>
			<!-- <h2 align="center">회원 로그인</h2> -->
			<div id="loginArea">
				<br><br>
				<!-- <form action="" method="post"> -->
					<table id="loginTable">
						<tr height="50px">
							<td><b>ID</b></td>
							<td colspan="2">
								<div class="ui left icon input">
									<input type="text" placeholder="아이디" name="userId">
									<i class="user icon"></i>
								</div>
							</td>
							<td rowspan="2">
								<button class="ui inverted blue fliuid button" id="loginBtn">로그인</button>
							</td>
						</tr>
						<tr height="50px">
							<td><b>PassWord</b></td>
							<td colspan="2">
								<div class="ui left icon input">
									<input type="password" placeholder="비밀번호" name="userPwd">
									<i class="unlock icon"></i>
								</div>
							</td>
						</tr>
					</table>
				<!-- </form> -->
				<div id="loginFail" style="font-size:0.8em; color:red; display:none;">아이디, 비밀번호가 일치하지 않습니다.</div>
				<table id="loginBtnTable">
					<tr height="50px">
						<td colspan="2" align="center">
							<button class="ui button" style="width:100%;" id="findIdBtn">아이디 찾기</button>
						</td>
						<td colspan="2" align="center">
							<button class="ui button" style="width:100%;" id="findPwdBtn">비밀번호 찾기</button>
							
						</td>
					</tr>
					<tr style="border-top:2px solid lightgray" height="70px">
						<td colspan="2" style="font-size:80%; color:gray;">아직 회원이 아니신가요?  </td>
						<td colspan="2">
							<button class="ui inverted orange button" style="width:100%" id="joinBtn">쉐어띵스 회원 가입하기</button>
						</td>
					</tr>
					<tr height="80px" style="border-bottom:2px solid lightgray">
						<td style="font-size:50%; color:gray;">타계정으로 시작하기</td>
						<td>
								<!-- <button class="ui circular google plus icon button otherJoinBtn" id="googleJoin">
									<i class="google plus icon"></i>
								</button> -->
							<!-- <div class="otherJoinBtn" id="googleJoinBtn" align="center">
								<img src="/st/images/googleIcon.jpg" width="100%" height="100%">
							</div> -->
							<div class="g-signin2" data-onsuccess="onSignIn"></div>
						</td>
						<td>
								<!-- <button class="ui circular green icon button otherJoinBtn" id="naverJoin">N</button> -->
							<div class="otherJoinBtn" id="googleJoinBtn" align="center">
								<img src="/st/images/naverIcon.jpg" width="100%" height="100%">
								</div>
						</td>
						<td>
							<!-- <button class="ui circular yellow icon button otherJoinBtn" id="kakaoJoin">K</button> -->
							<div class="otherJoinBtn" id="googleJoinBtn" align="center">
								<img src="/st/images/kakaoIcon.jpg" width="100%" height="100%">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<br><br><br>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
		
	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	
	<script>
		$(function() {
			<% if(request.getParameter("login") != null && request.getParameter("login").equals("first")) { %>
			alert("회원가입에 성공했습니다! 로그인해주세요.");
			<% } %>
		});
		
		
		$("#joinBtn").click(function() {
			location.href="<%= request.getContextPath() %>/views/member/memberJoinPage.jsp";
		});
		$("#findIdBtn").click(function() {
			location.href="<%= request.getContextPath() %>/views/member/findIdPwd.jsp";
		});
		$("#findPwdBtn").click(function() {
			location.href="<%= request.getContextPath() %>/views/member/findIdPwd.jsp"
		});
		$("#loginBtn").click(function() {
			var userId = $("input[name=userId]").val();
			var userPwd = $("input[name=userPwd]").val();
			$.ajax({
				url:"<%= request.getContextPath() %>/login.me",
				data:{userId:userId, userPwd:userPwd},
				type:"post",
				success:function(data) {
					if(data == "fail") {
						$("#loginFail").show();
					}else if (data == "admin"){
						$("#loginFail").hide();
						location.href="<%= request.getContextPath() %>/views/admin/adminMain.jsp";
					}else if(data == "emailNotVerified") {
						$("#loginFail").hide();
						location.href="<%= request.getContextPath() %>/views/member/beforeEmailVerifPage.jsp";
					}else {
						$("#loginFail").hide();
						location.href="<%= request.getContextPath() %>/mainLoad.bo";
					}
				}, error:function(data) {
					alert("서버전송 실패!");
				}
			});
		});
		
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
		
		
	</script>
</body>
</html>