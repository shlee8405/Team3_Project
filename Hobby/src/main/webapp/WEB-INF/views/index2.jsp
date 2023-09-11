<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="/resources/css/login.css">

<style>
.containerHD {
	justify-content: flex-end;
	display: flex;
	flex-wrap: nowrap;
}

.logo {
	margin-right: auto;
	display: flex;
	align-items: center;
}

.navlinks {
	flex-wrap: nowrap;
}

a {
	white-space: nowrap;
}

@font-face {
	font-family: MBCM;
	src: url(/resources/fonts/MBCM.ttf);
}
@font-face {
	font-family: MBCM2;
	src: url(/resources/fonts/MBCM2.ttf);
}

@font-face {
	font-family: TAEBAEK;
	src: url(/resources/fonts/TAEBAEK.ttf);
}

body, html {
	padding: 0;
	margin: 0;
	height: 100%;
}

.section {
	width: 100%;
	position: relative;
	background-color: white;
	z-index: 2;
	margin-bottom: 2rem;
}

/* The hero image */
.hero-image {
	/* Use "linear-gradient" to add a darken background effect to the image (photographer.jpg). This will make the text easier to read */
	background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.2)),
		/* url("https://st2.depositphotos.com/8573964/12346/i/950/depositphotos_123466770-stock-photo-beach-in-the-morning-sun.jpg"); */
		/* url("https://images.pexels.com/photos/5914157/pexels-photo-5914157.jpeg"); */
		url("https://images.pexels.com/photos/1371798/pexels-photo-1371798.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
	/* Set a specific height */
	height: 70%;
	/* Position and center the image to scale nicely on all screens */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

/* Place text in the middle of the image */
.hero-text {
	font-family: MBCM2;
	text-align: right;
	position: absolute;
	top: 50%;
	left: 65%;
	transform: translate(-50%, -50%);
	color: rgba(255,255,255,0.3);
	font-size:4em;
	width: 50vw;
}
.hero-title {
	font-size:5rem!important;
}

.hero-content{
	font-size:3rem;
}
/* 투명 */
.section.one {
	background: none;
	margin-left: 0;
	display: inline-block;
	padding: 0px 1vw;
}
/* .s1-text-title{
          font-family: MBCM;
          font-size:5em;
        } */
.s1-text {
	display: inline-block;
	margin: 0;
	padding: 0;
	line-height: 1em;
	font-family: MBCM;
	font-size: 10em;
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0.5) 50%,
		black 50%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.s1-text-content {
	font-family: TAEBAEK;
	font-size: 1.5em;
	/* white-space: collapse balance; */
	overflow: hidden;
	text-overflow: ellipsis;
}

.s2-text-title {
	text-align: center;
	font-family: MBCM;
	font-size: 4em;
}

.s2-text-content {
	font-family: TAEBAEK;
	font-size: 1.0em;
}

.section.two {
	background-color: rgba(204, 211, 207, 0.062);
	display: inline-block;
}

.section.three {
	display: inline-block;
	height: auto;
	background-color: white;
	padding: 0px 1vw;
}

.s3-text-title {
	text-align: right;
	font-family: MBCM;
	font-size: 4em;
}

.s3-text-content {
	font-family: TAEBAEK;
	font-size: 1.5em;
	overflow: hidden;
	text-overflow: ellipsis;
}

.section.four {
	display: inline-block;
	background-color: rgba(204, 211, 207, 0.062);
}

.s4-text-title {
	text-align: center;
	font-family: MBCM;
	font-size: 4em;
}

.s4-text-content {
	font-family: TAEBAEK;
	font-size: 1.5em;
	overflow: hidden;
	text-overflow: ellipsis;
}

.section.five {
	display: inline-block;
	background-color: rgba(0, 0, 0, 0.52);
	margin-bottom: 0px;
}

.s5-text-title {
	text-align: center;
	font-family: MBCM;
	font-size: 4em;
}

.s5-text-content {
	font-family: TAEBAEK;
	font-size: 0.5em;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
}

.img {
	filter: grayscale(100%);
	-webkit-filter: grayscale(100%);
}

.img:hover {
	filter: none;
	-webkit-filter: grayscale(0);
}

/* NAVBAR STYLE */
html, body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Navbar section */
.navHD {
	width: 100%;
	height: 65px;
	position: fixed;
	line-height: 65px;
	text-align: center;
	background-color: rgba(4, 4, 4, 0);
	position: fixed;
	top: 0;
	z-index: 3;
}

.navHD, ::after, ::before {
	box-sizing: content-box;
}

.navHD div.logo {
	float: left;
	width: auto;
	height: auto;
	padding-left: 3rem;
}

.navHD div.logo a {
	text-decoration: none;
	color: #fff;
	font-size: 2.5rem;
}

.navHD div.logo a:hover {
	color: #00E676;
}

.navHD div.main_list {
	height: 65px;
	float: right;
}

.navHD div.main_list ul {
	width: 100%;
	height: 65px;
	display: flex;
	list-style: none;
	margin: 0;
	padding: 0;
}

.navHD div.main_list ul li {
	width: auto;
	height: 65px;
	padding: 0;
	padding-right: 3rem;
}

.navHD div.main_list ul li a {
	font-family: MBCM;
	text-decoration: none;
	color: rgba(255, 255, 255, 0.8);
	line-height: 65px;
	font-size: 2.0rem;
}

.affix div.main_list ul li a {
	color: rgba(199, 196, 196, 0.637);
}

.navHD div.main_list ul li a:hover {
	color: gray;
}

/* Home section */
.containerHD {
	justify-content: flex-end;
	display: flex;
	flex-wrap: nowrap;
}

.logo {
	margin-right: auto;
	display: flex;
	align-items: center;
}

.navlinks {
	flex-wrap: nowrap;
}

a {
	white-space: nowrap;
}

.navTrigger {
	display: none;
}

.navHD {
	padding-top: 20px;
	padding-bottom: 20px;
	-webkit-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

/* Media qurey section */
@media screen and (min-width: 768px) and (max-width: 1024px) {
	.container {
		margin: 0;
	}
}

@media screen and (max-width:768px) {
	.navTrigger {
		display: block;
	}
	.navHD div.logo {
		margin-left: 15px;
	}
	.navHD div.main_list {
		width: 100%;
		height: 0;
		overflow: hidden;
	}
	.navHD div.show_list {
		height: auto;
		display: none;
	}
	.navHD div.main_list ul {
		flex-direction: column;
		width: 100%;
		height: 100vh;
		right: 0;
		left: 0;
		bottom: 0;
		background-color: #111;
		/*same background color of navbar*/
		background-position: center top;
	}
	.navHD div.main_list ul li {
		width: 100%;
		text-align: right;
	}
	.navHD div.main_list ul li a {
		text-align: center;
		width: 100%;
		font-size: 3rem;
		padding: 20px;
	}
	.navHD div.media_button {
		display: block;
	}
}

.navTrigger {
	cursor: pointer;
	width: 30px;
	height: 25px;
	margin: auto;
	position: absolute;
	right: 30px;
	top: 0;
	bottom: 0;
}

.navTrigger i {
	background-color: #fff;
	border-radius: 2px;
	content: '';
	display: block;
	width: 100%;
	height: 4px;
}

.navTrigger i:nth-child(1) {
	-webkit-animation: outT 0.8s backwards;
	animation: outT 0.8s backwards;
	-webkit-animation-direction: reverse;
	animation-direction: reverse;
}

.navTrigger i:nth-child(2) {
	margin: 5px 0;
	-webkit-animation: outM 0.8s backwards;
	animation: outM 0.8s backwards;
	-webkit-animation-direction: reverse;
	animation-direction: reverse;
}

.navTrigger i:nth-child(3) {
	-webkit-animation: outBtm 0.8s backwards;
	animation: outBtm 0.8s backwards;
	-webkit-animation-direction: reverse;
	animation-direction: reverse;
}

.navTrigger.active i:nth-child(1) {
	-webkit-animation: inT 0.8s forwards;
	animation: inT 0.8s forwards;
}

.navTrigger.active i:nth-child(2) {
	-webkit-animation: inM 0.8s forwards;
	animation: inM 0.8s forwards;
}

.navTrigger.active i:nth-child(3) {
	-webkit-animation: inBtm 0.8s forwards;
	animation: inBtm 0.8s forwards;
}

@
-webkit-keyframes inM { 50% {
	-webkit-transform: rotate(0deg);
}

100
%
{
-webkit-transform
:
rotate(
45deg
);
}
}
@
keyframes inM { 50% {
	transform: rotate(0deg);
}

100
%
{
transform
:
rotate(
45deg
);
}
}
@
-webkit-keyframes outM { 50% {
	-webkit-transform: rotate(0deg);
}

100
%
{
-webkit-transform
:
rotate(
45deg
);
}
}
@
keyframes outM { 50% {
	transform: rotate(0deg);
}

100
%
{
transform
:
rotate(
45deg
);
}
}
@
-webkit-keyframes inT { 0% {
	-webkit-transform: translateY(0px) rotate(0deg);
}

50
%
{
-webkit-transform
:
translateY(
9px
)
rotate(
0deg
);
}
100
%
{
-webkit-transform
:
translateY(
9px
)
rotate(
135deg
);
}
}
@
keyframes inT { 0% {
	transform: translateY(0px) rotate(0deg);
}

50
%
{
transform
:
translateY(
9px
)
rotate(
0deg
);
}
100
%
{
transform
:
translateY(
9px
)
rotate(
135deg
);
}
}
@
-webkit-keyframes outT { 0% {
	-webkit-transform: translateY(0px) rotate(0deg);
}

50
%
{
-webkit-transform
:
translateY(
9px
)
rotate(
0deg
);
}
100
%
{
-webkit-transform
:
translateY(
9px
)
rotate(
135deg
);
}
}
@
keyframes outT { 0% {
	transform: translateY(0px) rotate(0deg);
}

50
%
{
transform
:
translateY(
9px
)
rotate(
0deg
);
}
100
%
{
transform
:
translateY(
9px
)
rotate(
135deg
);
}
}
@
-webkit-keyframes inBtm { 0% {
	-webkit-transform: translateY(0px) rotate(0deg);
}

50
%
{
-webkit-transform
:
translateY(
-9px
)
rotate(
0deg
);
}
100
%
{
-webkit-transform
:
translateY(
-9px
)
rotate(
135deg
);
}
}
@
keyframes inBtm { 0% {
	transform: translateY(0px) rotate(0deg);
}

50
%
{
transform
:
translateY(
-9px
)
rotate(
0deg
);
}
100
%
{
transform
:
translateY(
-9px
)
rotate(
135deg
);
}
}
@
-webkit-keyframes outBtm { 0% {
	-webkit-transform: translateY(0px) rotate(0deg);
}

50
%
{
-webkit-transform
:
translateY(
-9px
)
rotate(
0deg
);
}
100
%
{
-webkit-transform
:
translateY(
-9px
)
rotate(
135deg
);
}
}
@
keyframes outBtm { 0% {
	transform: translateY(0px) rotate(0deg);
}

50
%
{
transform
:
translateY(
-9px
)
rotate(
0deg
);
}
100
%
{
transform
:
translateY(
-9px
)
rotate(
135deg
);
}
}
.affix {
	padding: 0;
	background-color: black;
	opacity: 100%;
	z-index: 8;
}

.myH2 {
	text-align: center;
	font-size: 4rem;
}

.myP {
	text-align: justify;
	padding-left: 15%;
	padding-right: 15%;
	font-size: 20px;
}

@media all and (max-width:700px) {
	.myP {
		padding: 2%;
	}
}
/* NAVBAR STYLE END */

/* transform */
.s1-text {
	transform: translateX(30px) translateY(0px);
}
</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
	$('.navTrigger').click(function() {
		$(this).toggleClass('active');
		console.log("Clicked menu");
		$("#mainListDiv").toggleClass("show_list");
		$("#mainListDiv").fadeIn();
	});
</script>

<script type="text/javascript">
	/* 로그인 모달 스크립트 */
	$(document)
			.ready(
					function() {
						$("#idRecoveryForm")
								.submit(
										function(event) {
											event.preventDefault(); // Prevent the default form submission

											// Collect form data
											var formData = "email="
													+ encodeURIComponent($(
															"#email").val());
											// Use AJAX to check email availability first
											$
													.ajax({
														url : "/forgotId.do", // Endpoint for 아이디찾기
														type : "POST",
														data : formData,
														dataType : "text", // Response data type
														contentType : "application/x-www-form-urlencoded; charset=UTF-8",
														success : function(
																response) {
															console
																	.log(
																			"Response:",
																			response); // Add this line for debugging
															if (response) {
																// Handle 아이디찾기 success
																var foundId = response;
																alert("아이디를 찾았습니다: "
																		+ response);
																$(
																		"#idRecoveryModal")
																		.modal(
																				"hide"); // Close the modal
															} else {
																// Handle 아이디찾기 error
																alert("아이디를 찾을 수 없습니다. 다시 시도해주세요.");
															}
														},
														error : function(error) {
															console.log(
																	"Error:",
																	error);
															// Handle 아이디찾기 error if needed
														}
													});
										});
					});
	$(document)
			.ready(
					function() {
						$("#pwdRecoveryForm")
								.submit(
										function(event) {
											event.preventDefault(); // Prevent the default form submission

											// Collect form data
											var formData = "email="
													+ encodeURIComponent($(
															"#email").val());

											// Use AJAX to initiate password recovery
											$
													.ajax({
														url : "/forgotPwd.do", // Endpoint for 비밀번호찾기
														type : "POST",
														data : formData,
														dataType : "text", // Response data type
														contentType : "application/x-www-form-urlencoded; charset=UTF-8",
														success : function(
																response) {
															console
																	.log(
																			"Response:",
																			response);
															$(
																	"#pwdRecoveryResult")
																	.html(
																			response); // Display the response
														},
														error : function(error) {
															console.log(
																	"Error:",
																	error);
															// Handle 비밀번호찾기 error if needed
														}
													});
										});
					});
</script>

<script type="text/javascript">
	/*회원가입 모달 스크립트*/
	function go_login() {
		location.href = "/login.do"
	}
	// 추가된 함수: 생일 형식 유효성 검사
	function validateBirthday() {
		var birthdayInput = document.getElementById("u_birthday");
		var birthdayValue = birthdayInput.value;

		// 생일을 Date 객체로 변환하여 현재 날짜와 비교
		var selectedDate = new Date(birthdayValue);
		var currentDate = new Date();

		if (isNaN(selectedDate.getTime())) {
			// 날짜가 유효하지 않은 경우
			alert("유효하지 않은 날짜입니다.");
			birthdayInput.value = ""; // 입력값 초기화
			return;
		}

		if (selectedDate > currentDate) {
			// 미래의 날짜인 경우
			alert("미래의 날짜는 선택할 수 없습니다.");
			birthdayInput.value = ""; // 입력값 초기화
			return;
		}
	}

	// 추가된 함수: 핸드폰 번호 형식 유효성 검사
	function validatePhoneNumber() {
		var phoneNumberInput = document.getElementById("u_phone");
		var phoneNumberValue = phoneNumberInput.value;

		// 숫자와 하이픈(-)을 제외한 모든 문자 제거
		var cleanPhoneNumber = phoneNumberValue.replace(/[^\d-]/g, "");

		// 하이픈(-)을 기준으로 분리
		var phoneNumberParts = cleanPhoneNumber.split("-");

		// 형식 체크: 숫자 3-4-4 형태인지 검사
		if (phoneNumberParts.length !== 3 || phoneNumberParts[0].length !== 3
				|| phoneNumberParts[1].length !== 4
				|| phoneNumberParts[2].length !== 4) {
			alert("올바른 핸드폰 번호 형식이 아닙니다.");
			phoneNumberInput.value = ""; // 입력값 초기화
			return;
		}

		// 유효한 핸드폰 번호
		// 이곳에서 필요한 추가 동작을 수행할 수 있습니다.
	}
	function checkAgreement() {
		var agreeCheckbox = document.getElementById("agreeCheckbox");
		var submitButton = document.getElementById("submitButton"); // 예시: 버튼 요소의 ID

		if (agreeCheckbox.checked) {
			// 체크되었을 때 수행할 동작
			submitButton.disabled = false; // 버튼을 활성화
		} else {
			// 해제되었을 때 수행할 동작
			submitButton.disabled = true; // 버튼을 비활성화
		}
	}
	function validateForm() {
		var agreeCheckbox = document.getElementById("agreeCheckbox");

		if (!agreeCheckbox.checked) {
			alert("이용약관에 동의해야 회원가입이 가능합니다.");
			return false; // Prevent form submission
		}

		return true; // Allow form submission
	}

	function validateForm() {
		var agreeCheckbox = document.getElementById("agreeCheckbox");
		var emailInput = document.getElementById("u_email");
		var idInput = document.getElementById("u_id");
		var pwInput = document.getElementById("upwd1");
		var confirmPwInput = document.getElementById("upwd2");
		var nicknameInput = document.getElementById("u_nickname");
		var birthdayInput = document.getElementById("u_birthday");
		var phoneInput = document.getElementById("u_phone");
		var nameInput = document.getElementById("u_name");

		if (emailInput.value === "" || idInput.value === ""
				|| pwInput.value === "" || confirmPwInput.value === ""
				|| nicknameInput.value === "" || birthdayInput.value === ""
				|| phoneInput.value === "" || nameInput.value === "") {
			alert("모든 필수 항목을 입력해주세요.");
			return false;
		}

		// You can add additional validation logic here if needed

		return true;
	}

	/* 이메일 u_email 중복확인 기능 jquery */
	$(document)
			.ready(
					function() {
						$("#emailBtn").click(
								function() {
									var email = $('#u_email').val();
									alert(email);
									console.log(email)
									$.ajax({
										url : '/emailCheck.do', // 중복확인을 처리하는 서버 URL (적절히 변경 필요)
										type : 'post', // POST 방식으로 요청
										data : email, // 서버로 전달할 데이터
										success : function(result) {
											if (result === "available") {
												$('#emailDupCheckMsg').text(
														"사용 가능한 이메일입니다.").css(
														"color", "green");
											} else if (result === "duplicate") {
												$('#emailDupCheckMsg').text(
														"이미 사용 중인 이메일입니다.")
														.css("color", "red");
											}
										},
										error : function() {
											$('#emailDupCheckMsg').text(
													"에러가 발생했습니다.").css("color",
													"red");
										}
									});
								});

						/* 아이디 u_id 중복확인 기능 jquery */
						$(document)
								.ready(
										function() {
											$("#idBtn")
													.click(
															function() {
																var id = $(
																		'#u_id')
																		.val();
																alert(id);
																console.log(id)
																$
																		.ajax({
																			url : '/idCheck.do', // 아이디 중복확인을 처리하는 서버 URL (적절히 변경 필요)
																			type : 'post', // POST 방식으로 요청
																			data : id, // 서버로 전달할 데이터
																			success : function(
																					result) {
																				if (result === "available") {
																					$(
																							'#chkIdMessage')
																							.text(
																									"사용 가능한 아이디입니다.")
																							.css(
																									"color",
																									"green");
																				} else if (result === "duplicate") {
																					$(
																							'#chkIdMessage')
																							.text(
																									"이미 사용 중인 아이디입니다.")
																							.css(
																									"color",
																									"red");
																				}
																			},
																			error : function() {
																				$(
																						'#chkIdMessage')
																						.text(
																								"에러가 발생했습니다.")
																						.css(
																								"color",
																								"red");
																			}
																		});
															});
										});
					});
	var formData = "email=" + encodeURIComponent(emailValue); // emailValue는 이메일 입력 필드 값
</script>


<body>

	<!-- NAVBAR -->

	<nav class="navHD">
		<div class="containerHD">
			<div class="logo">
				<a href="/home.do"><img src="/resources/images/logo3.png"
					style="width: 200px; position: relative; top: -25px; margin: 0;"></a>
			</div>
			<div id="mainListDiv" class="main_list">
				<ul class="navlinks">
					<li><a href="/checkSession.do"
						style="text-family: sans-seriff; font-size: 1rem;">sysout
							sessionIdx</a></li>

					<li><a href="/campMain.do">/캠핑장.do</a></li>
					<li><a href="/groupList.do">/캠핑모임.do</a></li>

					<%
					String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
					String adminChecker = (String) request.getSession().getServletContext().getAttribute("adminChecker");
					%>
				
					
					<%
					if (u_idx != null && !u_idx.isEmpty() && adminChecker==null) {
					%>
					<li><a href="/myPagemain.do">/마이페이지.do</a></li>
					<li><a href="/cusSer.do">/고객센터.do</a></li>
					<%
					}
					%>
		
					<%
					if (adminChecker != null){
					%>
					<li><a href="/adminHome.do">/관리자.do</a></li>
					<%
					}
					%>
					
					<%
					if(u_idx != null && !u_idx.isEmpty()) {
					%>
					<li><a onclick="logout()">/로그아웃.do</a></li>
					<%
					}
					%>
					<% if(u_idx == null) { %>
				
					<li><a  data-bs-toggle="modal" data-bs-target="#exampleModal">/로그인.do</a></li> <!-- 로그인 모달 버튼 -->
					<% } %>
					
				</ul>
			</div>

		</div>
	</nav>
	<script>
		<%
		String kakaoSession = (String) request.getSession().getServletContext().getAttribute("kakaoSession");
		%>

		function logout() {
			<% if(kakaoSession!=null){ %>
				kakaoLogout();
				location.href="/logOut.do";
			<% }else{%>
				alert("hihi2");
				location.href="/logOut.do";
			<%}%>
		}					
	</script>
	<!-- Jquery needed -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- Function used to shrink nav bar removing paddings and adding black background -->
	<script>
		$(window).scroll(function() {
			if ($(document).scrollTop() > 50) {
				$('.navHD').addClass('affix');
				console.log("OK");
			} else {
				$('.navHD').removeClass('affix');
			}

			var w = $(window).scrollTop();
			var f = "translateX(" + w * 0.20 + "px)";
			console.log(w);
			$('.s1-text').css({
				transform : f
			});
		});
	</script>

	<!-- NAVBAR END -->



	<!-- 히어로 이미지 -->
	<div class="hero-image">
		<div class="hero-text">
			<p class="hero-title">별드림캠핑장</p>
			<p class="hero-content">경기도 가평군 가평읍 개곡리 198-1</p>
		</div>
	</div>

	<!-- 소개글 -->
	<div class="section one ">
		<div class="row" style="left: 10%; right: 10%; top: 5%; z-index: 9;">
			<div class="s1-text-title" style="translate: 0px -50%;">

				<p class="s1-text">/CAMP.do</p>
			</div>
			<div class="s1-text-content">국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이
				체포 또는 구금되지 아니한다. 중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을
				제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다. 형사피의자 또는
				형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에
				정당한 보상을 청구할 수 있다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수
				있다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 국무총리 또는
				행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</div>
		</div>
	</div>

	<!-- 두번째 색션 -->
	<div class="section two  w-100 ">
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="s2-text-title">/요즘 핫한 곳으로.go!</div>
			<div class="s1-text-content">국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이
				체포 또는 구금되지 아니한다. 중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을
				제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다. 형사피의자 또는
				형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에
				정당한 보상을 청구할 수 있다.</div>
			<div class="row">
				<img class="img" src="/resources/images/beach01.jpg" alt="img1"
					width="500px" height="500px"
					style="width: 500px; object-fit: cover; position: relative; margin-left: 11.5vw; margin-top: 2%; border-radius: 1%">
				<img class="img" src="/resources/images/beach01.jpg" alt="img1"
					width="500px" height="500px"
					style="width: 500px; object-fit: cover; position: relative; margin-left: 2vw; margin-top: 5%; border-radius: 4%">
			</div>
			<div class="row">
				<img class="img" src="/resources/images/beach01.jpg" alt="img1"
					width="500px" height="500px"
					style="width: 500px; object-fit: cover; position: relative; margin-left: 11vw; margin-top: 5%; border-radius: 20%;">
				<img class="img" src="/resources/images/beach01.jpg" alt="img1"
					width="500px" height="500px"
					style="width: 500px; object-fit: cover; position: relative; margin-left: 3vw; margin-top: 16vh">
			</div>

		</div>
	</div>

	<!-- 세번째 색션 -->
	<div class="section three">
		<div class="row" style="left: 10%; right: 10%; top: 5%; z-index: 9;">
			<div class="s3-text-title">/CAMPing 의 이유.do</div>
			<div class="s3-text-content">국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이
				체포 또는 구금되지 아니한다. 중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을
				제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다. 형사피의자 또는
				형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에
				정당한 보상을 청구할 수 있다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수
				있다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 국무총리 또는
				행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</div>
		</div>
	</div>

	<!-- 네번째 색션 -->
	<div class="section four">
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="s4-text-title">/캠핑, together.do</div>
			<div class="s4-text-content">국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이
				체포 또는 구금되지 아니한다. 중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을
				제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다. 형사피의자 또는
				형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에
				정당한 보상을 청구할 수 있다. 대법원에 대법관을 둔다. 다만, 법률이 정하는 바에 의하여 대법관이 아닌 법관을 둘 수
				있다. 여자의 근로는 특별한 보호를 받으며, 고용·임금 및 근로조건에 있어서 부당한 차별을 받지 아니한다. 국무총리 또는
				행정각부의 장은 소관사무에 관하여 법률이나 대통령령의 위임 또는 직권으로 총리령 또는 부령을 발할 수 있다.</div>
		</div>
	</div>

	<!-- 푸터 색션 -->
	<div class="section five">
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="s5-text-title">/푸터.do</div>
			<div class="s5-text-content">국회의원은 현행범인인 경우를 제외하고는 회기중 국회의 동의없이
				체포 또는 구금되지 아니한다. 중앙선거관리위원회는 법령의 범위안에서 선거관리·국민투표관리 또는 정당사무에 관한 규칙을
				제정할 수 있으며, 법률에 저촉되지 아니하는 범위안에서 내부규율에 관한 규칙을 제정할 수 있다. 형사피의자 또는
				형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에
				정당한 보상을 청구할 수 있다.</div>
		</div>
	</div>







	<!-- 로그인 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container">

						<form action="/login.do" method="post">
							<div class="login-modal login container ms-0 me-0">
								<div class="row">
									<h3
										style="font-size: 50px; font-family: 'Noto Sans KR', sans-serif;">/캠핑.DO</h3>
								</div>
								<!--이메일 입력-->
								<div class="u_id  hiddenholder">
								
									<h4 style="font-family: 'Noto Sans KR', sans-serif;">아이디</h4>
									<input type="text" name="u_id" class="pos"
										placeholder="ID(아이디)">
								</div>
								<!--비밀번호 입력-->
								<div class="u_pw">
									<h4 style="font-family: 'Noto Sans KR', sans-serif;">비밀번호</h4>
									<input type="password" name="u_pw" class="pos"
										placeholder="비밀번호">
								</div>
								<!--로그인 버튼-->
								<div class="submit">
									<input style="font-family: 'Noto Sans KR', sans-serif;"
										type="submit" value="로그인">
								</div>
								<br>
								<div class="loginmenu">
									<!--아이디 찾기-->
									<div class="schid">
										<c:url var="findId" value="/IdRecovery.do" />
										<a href="#" style="font-family: 'Noto Sans KR', sans-serif;"
											data-bs-toggle="modal" data-bs-target="#idRecoveryModal">
											아이디찾기 </a>
									</div>
									<div class="modal-body">
										<div id="idRecoveryContent"></div>
									</div>
									<span style="margin-top: 8px;">|</span>
									<!--비밀번호 찾기-->
									<div class="schpw">
										<c:url var="findPwd" value="/PwdRecovery.do" />
										<a href="#" style="font-family: 'Noto Sans KR', sans-serif;"
											data-bs-toggle="modal" data-bs-target="#pwdRecoveryModal">
											비밀번호찾기 </a>
									</div>
									<!--비밀번호 찾기-->
									<span style="margin-top: 8px;">|</span>
									<div class="schpw">
										<c:url var="findPwd" value="/PwdRecovery.do" />
											<!-- TODO -->
											<a href="/signup.do" style="font-family: 'Noto Sans KR', sans-serif;">
											회원가입 </a>
									</div>
								</div>

								<br>

								<!--카카오 로그인 -->
								<div class="login_api" style="text-align: center;">
									<a href="javascript:void(0)" id="kakaoLoginBtn"><img
										src="resources/images/kakao_login_btn.png"
										style="width: 100%; height: 50px;"></a>
									<div id="naver_id_login" style="margin-top: 10px;"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 스크립트 KAKAO / NAVER -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('c6915a815f664f1b0e24428d4202b72f'); // Initialize Kakao SDK with your API key
		
		//root url 일때에도 /home.do 보내기
		var url = window.location.pathname;
		if (url=='/') {
			url = '/home.do'
		}
		$( ".hiddenholder" ).append( "<input type='hidden' value='" +url + "' name='url'/>" ); 
		// Attach event listener to Kakao login button
		document.getElementById('kakaoLoginBtn').addEventListener('click',
				function() {
						kakaoLogin();
				});

		// Kakao login function
		function kakaoLogin() {
			Kakao.Auth
					.login({
						success : function(response) {
							Kakao.API
									.request({
										url : '/v2/user/me',
										success : function(response) {
											console.log("kakao response is " + response);
											console.log("kakao response id is " + response.id);
											response.url = url;
											console.log(response)
											$
													.ajax({
														url : '/kakaoLogin.do', // 중복확인을 처리하는 서버 URL (적절히 변경 필요)
														type : 'post', // POST 방식으로 요청
														contentType : 'application/json; charset=utf-8',
														data : JSON.stringify(response), // 서버로 전달할 데이터
														success : function() {
															window.location.reload();
														},
														error : function(error) {
															console.log(error);
															window.location.reload();
														}
													});
										},
										fail : function(error) {
											console.log("kakao login error is "+ error);
										},
									});
						},
						fail : function(error) {
							console.log(error);
						},
					});
		}

		// Kakao logout function
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log("kakao logout response is " +response);
					},
					fail : function(error) {
						console.log("kakao logout error is " + error);
					},
				});
				Kakao.Auth.setAccessToken(undefined);
			}
		}
		
	
		</script>
	<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		
	<!-- 네이버 로그인 버튼 노출 영역 -->
	<div id="naver_id_login"></div>
	<!-- //네이버 로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("64LV1RLj1gi5COZg0EVh",
				"http://localhost:8090/home.do");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 70, 70);
		naver_id_login.setDomain("http://localhost:8090");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
	<script type="text/javascript">
		// 접근 토큰 값 출력	
		if (naver_id_login != null) {

			// 네이버 사용자 프로필 조회
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			function naverSignInCallback() {
				alert(naver_id_login.getProfileData('email'));
				alert(naver_id_login.getProfileData('nickname'));
				alert(naver_id_login.getProfileData('age'));
			}
		}
	</script>

	<!-- 로그인 모달 - > 아이디찾기 & 이메일 찾기 -->
	<div class="modal fade" id="idRecoveryModal" tabindex="-1"
		aria-labelledby="idRecoveryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="idRecoveryModalLabel">아이디 찾기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Input fields for 아이디찾기 -->
					<form id="idRecoveryForm">
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="이메일을 입력하세요">
						</div>
						<!-- Add more input fields if needed -->

						<button type="submit" class="btn btn-primary">아이디 찾기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾기 모달 -->
	<div class="modal fade" id="pwdRecoveryModal" tabindex="-1"
		aria-labelledby="pwdRecoveryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="pwdRecoveryModalLabel">비밀번호 찾기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- Input fields for 비밀번호찾기 -->
					<form id="pwdRecoveryForm">
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label> <input
								type="email" class="form-control" id="email" name="email"
								placeholder="이메일을 입력하세요">
						</div>
						<!-- Add more input fields if needed -->
						<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
					</form>
					<!-- 결과 출력 영역 -->
					<div id="pwdRecoveryResult"></div>
				</div>
			</div>
		</div>
	</div>

	

	
	





</body>
</html>
