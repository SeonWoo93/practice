<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.product.model.vo.*, java.util.*, java.text.DecimalFormat"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스-장바구니</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.header {
		width:100%;
		background:white;
	}
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
	.productTitleArea {
		min-height:300px;
	}
	img {
	  vertical-align: middle;
	  max-width:100%;
	}
	.productImg {
	  position: relative;
	  align:center;
	  border:1px solid lightgray;
	}
	.imgSlides {
	  display:none;
	  width:100%;
	  height:400px;
	  align:center;
	}
	.cursor {
	  cursor: pointer;
	}
	.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: orange;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	.prev {
		left:0;
	}
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	  color:white;
	}
	.imgListArea {
		background-color: rgba(0, 0, 0, 0.8);
		padding:10px 5px 10px 5px;
	}
	.imgList {
		padding:5px;
	}
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
 	.subImages {
	  opacity: 0.8;
	}
	.active, .subImages:hover {
	  opacity: 1;
	}
	.titleArea {
		padding:0 0 0 30px !important;
		height:400px;
	}
	.titleBlock, .sellerBlock {
		 border:1px solid lightgray;
		 padding:10px;
	}
	.datePicker {
		width:50%;
	}
	#addCartBtn, #lendBtn {
		height:50px;
		font-size:1.5em;
	}
	.QnAInputArea, .QnAListArea, .reviewInputArea, .reviewListArea {
		padding:15px;
	}
	.QnATitle {
		/* display:table-cell;
		vertical-align:middle; */
		width:100%;
		height:40px;
		margin:0 !important;
	}
	/* .QnATitle>div {
		display:table-cell;
	} */
	
	.listimg{width:30%;}
	.pdtlist {
		text-align:center;
	}
	.devlist {
		text-align:center;
		border:1px solid lightgray;
	}
	.paywon {
		color:#F44A0C;
		font-weight:bold;
	}
	.firsttd{
		border-right:1px solid lightgray;
	}
