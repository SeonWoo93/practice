<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.member.model.vo.Member, java.util.Date"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String emailVerif = "";
	if(loginUser != null) {
		emailVerif = loginUser.getEmailVerif();
	}
	
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
</head>
<body>


   

    <div class="panel panel-danger" style="margin-top:5%; margin-left:5%; margin-right:5%;" >
      <div class="panel-heading" style="font-weight:bold;">
      <i class="fas fa-volume-off"></i> 신고하기 </div>
      <label style="font-weight:bold; margin-top:3%;  margin-left:2%;">신고하는 사유가 무엇인가요? (필수)</label>
      <form>
      
      <div class="panel-body">
      <select style="width:200px;">
      <option>관련없는 이미지</option>
      <option>관련없는 내용</option>
      <option>욕설/비방</option>
      <option>광고/홍보글</option>
      <option>개인정보유출</option>
      <option>음란/선정성</option>
      <option>저작권 불법도용</option>
      <option>기타</option>
      </select>
      
      </div> <!-- panel - body -->
	<div>
	
	      <label style="font-weight:bold;margin-left:2%;">작성자
	      </label><input style="margin-left:2%; margin-bottom:2%;"type="text" id="userId" name="userId"  value="<%= loginUser.getUserId()%>" readonly><br>
		  <label style="font-weight:bold;margin-left:2%;">
		  대상 회원 번호</label><input style="margin-left:2%; margin-bottom:2%;"type="text" id="targetId" name="targetId"  value="<%= loginUser.getUserId()%>" readonly><br>
		  <label style="font-weight:bold;margin-left:2%;">
		  사유 내용</label><br><textarea style="width:80%; height:200px; margin-left:2%;" placeholder="상품평과 관계 없는 글 (비방, 욕설, 광고, 잘못된 정보 등)을 신고해주시면 , 관리자 확인 후 해당 상품평의 노출이 제한 될 수 있습니다. 타당한 사유 없이 허위 신고 시 신고자에 대한 활동 제한이 가해질 수 있으니, 신고 전에 신중하게 재고해주시기 바랍니다."></textarea><br>
		<% Date nDate = new Date(); %>
		<label style="font-weight:bold;margin-left:2%;">신고 접수 일자</label><label style="margin-left:2%;"><%= nDate %></label>
	</div>      
      </form>
    </div><!-- panel panel-danger -->
			<div style="margin-bottom:30px;">
		
		<ul class="pager">
    <li><a href="mypgReport.jsp" style="color:#F44A0C">등록하기</a></li>

  </ul>
</div>


</body>
</html>






















