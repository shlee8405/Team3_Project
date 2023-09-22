<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link rel="stylesheet" href="/resources/css/bonfire.css">

<style>


.fa {
  padding: 20px;
  font-size: 30px;
  width: 60px;
  height:60px;
  text-align: center;
  text-decoration: none;
  margin: 10px 10px;
}
.fa:hover {
    opacity: 0.7;
}
.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-twitter {
  background: #55ACEE;
  color: white;
}

.fa-google {
  background: #dd4b39;
  color: white;
}

.waviy {
  position: relative;
  -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
}
.waviy span {
  position: relative;
  display: inline-block;
  color: #fff;
  animation: waviy 3s infinite;
  animation-delay: calc(.1s * var(--i));
  
}
@keyframes waviy {
  0%,40%,100% {
    transform: translateY(0)
  }
  20% {
    transform: translateY(-20px)
  }
}

#waviytitle {
	color:black;
    text-align: center;
    font-family: MBCM;
    font-size: 1em;
}






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
.eublink {
animation: blinker 1.5s linear infinite;
}
@keyframes blinker {
50%{
	color:rgba(255, 106, 98, 0.28);
	font-size:100%;
}
}
.section {
	width: 100%;
	position: relative;
	background-color: white;
	z-index: 2;
	margin-bottom: 2rem;
}
 .d-block {
   object-fit:cover;
	width:100%;
	transform: translatey(-40%)
  }

 
#carouselExampleIndicators {
	height: 70%;
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
	cursor:pointer;
  	transition: font-size ease-in-out .1s;
}

.s2-text-title:hover {
	font-size: 4.5em;
}
.s2-text-title:hover #waviytitle {
	color:gray;
}

.s2-text-content {
	font-family: TAEBAEK;
	font-size: 1.5em;
	/* white-space: collapse balance; */
	overflow: hidden;
	text-overflow: ellipsis;
	width:auto;
	margin:auto;
}

.section.two {
	background-color: rgba(204, 211, 207, 0.062);
	display: inline-block;
}

.section.three {
	height: 600px;
	padding: 0px 1vw;
	background: none;
	margin-left: 0;
	display: inline-block;
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
	text-align: end;
}

.section.four {
	display: inline-block;
	background-color: rgba(204, 211, 207, 0.062);
	height:auto;
}

.s4-text-title {
	text-align: center;
	font-family: MBCM;
	font-size: 4em;
	cursor:pointer;
  	transition: font-size ease-in-out .1s;
}
.s4-text-title:hover {
	font-size: 4.5em;
}

