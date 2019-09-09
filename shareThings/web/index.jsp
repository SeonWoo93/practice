<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉐어띵스</title>
<style type="text/css">
	#logo:hover {
		cursor:pointer;
	}
	.foot {
		color:gray;
		font-size:0.8em;
	}
	.guideContent {
		color:gray;
		font-size:1.5em;
		width:100%; 
		list-style-type:none; 
		padding:0;
	}
	.guideContent>li {
		padding-bottom:50px;
	}
	.listIcon {
		font-size:1.5em;
		color:#F44A0C ;
	}
    .hidden.menu {
      display: none;
    }

    .masthead.segment {
      min-height: 700px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
    .masthead h1.ui.header {
      margin-top: 2em;
      margin-bottom: 0em;
      font-size: 4em;
      font-weight: normal;
    }
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 8em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 700px) {
      .ui.fixed.menu {
        display: none !important;
      }
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
      .masthead h1.ui.header {
        font-size: 2em;
        margin-top: 1.5em;
      }
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }

</style>
<link rel="stylesheet" type="text/css" href="/st/css/semantic.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/st/js/semantic.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

		// fix menu when passed
		$('.masthead').visibility({
			once : false,
			onBottomPassed : function() {
				$('.fixed.menu').transition('fade in');
			},
			onBottomPassedReverse : function() {
				$('.fixed.menu').transition('fade out');
			}
		});

		// create sidebar and attach to menu open
		$('.ui.sidebar').sidebar('attach events', '.toc.item');

	});
