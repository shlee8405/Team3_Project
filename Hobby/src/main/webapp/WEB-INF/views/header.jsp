<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
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
    
    @font-face{
        font-family: MBCM;
        src: url(/resources/fonts/MBCM.ttf);
    }
    @font-face {
        font-family: TAEBAEK;
        src: url(/resources/fonts/TAEBAEK.ttf);
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
html,
body {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
	z-index: 2 !important;
}

/* Navbar section */

.navHD {
    width: 100%;
    height: 65px;
    position: fixed;
    line-height: 65px;
    text-align: center;
    background-color:#637F42;
    top: 0;
    z-index: 2;
  
}

.footerHD {
	width: 100%;
	height:0px;
	position: fixed;
	line-height:65px;
	text-align:center;
    background-color:#0F4200;
    bottom: 0;
    z-index: 2;
    padding:0;
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s, opacity 0.5s linear;
}
.navHD, ::after, ::before {
    box-sizing: content-box;
}

.navHD div.logo {
    margin-right: auto;
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
    color: #fff;
    line-height: 65px;
    font-size: 2.0rem;
}

.navHD div.main_list ul li a:hover {
    color: green;
}


/* Home section */



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

/* @media screen and (min-width: 768px) and (max-width: 1024px) {
    .container {
        margin: 0;
    }

@media screen and (max-width:768px) {
    .navTrigger {
        display: block;
    }
    .navHD div.logo {
    margin-right: auto;
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
        /*same background color of navbar
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
} */




.affix {
    padding: 0;
    background-color: #0F4200;
    opacity:100%;
    z-index: 2;
}

.affix2 {
	height:50px;
	visibility: visible;
	opacity:1;
}




.myH2 {
	text-align:center;
	font-size: 4rem;
}
.myP {
	text-align: justify;
	padding-left:15%;
	padding-right:15%;
	font-size: 20px;
}
@media all and (max-width:700px){
	.myP {
		padding:2%;
	}
}

    </style>

    
    <script>
    
	$('.navTrigger').click(function () {
    	$(this).toggleClass('active');
    	console.log("Clicked menu");
    	$("#mainListDiv").toggleClass("show_list");
    	$("#mainListDiv").fadeIn();
	});	
	
	function go_camp() {
		location.href = "/campMain.do"
	}

	function go_group() {
		location.href = "/groupList.do"
	}

	function go_login() {
		location.href = "/login.do"

	}
	function go_signup() {
		location.href = "/signup.do"
	}

	function go_world() {
		location.href = "/world.do"
	}

	function go_map() {
		location.href = "/map.do"
	}

	function go_cusser() {
		location.href = "/cusSer.do"
	}

	function go_mypage() {
		location.href = "/myPagemain.do"
	}

	function go_admin() {
		location.href = "/adminHome.do"
	}
	
	function go_shltest() { /* 실험용. 나중에 삭제할 예정*/
		location.href ="/shltest.do"
	}
	
	function checkU_id(){
		location.href="/checkSession.do";
		window.location.reload();
	}
	
	function go_logOut() {
		location.href="/logOut.do"
	}

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
    
    
</head>
<body>

    <nav class="navHD">
        <div class="containerHD">
            <div class="logo">
                <a href="/home.do" style="height: 10px;"><img src="/resources/images/logo3.png" style="width:200px; height:105px; position:relative; top:-50px; margin:0;"></a>
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
					if (u_idx != null && !u_idx.isEmpty() ) {
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
					<li><a data-bs-toggle="modal" data-bs-target="#exampleModal">/로그인.do</a></li> <!-- 로그인 모달 버튼 -->
					<% } %>
                </ul>
            </div>
          
        </div>
    </nav>
    <!-- logout() check if kakaosession and logout  -->
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Function used to shrink nav bar removing paddings and adding black background -->
    <script>
        $(window).scroll(function() {
            if ($(document).scrollTop() > 50) {
                $('.navHD').addClass('affix');
                $('.footerHD').addClass('affix2');
                console.log("OK");
            } else {
                $('.navHD').removeClass('affix');
                $('.footerHD').removeClass('affix2');
            }
            
            if ($(document).scrollTop() > 200) {
                $('.footerHD').addClass('affix2');
            } else {
                $('.footerHD').removeClass('affix2');
            }
        });
    </script>
    
    
    
    
    
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
								<div class="u_id hiddenholder">
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
		var urlParam = window.location.search;
		if(urlParam.length==0){
			$( ".hiddenholder" ).append( "<input type='hidden' value='" +url + "' name='url'/>" ); 
		} else {
			$( ".hiddenholder" ).append( "<input type='hidden' value='" +url+urlParam+ "' name='url'/>" ); 
		}
		/* $( ".hiddenholder" ).append( "<input type='hidden' value='${pageContext.request.servletPath}' name='url'/>" ); */ 
		// Attach event listener to Kakao login button
		document.getElementById('kakaoLoginBtn').addEventListener('click',
				function() {
					if (Kakao.Auth.getAccessToken()) {
						kakaoLogout();
					} else {
						kakaoLogin();
					}
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
						console.log(response);
					},
					fail : function(error) {
						console.log(error);
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

<c:if test='${loginChk=="wrong"}'>
    <script>
    </script>
    <c:remove var="loginChk" scope="session" />
</c:if>
<c:if test='${loginChk=="invalid"}'>
    <script>
    </script>
    <c:remove var="loginChk" scope="session" />
</c:if>

    
    <footer class="footerHD" >
    	<div> <span style="font-family:MBCM; color:rgba(255,255,255,0.8);">© 2023 캠핑 모임 & 명소 (Camping Meetups & Spots) /camping.do. 판권 소유. </span> </div>
    	<h1></h1>
    </footer>
</body>
</html>