.s4-text-content {
		font-family: TAEBAEK;
	font-size: 1.5em;
	/* white-space: collapse balance; */
	overflow: hidden;
	text-overflow: ellipsis;
	width:auto;
	margin:auto;
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

.imgdiv {
	width:33.2%;
	position:relative;
	cursor: pointer;
}


.imgdiv:hover .placetitle{
	opacity:1;
	
}

.imgdiv:hover .img{
	filter: none;
	-webkit-filter: grayscale(0);
}

.imgdiv .placetitle {
	color:white;
	text-align: center;
	font-family: MBCM;
	font-size: 4em;
	position: absolute;		
    top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 10;
    opacity: 0;
    transition: all 0.8s ease;			
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


.modal-body {
    max-height: calc(100vh - 210px);
    overflow-y: auto;
}

.modal-body img {
    max-width: 100%;
    height: auto;
}

.modal-content iframe {
    width: 100%;
    height: 30vw%; 
    max-height: 100%; 
}

.modal-backdrop {
    display: none;
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
											console.log("dsadsdsa")
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
	
	$(document).ready(function() {
				$("#pwdRecoveryForm").submit(function(event) {
									event.preventDefault(); // Prevent the default form submission
									// Collect form data
									var formData = "email2=" + encodeURIComponent($("#email2").val());
									// Use AJAX to check email availability first
										$.ajax({
												url : "/forgotPwd.do", // Endpoint for 아이디찾기
												type : "POST",
												data : formData,
												dataType : "text", // Response data type
												contentType : "application/x-www-form-urlencoded; charset=UTF-8",
												success : function(response) {
													console.log("Response:",response); // Add this line for debugging
													if (response) {
														// Handle 아이디찾기 success
														var foundPw = response;
														alert("임시 비밀번호가 발급되었습니다.: "+ response);
														$("#pwdRecoveryModal").modal("hide"); // Close the modal
													} else {
														// Handle 아이디찾기 error
														alert("비번을 찾을 수 없습니다. 다시 시도해주세요.");
													}
												},
												error : function(error) {
													console.log("Error:",error);
													// Handle 아이디찾기 error if needed
												}
											});
								});
			});
	
	$(document)
	.ready(
	function() {
		console.log('베스트캠핑장가져오기 시작');
	$.ajax({
		url : "/campBest.do",
		method : "get",
		dataType : "json", 
		success : function(data) {
			// 'bestCamps'라는 키로 서버에서 보낸 데이터 리스트를 찾는다.
			// var dataList = data.bestCamps;
			console.log('베스트캠핑장가져오기 inside function(data){}');
			var list = "";

			
			$.each(data, function (index, response) {
				// 제공 이미지 없을 시
				var imageUrl = response.firstImageUrl == "" ? "resources/images/beach01.jpg" : response.firstImageUrl;
				
				list += "<div class='imgdiv' onclick=\"window.location.href='/campDetail.do?keyword="+response.facltNm+"'\">" 
					+"<img class='img' src='"+imageUrl+"'alt='img1' width='100%' height='100%'" 
						+ "style='width: 100%; object-fit: cover; position: relative; border-radius:1rem;'>"
						+"<span class='placetitle'><h1>"+response.facltNm+"</h1></span>"
						+"</div>"
						
                }); //each
                
                $("#image_best3_list").append(list); //append
                
             	// 별 색칠 로직
                $('.rating').each(function() {
                    var rating = $(this).data('rating');
                    $(this).find('.fa').each(function(index) {
                        if (index < rating) {
                        	$(this).removeClass('disable');  // 색칠된 별은 .disable 클래스 제거
                        } else {
                            $(this).addClass('disable');  // 색칠되지 않은 별은 .disable 클래스 추가
                        }
                    });
                });
                $(".small-title").show();
                
            },
            error: function() {
            	alert("에러");
            	//loading = false;
            }
        });
	}
	);
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
					<li><a href="/campMain.do">/캠핑장.do</a></li>
					<li><a href="/groupList.do">/캠핑모임.do</a></li>

					<%
					String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
					String adminChecker = (String) request.getSession().getServletContext().getAttribute("adminChecker");
					%>
				
					
					<%
					if (u_idx != null && !u_idx.isEmpty()) {
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
			let flag = 0;
			if ($(document).scrollTop() > 50) {
				$('.navHD').addClass('affix');
				console.log("OK");
			} else {
				$('.navHD').removeClass('affix');
			}
/* 			if($(document).scrollTop() > 90 && flag==0) {
				flag=flag+1;
				$('.s1-text').text("/CAMPING.do");
			}
 */			var w = $(window).scrollTop();
			var f = "translateX(" + w * (-0.30) + "px)";
			console.log(w);
			$('.s1-text').css({
				transform : f
			});
		});
	</script>

	<!-- NAVBAR END -->



	<!-- 히어로 이미지 -->
<!-- 	<div class="hero-image">
		<div class="hero-text">
			<p class="hero-title">별드림캠핑장</p>
			<p class="hero-content">경기도 가평군 가평읍 개곡리 198-1</p>
		</div>
	</div> -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
		<!-- ajax으로 불러옴 -->
	  </div>
	  <div class="carousel-inner h-100">
	  	<!-- ajax으로 불러옴 -->
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>	

	<!-- 소개글 -->
	<div class="section one ">
		<div class="row" style="left: 10%; right: 10%; top: 5%; z-index: 9;">
			<div class="s1-text-title" style="translate: 0px -50%;">

				<p class="s1-text">/CAMPING.do</p>
				
			</div>
			<div class="s1-text-content ps-5"><span style="font-size: 2rem;"><b>안녕하세요!</b></span><br>
				<span style="font-family:MBCM;">/CAMP.do</span>는 한국 전역의 환상적인 캠핑 지역과 열정적인 캠핑 애호가들의 다채로운 커뮤니티를 제공하는 독특한 플랫폼입니다.<br>
				<br><span style="font-weight:bold;">우리가 제공하는 것:</span><br>
				<i>탐험, 발견, 연결</i><br><br>
				🌲 <span style="font-weight:bold;">최고의 캠핑 지역:</span> 고요한 호수변 휴식처부터 웅장한 산악 은신처까지, 우리가 엄선한 캠핑 명소들은 자연의 최고봉에서의 잊지 못할 경험을 약속합니다.<br>
				🏕️ <span style="font-weight:bold;">온라인 모임:</span> 우리 사용자 친화적인 온라인 모임 플랫폼을 통해 캠핑 애호가들과 연결하고 여행을 계획하며 경험을 공유하세요. 숙련된 전문가든, 처음 캠핑을 시도하는 분이든, 캠핑을 사랑하는 커뮤니티를 찾을 수 있습니다.<br>
				📅 <span style="font-weight:bold;">주최된 캠핑 만남:</span> 커뮤니티 회원들이 주최하는 정기적인 캠핑 만남에 참여하거나, 직접 이벤트를 만들어보세요. 캠프 파이어 주변에서 새로운 우정을 형성하고 평생 간직할 추억을 만드세요.</div>
		</div>
		<div class="row" style="height:10vh;"></div>
	</div>
	
	<script type="text/javascript">

    $(document).ready(function() {
        // 팝업 데이터를 가져옵니다.
        $.ajax({
            url: "/Popup2.do",
            type: "GET",
            dataType: "json",
            success: function(datas) {
            	let data = datas[0];
            	let imgdata = datas[1];
            	console.log(datas)
                for (let i = 0; i < data.length; i++) {
					    // 유튜브 iframe이 pop_content에 포함되어 있는지 확인합니다.
					    let content = data[i].pop_content;
					    if (content.includes("www.youtube.com/embed")) {
					        // iframe의 src 값을 가져와서 autoplay=1을 추가합니다.
					        const parser = new DOMParser();
					        const doc = parser.parseFromString(content, "text/html");
					        const iframe = doc.querySelector("iframe");
					        if (iframe) {
					            const src = iframe.getAttribute("src");
					            iframe.setAttribute("src", src + (src.includes("?") ? "&" : "?") + "autoplay=1&mute=1");
					            content = doc.body.innerHTML;
					        }
					    }
                    // 모달 HTML을 생성합니다.
                    let modalHtml = '<div class="modal fade" data-bs-backdrop="static" id="exampleModalToggle' + i + '" aria-hidden="true" aria-labelledby="exampleModalToggleLabel' + i + '" tabindex="-1" style="top: -100px; left: ' + (200 * i) + 'px;">' +
                        '<div class="modal-dialog modal-dialog-centered">' +
                        '<div class="modal-content">' +
                        '<div class="modal-header">' +
                        '<h1 class="modal-title fs-5" id="exampleModalToggleLabel' + i + '">' + data[i].pop_title + '</h1>' +
                        '</div>' +
                        '<div class="modal-body">' +
                        content +
                        '</div>' +
                        '<div class="modal-footer">' +
                        '<div class="form-check">' +
                            '<input class="form-check-input" type="checkbox" id="dontShowAgain' + i + '" value="">' +
                            '<label class="form-check-label" for="dontShowAgain' + i + '">1시간 동안 다시 보지 않기</label>' +
                            '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>' +
                        '</div>';

                    modalHtml += '</div></div></div></div>';

                    // 생성된 모달 HTML을 body에 추가합니다.
                    if (popupClosedTime && new Date().getTime() - popupClosedTime < 30000) {
                        // Do nothing for this specific popup, but continue to process the other logic.
                    } else {
                        // Only add the modal HTML and show the modal if the time condition is not met.
                        $('body').append(modalHtml);
                        $('#exampleModalToggle'+i).modal('show');
                    }

                }
            	if(imgdata.length>0) {
	            	for (let i=0; i<imgdata.length; i++) {
	            		let imghtml = '';
	            		let indexhtml = '';
	            		if(i==0) {
	            			imghtml	 = '<div class="carousel-item active">' 
	            		      			+ '<img src="resources/background/'+imgdata[i].mp_imgname+'" class="d-block" alt="...">'
	            		    			+'</div>';
	            		    indexhtml = ' <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="'
	            		    			+ i
	            		    			+'" class="active" aria-current="true" aria-label="Slide '
	            		    			+ (i+1) +'"></button>'
	            		    console.log(imghtml);
	            		} else {
	            			imghtml = '<div class="carousel-item">'
	            						+ '<img src="resources/background/'+imgdata[i].mp_imgname+'" class="d-block" alt="...">'
	            						+ '</div>';
       						indexhtml = ' <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="'
	        		    			+ i
	        		    			+'"  aria-label="Slide '
	        		    			+ (i+1) +'"></button>'
	            						
	            			console.log(imghtml);
	            		}
	            		
	            		$('.carousel-inner').append(imghtml);
	            		$('.carousel-indicators').append(indexhtml);
	            	}
            	}
            	
            	if(imgdata.length==0) {
            		let i = 0;
        			let imghtml	 = '<div class="carousel-item active">' 
		      			+ '<img src="resources/background/background.jpeg" class="d-block w-100" alt="...">'
		    			+'</div>';
		    		let indexhtml = ' <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="'
		    			+ i
		    			+'" class="active" aria-current="true" aria-label="Slide '
		    			+ (i+1) +'"></button>'
            		$('.carousel-inner').append(imghtml);
            		$('.carousel-indicators').append(indexhtml);
            	}
  
                  
                
            },
            error: function() {
                console.error("Failed to fetch data from /Popup2.do");
            }
        });

        
        $(document).on('hidden.bs.modal', '.modal', function (e) {

            const checkboxId = 'dontShowAgain' + e.target.id.replace('exampleModalToggle', '');
            const isChecked = $('#' + checkboxId).prop('checked');

            if (isChecked) {
                const currentTime = new Date().getTime();
                localStorage.setItem('popupClosedTime', currentTime);
            }
        });
        
        const popupClosedTime = localStorage.getItem('popupClosedTime');
      
     // Drag functionality
        let isDragging = false;
        let startX, startY, initialLeft, initialTop;
        let draggedModal = null;  // 드래그 중인 팝업을 참조하는 변수

        $(document).on('mousedown', '.modal-header', function(e) {
            isDragging = true;
            startX = e.clientX;
            startY = e.clientY;
            draggedModal = $(this).closest('.modal');  // 현재 클릭된 팝업을 참조합니다.
            initialLeft = parseInt(draggedModal.css('left'));
            initialTop = parseInt(draggedModal.css('top'));
        });

        $(document).on('mousemove', function(e) {
            if (!isDragging || !draggedModal) return;
            let dx = e.clientX - startX;
            let dy = e.clientY - startY;
            draggedModal.css({  // 드래그 중인 팝업만 움직입니다.
                left: initialLeft + dx + 'px',
                top: initialTop + dy + 'px'
            });
        });

        $(document).on('mouseup', function() {
            isDragging = false;
            draggedModal = null;  // 드래그 종료 후 참조를 초기화합니다.
        });

    });
</script>
	
	<!-- 두번째 색션 -->
	<div class="section two  w-100 ">
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="row" style="height:10vh;"></div>
			<!-- <div class="s2-text-title">/요즘 핫한 곳으로.go!</div> -->
			<div class="s2-text-title waviy mt-3 mb-5" onclick="window.location.href='/campMain.do'">
				<span id="waviytitle" style="--i:1">/</span>
				<span id="waviytitle" style="--i:2">요</span>
				<span id="waviytitle" style="--i:3">즘</span>
				<span id="waviytitle" style="--i:4">핫</span>
				<span id="waviytitle" style="--i:4">🔥</span>
				<span id="waviytitle" style="--i:5">한</span>
				<span id="waviytitle" style="--i:6">곳</span>
				<span id="waviytitle" style="--i:7">으</span>
				<span id="waviytitle" style="--i:8">로</span>
				<span id="waviytitle" style="--i:9">.</span>
				<span id="waviytitle" style="--i:10">g</span>
				<span id="waviytitle" style="--i:11">o</span>
				<span id="waviytitle" style="--i:12">!</span>
			</div>
			<div class="s2-text-content mt-3 mb-5">
			
				 국내 전역에서 많은 캠핑 애호가들에게 <b><i>사랑받는</i></b> 명소들을 소개합니다!📊 <br>
				 이곳에서는 <b><i>자연의 아름다움과 평온함</i></b>이 어우러진 탁월한 캠핑 지역들을 만나보세요.<br>
				 모든 캠퍼들이 특별한 순간을 만들 수 있도록 <b><i>정성을 다한 추천</i></b> 명소들을 선별했습니다.<br>
				 이곳에서 더 많은 <b><i>자연을 느껴보세요!</i></b> 🎆🎊✨
			</div>
			<div id="image_best3_list" class="row mb-5">
				
			</div>
			
<!-- 		
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
 -->
 
 				<div class="row" style="height:10vh;"></div>
		</div>
	</div>
	<script>
	
	</script>
	
	<!-- 세번째 색션 -->
	<div class="section three">
		<div class="row" style="left: 10%; right: 10%; top: 5%; z-index: 9;">
			<div class="col">
				<div class="fire-on">
				    <div class="switch-wrap">
						<div id="switch">
							<div id="circle"></div>
						</div>
				    </div>
					
					
					<div class="section-center">
						<div class="moon">
							<div></div>
							<div></div>
							<div></div>
						</div>
						<div class="shooting-star"></div>
						<div class="shooting-star-2"></div>
						<div class="star"></div>
						<div class="star snd"></div>
						<div class="star trd"></div>
						<div class="star fth"></div>
						<div class="star fith"></div>
						<div class="circle"></div>
						<div class="wood-circle"></div>
						<div class="wood"></div>
						<div class="tree-1"></div>
						<div class="tree-2"></div>
						<div class="fire">
							<span></span>
							<span></span>
							<span></span>
						</div>
						<div class="smoke">
							<span class="s-0"></span>
							<span class="s-1"></span>
							<span class="s-2"></span>
							<span class="s-3"></span>
							<span class="s-4"></span>
							<span class="s-5"></span>
							<span class="s-6"></span>
							<span class="s-7"></span>
							<span class="s-8"></span>
							<span class="s-9"></span>
						</div>
					</div>
			</div>
			
			</div>
			<div class="col">
				<div class="s3-text-title"><span style="color:white!important;"> ﾟ☁︎｡ ⋆｡ ﾟ⋆ ☾⋆⁺₊ ⋆</span><br>/CAMPing 의 <span class="eublink">이유</span>.do<br>
				<span style="color:white!important;">🏕🏔🏞🏖🏕🏔🏖</span></div>
				<div class="s3-text-content pe-5">
				
				캠핑은 도시의 소음에서 벗어나 자연 속에서 신선한 공기를 마시며 <b><i>몸과 마음을 힐링</i></b>할 수 있는 최고의 방법입니다!<br> 
				텐트 속에서 자연의 소리를 들으며, 별빛 아래에서의 잠은 일상의 <b><i>스트레스를 풀어줍니다</i></b>. <br>
				또한 가족과 친구들과 함께하는 캠프 파이어는 <b><i>소중한 추억</i></b>을 만들어줍니다. <br>
				캠핑은 자연과 가까워지는 경험이자, <b><i>새로운 모험</i></b>을 시작하는 기회입니다.
				
				</div>
			
			</div>
		</div>
		<div class="row" style="height:10vh;"></div>
	</div>
	<script>
	$(document).ready(function() {
		$("body").addClass("fire-off");
		$("#switch").addClass("switched");
	});
	$("#switch").on('click', function () {
		if ($("body").hasClass("fire-off")) {
			$("body").removeClass("fire-off");
			$("#switch").removeClass("switched");
			$("body").addClass("dampen");
		}
		else {
			$("body").addClass("fire-off");
			$("#switch").addClass("switched");
			$("body").removeClass("dampen");
		}
	});
	</script>

	<!-- 네번째 색션 -->
	<div class="section four">
		<div class="row" style="height:5vh;"></div>
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="s4-text-title mt-4 mb-5" onclick="window.location.href='/groupList.do'">/캠핑, together.d🌏!</div>
			<div class="s4-text-content mb-5">

			🤠🤓🤭 함께 캠핑을 즐기고 싶은 이들을 위한 만남의 장을 마련했습니다.
			<b><i>자연을 함께 누리며</i></b> 새로운 우정을 만들어보세요. <br>
			😋🤩😂 캠핑 파트너를 찾는 첫걸음을 내딛어보세요! 
			캠핑을 좋아하는 사람들과 함께하는 <b><i>특별한 순간</i></b>들이 기다립니다. <br>

			</div>
			
						
		</div>
		<div class="row" style="height:50vh; width:60vw; margin:auto;">
		<iframe class="mb-5" style="height:100%; width:100%;" width="300" height="315" 
		src="https://www.youtube.com/embed/rOga7uYptGA?&autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow='autoplay' allowfullscreen></iframe>
		</div>
		<div class="row" style="height:10vh;"></div>
	</div>

	<!-- 푸터 색션 -->
	<div class="section five">
		<div class="row"
			style="margin-left: 15vw; margin-right: 15vw; top: 2%; z-index: 9;">
			<div class="s5-text-title">/푸터.do</div>
			<div class="s5-text-content">
				<div class="row">
					<div class="col">

						
						주소: [주소 입력]<br>
						전화번호: [전화번호 입력]<br>
						이메일: [이메일 주소 입력]<br><br><br>
						문의하기 (Contact Us) | 자주 묻는 질문 (FAQ) <br>
						개인 정보 보호 정책 (Privacy Policy) | 이용 약관 (Terms of Service) <br>
						© 2023 캠핑 모임 & 명소 (Camping Meetups & Spots) /camping.do. 판권 소유. <br><br> 
					</div>
					<div class="col"></div>
					
					<div class="col d-flex justify-content-end">
								<a href="#" class="fa fa-facebook"></a>
								<a href="#" class="fa fa-twitter"></a>
								<a href="#" class="fa fa-google"></a>
					</div>
				</div>	
			</div>
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
										style="width: 70%; height: 50px;"></a>
									<div id="naver_id_login" style="margin-top: 10px; height: 10px;"></div>
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
	<script type="text/javascript"src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"charset="utf-8"></script>
	<script type="text/javascript"src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		
	<!-- //네이버 로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("G9mEXjeV6N3JKbzZvasQ", "http://localhost:8090");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green",3,50);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	</script>
	<script type="text/javascript">
		// 접근 토큰 값 출력	
		if (naver_id_login != null) {
			// 네이버 사용자 프로필 조회
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
			// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			function naverSignInCallback() {
				console.log(naver_id_login)
				var email = naver_id_login.getProfileData('email');
				var nickname = naver_id_login.getProfileData('nickname');
				var id = naver_id_login.getProfileData('id');
				var name = naver_id_login.getProfileData('name');
				location.href="/naver.do?email="+email+"&nickname="+nickname+"&id="+id+"&name="+name;
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
							<label for="email2" class="form-label">아이디</label>
							<input type="text" class="form-control" id="email2" name="email2" placeholder="아이디를 입력하세요.">
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