</script>
</head>
<body>

	<!-- Following Menu -->
	<div class="ui large top fixed hidden menu">
		<div class="ui container">
			<a class="active item" style="font-size: 2em;" href="">Home</a> <a
				class="item" style="font-size: 2em;">Work</a> <a class="item"
				style="font-size: 2em;">Company</a> <a class="item"
				style="font-size: 2em;">Careers</a>
			<div class="right menu">
				<div class="right item">
					<a class="ui huge inverted blue button" href="#siteGuide" 
					style="font-size: 2em;">쉐어띵스 이용방법</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Page Contents -->
	<div class="pusher">
		<div class="ui inverted vertical masthead center aligned segment head">

			<div class="ui container">
				<div class="ui large secondary inverted pointing menu">
					<div style="width: 150px;" onclick="location.href='mainLoad.bo'">
						<img src="/st/images/newLogo.PNG" id="logo" width="100%;">
					</div>
					<!-- <a class="active item"  style="font-size:2em;">Home</a> -->
					<a class="item" style="font-size: 2em;">Work</a> <a class="item"
						style="font-size: 2em;">Company</a> <a class="item"
						style="font-size: 2em;">Careers</a>
					<div class="right item">
						<a class="ui huge inverted button" href="#siteGuide" 
						style="font-size: 2em;">쉐어띵스 이용방법</a>
					</div>
				</div>
			</div>

			<div class="ui text container">
				<h1 class="ui inverted header" style="font-size: 70px">
					We <label style="color: #0CB6F4">SHARE</label> <label
						style="color: #F44A0C;">Things</label>!
				</h1>
				<h2>
					나만의 <label style="color: #F44A0C;">소유</label>에서 모두의 <label
						style="color: #0CB6F4; font-size: 1.5em; font-weight: bold">공유</label>로
				</h2>
				<br>
				<br>
				<div class="ui massive green button"
					onclick="location.href='mainLoad.bo'">
					쉐어띵스 입장하기 <i class="right arrow icon"></i>
				</div>
			</div>

		</div>

		<div class="ui placeholder segment" id="siteGuide">
			<div class="ui two column stackable center aligned grid">
				<div class="ui vertical divider">Or</div>
				<div class="middle aligned row">
					<div class="column">
						<div class="ui icon header">
							<h1 style="font-weight:bold;">등록</h1>
							<i class="heart icon"></i> 내 물건 등록하고 나눔으로서 수익 창출!
						</div>
						<br><br><br>
						<div class="" style="margin:0 30px;">
							<ul class="guideContent" >
								<li><i class="archive icon listIcon"></i>안쓰는 물건이 있으신가요?</li>
								<li><i class="camera retro icon listIcon"></i>물건 사진을 상세하게 찍어주세요</li>
								<li><i class="edit icon listIcon"></i>쉐어띵스 사이트에 등록 요청 글을 올려주세요</li>
								<li><i class="shipping fast icon listIcon"></i>심사 후 등록 요청이 승인되면 택배사를 통해 수거를 진행합니다.</li>
								<li><i class="users icon listIcon"></i>신청하신 기간동안 저희 쉐어띵스가 물건을 맡아서</li>
								<li><i class="icon listIcon"></i>필요한 사람에게 빌려주고 수익금을 돌려드립니다.</li>
								<li><i class="won sign icon listIcon"></i>물건이 필요한 사람에게 대여 되는 동안</li>
								<li><i class="icon listIcon"></i>자동으로 쌓이는 수익금을 현금으로 반환하세요!</li>
								<li><i class="shipping fast icon listIcon"></i>등록기간이 만료되면 다시 택배로 물건을 돌려드립니다.</li>
								<li><i class="recycle icon listIcon"></i>이렇게 편한 공유 경제 시작할 준비 되셨나요?</li>
								
							</ul>
						</div>
					</div>
					<div class="column">
						<div class="ui icon header">
							<h1 style="font-weight:bold;">대여</h1>
							<i class="heart outline icon"></i> 사지말고 빌려쓰는 똑똑한 소비!
						</div>
						<br><br><br>
						<div class="" style="margin:0 30px;">
							<ul class="guideContent" >
								<li><i class="question icon listIcon"></i>살까 말까 고민되는 물건이 있으신가요?</li>
								<li><i class="frown outline icon listIcon"></i>사고나면 한번 쓰고 말 것 같아 걱정이 되시나요?</li>
								<li><i class="exclamation icon listIcon"></i>쉐어띵스에서 필요한 물건을 빌려서 사용해보세요</li>
								<li><i class="cube icon listIcon"></i>전자기기, 취미/레저, 패션/뷰티, 유아동, 반려동물까지</li>
								<li><i class="icon listIcon"></i>다양한 상품들을 원하는 기간동안 빌려써보세요.</li>
								<li><i class="pencil alternate icon listIcon"></i>원하는 상품을 선택하고 대여신청을 하시면</li>
								<li><i class="rocket icon listIcon"></i>택배로 물건을 보내드리고 대여 종료일에 다시 수거 택배를 보내드립니다.</li>
								<li><i class="icon listIcon"></i>편하게 사용하고 다시 반납하면 끝!</li>
								<li><i class="gem outline icon listIcon"></i>대여 기록이 쌓이면 자동으로 함께 쌓이는 적립금까지!</li>
								<li><i class="thumbs up icon listIcon"></i>똑똑한 소비하실 준비 되셨나요?</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="ui inverted vertical footer segment">
			<div class="ui container">
				<div
					class="ui stackable inverted divided equal height stackable grid">
					<div class="three wide column">
						<h4 class="ui inverted header">About</h4>
						<div class="ui inverted link list">
							<a href="#" class="item">Sitemap</a> <a href="#" class="item">Contact
								Us</a>
						</div>
					</div>
					<div class="three wide column">
						<h4 class="ui inverted header">Services</h4>
						<div class="ui inverted link list">
							<p class="foot">KH은행 구매 안전 서비스 (채무지급보증)</p>
							<p class="foot">안전거래를 위해 현금 등으로 결제 시,</p>
							<p class="foot">저희 사이트에서 가입한 KH은행의</p>
							구매안전서비스를 이용하실 수 있습니다.
							<p class="foot">
						</p>
							</div>
					</div>
					<div class="seven wide column">
						<h4 class="ui inverted header">(주)쉐어띵스</h4>
						<p class="foot">(주)쉐어띵스는 통신대여중개자로서 거래당사자가 아니며, 등록자가 등록한 상품정보 및
							거래에 대해 (주)쉐어띵스는 일체 책임을 지지 않습니다.</p>
						<p class="foot">사업자등록번호 : 105-87-56305</p>
						<p class="foot">통신대여업신고번호: 제2011-서울마포-1010호 ()</p>
						<p class="foot">(주)쉐어띵스 대표이사 : 최준혁</p>
						<p class="foot">서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층 (우)823-25</p>
						<p class="foot">이용문의: 광고센터 1:1문의 | 법인광고문의:
							aliciakimwa@gmail.com</p>
						<p class="foot">개인정보보호책임자 : 정민지(minji6654@gmail.com)</p>
						<p class="foot">©(주)쉐어띵스. All rights reserved.</p>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>