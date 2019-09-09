<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.common.EmailVerification"%>
<%

	String code = null;
	if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-회원가입</title>
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
			<% if(loginUser == null) { %>
			<h1 class="ui center aligned icon header">
  				<i class="exclamation icon"></i>
   			 	먼저, 로그인을 해주세요.
			</h1>
			<button class="ui massive primary button" onclick="location.href='<%= request.getContextPath()%>/views/member/loginPage.jsp'">
			로그인하러 가기</button>
			<% 
			   }else { 
					String userEmail = loginUser.getEmail();
					boolean isRight = ((new EmailVerification().getSHA256(userEmail)).equals(code))?true:false;
					if(isRight == true) {
			%>
			<script>
				alert("인증에 성공했습니다!");
				location.href="<%= request.getContextPath()%>/emailVerif.me";
			</script>
			<%
					}else {
			%>
			<script>
				alert("유효하지 않은 인증입니다.");
				location.href="<%= request.getContextPath()%>/views/member/beforeEmailVerifPage.jsp";
			</script>
			<%
					}
			   } 
			%>
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