</style>
</head>
<body>
	<div class="leftArea col col-lg-1 col-md-1">
	</div>
	<div class="pageWrapper col col-lg-10 col-md-10">
		<!-- 헤더 -->
		<div class="header">
			<%@ include file="../common/header.jsp"%>
		</div>


		<!-- 메인바디 -->
		<div class="main">

			<div class="title" style="text-align:center;">
				<img src="/st/resource/img/cart/cart.png" width="15%;" style="text-align:center; margin-bottom:-20px;">
				<h2 align="center" style="padding-bottom:0px; font-weight:bold;">주문서 작성</h2>
			</div>
			
			<div class="payprocess" style="text-align:center;">
				<img src="/st/resource/img/payprocess3.png" width="70%;" style="text-align:center;">
				<hr>
			</div>
			
			
			<hr>
			
			<table align=center width="100%;" class="pdtlist">
				<tr>
					<td colspan=8 width="100%" align="left" style="border:1px solid lightgray; padding:5px; font-weight:bold; background:#ececec;">결제 상품 리스트</td>
				</tr>
					<tr> <td>&nbsp;</td></tr>
				<tr style="border:1px solid lightgray; padding:5px; margin:100px 100px; background:#0CB6F4; color:white;">
					<td width="10%;">
						<input type="checkbox">
					</td>
					<td width="20%;">상품사진</td>
					<td width="20%;">상품정보</td>
					<td width="15%;">대여기간</td>
					<td width="10%;">대여비용</td>
					<td width="10%;">배송비</td>
					<td width="10%;">보증금</td>
					<td width="15%;">상태</td>
				</tr>
				<% int totalPrice = 0; int dlprice = 0; int price = 0; int depo = 0;%>
				<%for(Product p : list) {%>
				<tr style="text-align:center; height:100px; border-bottom:1px solid gray;" class="ctlist">
					<td style="display:none;"><%= p.getCtgId() %></td>
					<td><input type="checkbox" class="check" checked></td>
					<td><img alt="" src="/st/attach_upload/<%= p.getAsHistory()%>" height="100px" width="auto"></td>
					<td><%= p.getModel() %></td>
					<td><%= p.getpStartDate() %> ~ <%= p.getpEndDate() %>
					
					<%
					double period = Math.ceil((p.getpEndDate().getTime() - p.getpStartDate().getTime() + 1) / (1000 * 60 * 60 * 24));
					int ju = (int)((period) / 7) + 1;
					%>
					
					</td>
					<td><%= ju * p.getPrice()%> 원<% totalPrice += (ju * p.getPrice() + 2500); price += ju * p.getPrice();%></td>
					<td>2,500<% dlprice += 2500; %></td>
					<td><%= p.getDeposite() %> 원 <% depo = p.getDeposite(); totalPrice += depo;%></td>
					<td><% if(p.getSid().equals("Y")) {%> 대여가능 <% }else { %> 대여불가 <%} %></td>
					<td><% if(p.getSid().equals("등록 요청")) { %> <button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none;">취소</button><%}else{} %> </td>
				</tr>
				<%} %>
				
				
				
			</table>
			
			<hr>
			
			<table width="100%" align="center" class="pdtlist">
				<tr>
					<td colspan=7 width="100%" align="left" style="border:1px solid lightgray; padding:5px; font-weight:bold; background:#ececec;">배송지 정보</td>
				</tr>
					<tr> <td class="firsttd">&nbsp;</td></tr>
			</table>
			
			<table width="100%" align="center" class="devlist">
				<tr><td colspan=4 style="margin-top:20px;">&nbsp;</td></tr>
				<tr style="margin-bottom:50px;">
					<td width="10%;" class="firsttd">배송지 선택</td>
					<td style="border-right:1px solid lightgray;" colspan=2>
						<input type="radio" id="defaultadd" checked> 기본 배송지
					
					</td>
					<td colspan=2>
						<input type="radio" id="newadd" > 새로운 배송지
					</td>
				</tr>
				<tr> <td class="firsttd">&nbsp;</td></tr>
				<tr>
					<td >수령인</td>
					<td colspan=4 width="50%">
					<div class="ui fluid input">
					<input type="text" style="width:100%;" placeholder="수령인" name="dlName" id="dlName" value="<%= loginUser.getUserName()%>">
					</div>
					</td>
					
				</tr>
				<tr>
				<%
					String add[] = loginUser.getAddress().split("[|]");
					String zipCode =  add[0];
					String address1 = add[1];
					String address2 = add[2];%>
								<td rowspan="3"><b>주소 *</b></td>
								<td colspan="2">
									<div class="ui fluid input">
										<input type="text" placeholder="우편번호" name="zipCode" value="<%= zipCode %>" id="zipCode"
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
										class="mandatory"  value="<%= address1 %>">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<div class="ui fluid input">
										<input type="text" placeholder="상세주소" name="address2" id="address2"
										class="mandatory"  value="<%= address2 %>">
									</div>
								</td>
							</tr>
							
					<tr>
					<td >휴대전화</td>
					<td colspan=4 width="50%">
					<div class="ui fluid input">
					<input type="text" style="width:100%;" placeholder="휴대전화" name="Phone" id="Phone" value="<%= loginUser.getPhone()%>">
					</div>
					</td>
					
				</tr>
				<tr>
					<td >번호(비상연락망)</td>
					<td colspan=4 width="50%">
					<div class="ui fluid input">
					<% if(loginUser.getSubPhone() != null) { %> <input type="text" style="width:100%;" placeholder="휴대전화" name="dlPhone" id="dlPhone"> <% } else { %>
					<input type="text" style="width:100%;" placeholder="비상 연락망" name="dlPhone" id="dlPhone"> <%} %>
					</div>
					</td>
					
				</tr>
				<tr>
					<td >배송 메세지</td>
					<td colspan=4 width="50%">
					<div class="ui fluid input">
					<textarea  style="width:100%; margin-top:10px; margin-bottom:20px; border:1px solid lightgray;" placeholder="배송 메세지를 적어주세요." cols=15 rows=3 name="Phone" id="Phone"></textarea>
					</div>
					</td>
					
				</tr>
				
			</table>
			
			<hr>
			
			<table width="100%" align="center" class="pdtlist">
				<tr>
					<td colspan=7 width="100%" align="left" style="border:1px solid lightgray; padding:5px; font-weight:bold; background:#ececec;">적립 및 할인</td>
				</tr>
			</table>
			<table width="100%" align="center" class="pdtlist" style="border:1px solid lightgray;">
				
					<tr> <td colspan=2>&nbsp;</td></tr>
					
					<tr>
						<td>적립금</td>
						<td style="float:left;"><input type="text" value="<%= loginUser.getProfits()%>">원 <label style="width:50%;" id="point">사용가능한 적립금(<%= loginUser.getProfits() %>)</label></td>
					</tr>
					<tr> <td colspan=2>&nbsp;</td></tr>
			</table>
			<%
			DecimalFormat form = new DecimalFormat("#,###"); 
			 // 천단위로 콤마가 찍힙니다. 
			totalPrice -= loginUser.getProfits();
			%>
			<p style="display:none;"><%= totalPrice %></p>
			<h1 align="center"> 최종 결제 금액 : <label id="totalprice"><%= form.format(totalPrice) %></label> 원</h1>
			
			<div style="margin:50px;" align="center">
				<button style="background:#ececec; color:black; text-decoration:none; border-radius:10px; border:none; height:50px; width:120px;">이전</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button style="background:#0CB6F4; color:white; text-decoration:none; border-radius:10px; border:none; height:50px; width:120px;" onclick="gopay();">선택 상품 결제</button><br><br>
			
			</div>
			
		</div> <!-- end of 메인바디 -->

		<!-- 푸터 -->
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>

	</div>
	<div class="rightArea col col-lg-1 col-md-1">
	</div>
	
	<script>
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
	})
	</script>

	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>  </script>
<script>
function gopay(){
	IMP.init('imp41924715');

	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '쉐어띵스 상품 결제',
	    amount : <%-- <%= totalPrice %> --%>100, //판매 가격
	    buyer_email : '<%= loginUser.getEmail()%>',
	    buyer_name : '<%= loginUser.getUserName()%>',
	    buyer_tel : '<%= loginUser.getPhone()%>',
	    buyer_addr : '<%= loginUser.getAddress()%>',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        var price = rsp.paid_amount;
	        var applynum = rsp.apply_num;
	        var status = new Array();
			$(".ctlist").each(function() {
				if($(this).find(".check").is(":checked")) {	
					console.log($(this).find("td").eq(0).text());
					status.push($(this).find("td").eq(0).text());
				}
			});
	        
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
			location = "/st/paycomplete.rt?status=" + status + "&applynum=" + applynum + "&price=" +price;
	        console.log(rsp.apply_num);
	        


	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    /* alert(msg); */
	});
}
	

</script>
	<script>
		$("#point").change(function(){
			var pointinsert = $(this).val();
			console.log(pointinsert);
			$("#totalprice").html("<%= totalPrice%>");
		})
	</script>
	
</body>
</html>








