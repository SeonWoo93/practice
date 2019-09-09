<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.joinArea, .checkArea {
		padding:10px 30px;
		background:whitesmoke;
		border:1px solid lightgray;
		border-radius:5px;
	}
	#joinTable td, #TnCtable td {
		padding:5px;
	}
	#joinTable tr {
		height:50px;
	}
	.telInput {
		height:30px;
	}
	
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<div class="leftArea col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col-lg-10 col-md-10 col-xs-12">
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>

		<div class="main" align="center">
			<br><br>
			<h1 class="ui center aligned icon header">
  				<i class="circular users icon"></i>
   			 	회원 가입
			</h1>
			<!-- <h2 align="center">회원 가입</h2> -->
			<br><br>
			<form id="joinForm" action="<%= request.getContextPath() %>/join.me" method="post">
				<div class="row">
					<div class="col col-lg-2 col-md-2"></div>
					<div class="joinArea col col-lg-8 col-md-8" align="center">
					<br><br>
						<table id="joinTable">
							<tr>
								<td width="150px"><b>아이디 * </b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="아이디 입력" name="userId" id="userId"
										class="mandatory" >
									</div>
								</td>
								<td>
									<div class="ui blue button" id="idCheck" style="height:35px">중복확인</div>
								</td>
								<td colspan="2" width="200px">
									<div class="ui left pointing red basic label fluid wrongmsg" id="idWrongMsg"
									style="display:none;">
	      								아이디는 한글 및 특수문자 포함할 수 없습니다!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>비밀번호 *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="password" placeholder="비밀번호 입력" name="userPwd" id="userPwd"
										class="mandatory">
									</div>
								</td>
								<td colspan="2" width="200px">
									<div class="ui left pointing red basic label fluid wrongmsg" id="pwdWrongMsg"
									style="display:none;">
	      								비밀번호를 다시 확인해주세요!<br>(영문, 숫자 각 1자이상 포함 총 6자 이상)
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>비밀번호 재확인 *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="password" placeholder="비밀번호 재입력" name="userPwd2" id="userPwd2"
										class="mandatory">
									</div>
								</td>
								<td colspan="2" width="200px">
									<div class="ui left pointing red basic label fluid wrongmsg" id="pwdDismatchMsg"
									style="display:none;">
	      								비밀번호가 일치하지 않습니다!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>이름(실명) *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="text" placeholder="이름" name="userName" id="userName"
										class="mandatory">
									</div>
								</td>
								<!-- <td>
									<div class="ui blue button" id="idCheck" style="height:35px">본인인증</div>
								</td> -->
								<td colspan="3" width="200px">
									<div class="ui left pointing red basic label fluid wrongmsg" id="nameWrongMsg"
									style="display:none;">
	      								유효하지 않은 이름입니다!<br>(한글로만 입력가능)
	    							</div>
								</td>
							</tr>
							<tr>
								<td><b>성별 *</b></td>
								<td colspan="2">
									<input type="radio" name="gender" id="male" value="M" checked>
									<i class="male icon"></i>
									<label for="male">남</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" id="female" value="F">
									<i class="female icon"></i>
									<label for="female">여</label>
								</td>
							</tr>
							<tr>
								<td><b>생년월일 *</b></td>
								<td width="50px">
									<select name="birthYear">
										<% for(int i = 2001; i >= 1920; i--) { %>
										<option value=<%= i %>><%= i %>년</option>
										<% } %>
									</select>
								</td>
								<td>
									<select name="birthMonth">
										<% for(int i = 1; i <= 12; i++) { %>
										<option value=<%= i %>><%= i %>월</option>
										<% } %>
									</select>
								</td>
								<td>
									<select name="birthDay">
										<% for(int i = 1; i <= 31; i++) { %>
										<option value=<%= i %>><%= i %>일</option>
										<% } %>
									</select>
								</td>
							</tr>
							<tr>
								<td><b>휴대폰 번호 *</b></td>
								<td>
									<select name="phone0">
										<option value="skt">SKT</option>
										<option value="kt">KT</option>
										<option value="lg">LG U+</option>
									</select>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="010" name="phone1" size="3" class="mandatory">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="0000" name="phone2" size="4" class="mandatory">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="0000" name="phone3" size="4" class="mandatory">
									</div>
								</td>
								<td>
									<div class="ui left pointing red basic label fluid wrongmsg" id="phoneWrongMsg"
									style="display:none;">
	      								숫자만 입력해주세요!
	    							</div>
								</td>
								<!-- <td>
									<div class="ui blue button" id="idCheck" style="height:35px">인증번호 발송</div>
								</td> -->
							</tr>
							<!-- <tr>
								<td></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="text" placeholder="인증번호 입력" name="verifyNum" id="verifyNum">
									</div>
								</td>
							</tr> -->
							<tr>
								<td><b>이메일 주소 *</b></td>
								<td colspan="3">
									<div class="ui fluid input">
										<input type="email" placeholder="이메일 " name="email" id="email"
										class="mandatory">
									</div>
								</td>
								<td>
									<div class="ui blue button" id="emailCheck" style="height:35px">중복확인</div>
								</td>
								<td>
									<div class="ui left pointing red basic label fluid wrongmsg" id="emailWrongMsg"
									style="display:none;">
	      								유효하지 않은 <br>이메일 입니다!
	      							</div>
								</td>
							</tr>
							
							<tr>
								<td rowspan="3"><b>주소 *</b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="우편번호" name="zipCode" id="zipCode"
										class="mandatory">
									</div>
								</td>
								<td>
									<div class="ui orange button" id="addressSearch" style="height:35px">주소검색</div>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div class="ui fluid input">
										<input type="text" placeholder="기본주소" name="address1" id="address1"
										class="mandatory">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div class="ui fluid input">
										<input type="text" placeholder="상세주소" name="address2" id="address2"
										class="mandatory">
									</div>
								</td>
							</tr>
							<tr>
								<td><b>비상 연락망</b></td>
								<td>
									<select name="subPhone0">
										<option value="skt">SKT</option>
										<option value="kt">KT</option>
										<option value="lg">LG U+</option>
									</select>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="010" name="subPhone1" size="3">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="0000" name="subPhone2" size="4">
									</div>
								</td>
								<td>
									<div class="ui input telInput">
										<input type="tel" placeholder="0000" name="subPhone3" size="4">
									</div>
								</td>
								<td>
									<div class="ui left pointing red basic label fluid wrongmsg" id="phoneWrongMsg2"
									style="display:none;">
	      								숫자만 입력해주세요!
	    							</div>
								</td>
							</tr>
							<tr>
								<td><label style="font-size:0.8em; color:gray">(* : 필수입력)</label></td>
							</tr>
						</table>
					</div> <!-- end of joinArea -->
				</div> <!-- end of row -->
				<br><br>
				<div class="row">
					<div class="col col-lg-2 col-md-2"></div>
					<div class="checkArea col col-lg-8 col-md-8">
						<table id="TnCtable">
							<tr height="45px" style="border-bottom:1px solid lightgray">
								<td colspan="2">
									<input type="checkbox" name="TnC" value="checkAll" id="checkAll">
									<label for="checkAll" style="font-size:1.3em">전체 동의</label>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check1" id="check1">
									<label for="check1">이용약관(필수)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC1" style="height:35px">전체보기</div>
								</td>
							</tr>
							<tr>
								<td>
									<p style="font-size:0.9em; color:gray">본 약관에는 마케팅 정보 수신에 대한 동의에 관한 
									내용이 포함되어 있으며,<br>
									회원은 언제든지 회원정보 수정에서 수신 거부로 변경할 수 있습니다.</p>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check2" id="check2">
									<label for="check2">개인정보 수집 및 이용(필수)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC2" style="height:35px">전체보기</div>
								</td>
							</tr>
							<tr>
								<td width="80%">
									<input type="checkbox" name="TnC" value="check3" id="check3">
									<label for="check3">개인정보 수집 및 이용(선택)</label>
								</td>
								<td width="20%">
									<div class="ui button" id="showTnC3" style="height:35px">전체보기</div>
								</td>
							</tr>
						</table>
					</div> <!-- end of checkArea -->
				</div> <!-- end of row -->
				<br><br><br>
			</form>
			<div class="row btnArea">
				<button class="massive ui button blue" style="width: 200px; height: 80px;" 
				onclick="join();">가입하기</button>
			</div>
			<br><br><br>
		</div> <!-- end of Main -->
		
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
		
	</div>
	<div class="rightArea col-lg-1 col-md-1">
	</div>
	
	<script>
		$(function() {
			//$(".wrongmsg").hide();
		});
		
		//회원가입란 정규표현식
		var koreanCheck = /[^a-z|0-9]/gi;
		var koreanCheck2 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi;
		var blankCheck = /\w+/;
		var engAtLeastOneCheck = /[a-z]+/i;
		var numAtLeastOneCheck = /[0-9]+/;
		var numberCheck = /[^0-9]/;
		$("#userId").change(function() {
			if(koreanCheck.test($(this).val())) {
				$("#idWrongMsg").show();
			}else {
				$("#idWrongMsg").hide();
			}
		});
		$("#userPwd").change(function() {
			var pwdLengthCheck = /\w{6}/;
			if(!pwdLengthCheck.test($(this).val())) {
				$("#pwdWrongMsg").show();
			}else if(koreanCheck2.test($(this).val())) {
				$("#pwdWrongMsg").show();
			}else if(!engAtLeastOneCheck.test($(this).val())) {
				$("#pwdWrongMsg").show();
			}else if(!numAtLeastOneCheck.test($(this).val())) {
				$("#pwdWrongMsg").show();
			}else if($(this).val() == $("#userId").val()) {
				$("#pwdWrongMsg").show();
			}else {
				$("#pwdWrongMsg").hide();
			}
		});
		$("#userPwd2").change(function() {
			if($(this).val() != $("#userPwd").val()) {
				$("#pwdDismatchMsg").show();
			}else {
				$("#pwdDismatchMsg").hide();
			}
		});
		$("#userName").change(function() {
			var nameCheck = /[^가-힣]/g;
			if(nameCheck.test($(this).val())) {
				$("#nameWrongMsg").show();
			}else {
				$("#nameWrongMsg").hide();
			}
		});
		$("#email").change(function() {
			var atCheck = /@+/;
			if(koreanCheck2.test($(this).val())) {
				$("#emailWrongMsg").show();
			}else if(!atCheck.test($(this).val())) {
				$("#emailWrongMsg").show();
			}else {
				$("#emaiWrongMsg").hide();
			}
		});
		$("input[name^=phone]").change(function() {
			if(numberCheck.test($(this).val())) {
				$("#phoneWrongMsg").show();
			}else {
				$("#phoneWrongMsg").hide();
			}
		});
		$("input[name^=subPhone]").change(function() {
			if(numberCheck.test($(this).val())) {
				$("#phoneWrongMsg2").show();
			}else {
				$("#phoneWrongMsg2").hide();
			}
		});
		
		
		//아이디 중복확인
		var idCheckCtn = 0;
		$("#idCheck").click(function() {
			idCheckCtn = 1;
			$.ajax({
				url:"<%= request.getContextPath() %>/idCheck.me",
				data: {userId:$("#userId").val()},
				type:"post",
				success:function(data) {
					if(data == "fail") {
						alert("이미 존재하는 아이디입니다.");
						$("#userId").val("");
					}else {
						alert("사용 가능한 아이디입니다.");
						$("#userPwd").focus();
					}
				}, error:function(data) {
					alert("서버전송실패");
				}
			});
		});
		//이메일 중복확인
		var emailCheckCtn = 0;
		$("#emailCheck").click(function() {
			emailCheckCtn = 1;
			$.ajax({
				url:"<%= request.getContextPath() %>/emailCheck.me",
				data: {email:$("#email").val()},
				type:"post",
				success:function(data) {
					if(data == "fail") {
						alert("이미 가입된 이메일입니다.");
						$("#email").val("");
					}else {
						alert("사용 가능합니다.");
						
					}
				}, error:function(data) {
					alert("서버전송실패");
				}
			});
		});
		
		
		//주소검색 api
		$("#addressSearch").click(function() {
			new daum.Postcode({
		    	oncomplete: function(data) {
		    		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                    document.getElementById("address1").value += "(" + extraAddr + ")";
	                	
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                    document.getElementById("address1").value += "(" + extraAddr + ")";
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("zipCode").value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
		        }
		    }).open();
		});
		
		//약관전체동의체크시
		$("#checkAll").change(function() {
			if($(this).prop("checked")) {
				$("#check1").prop("checked", true);
				$("#check2").prop("checked", true);
				$("#check3").prop("checked", true);
			}else {
				$("#check1").prop("checked", false);
				$("#check2").prop("checked", false);
				$("#check3").prop("checked", false);
			}
		});
		
		
		//회원가입 버튼클릭시
		function join() {
			var blankCtn = 0;
			console.log("초기값 : " + blankCtn);
			$(".mandatory").each(function() {
				if($(this).val() == "") {
					blankCtn++;
				}
			});		
			if(blankCtn != 0) {
				console.log(blankCtn);
				alert("필수입력란을 모두 입력해주세요");
			}else if(idCheckCtn == 0) {
				alert("아이디 중복확인을 해주세요");
			}else if(emailCheckCtn == 0) {	
				alert("이메일 중복확인을 해주세요");
			}else if(!$("#check1").prop("checked") || !$("#check2").prop("checked")) {
				alert("약관에 체크해주세요");
			}else {
				$("#joinForm").submit();
			}
			
			
		}
	</script>
</body>
</html>