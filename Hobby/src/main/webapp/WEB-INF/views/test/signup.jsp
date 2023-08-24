		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		<!DOCTYPE html>
		<html >
		<head>
		<title>signup</title>
		<meta charset="UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link rel="stylesheet" href="/resources/css/join.css">
		<script type="text/javascript">
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
			    if (phoneNumberParts.length !== 3 ||
			        phoneNumberParts[0].length !== 3 ||
			        phoneNumberParts[1].length !== 4 ||
			        phoneNumberParts[2].length !== 4) {
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

		    if (
		        emailInput.value === "" ||
		        idInput.value === "" ||
		        pwInput.value === "" ||
		        confirmPwInput.value === "" ||
		        nicknameInput.value === "" ||
		        birthdayInput.value === "" ||
		        phoneInput.value === ""
		    ) {
		        alert("모든 필수 항목을 입력해주세요.");
		        return false;
		    }


		    // You can add additional validation logic here if needed

		    return true;
		}
		    $(document).ready(function() {
				$("#emailBtn").click(function() {
					var email = $('#u_email').val(); 
					alert(email);
					console.log(email)
					$.ajax({
						 url: '/emailCheck.do', // 중복확인을 처리하는 서버 URL (적절히 변경 필요)
				            type: 'post', // POST 방식으로 요청
				            data: email, // 서버로 전달할 데이터
				            success: function(result) {
				                if (result === "available") {
				                    $('#emailDupCheckMsg').text("사용 가능한 이메일입니다.").css("color", "green");
				                } else if (result === "duplicate") {
				                    $('#emailDupCheckMsg').text("이미 사용 중인 이메일입니다.").css("color", "red");
				                }
				            },
				            error: function() {
				                $('#emailDupCheckMsg').text("에러가 발생했습니다.").css("color", "red");
				            }
				        });
				});
				$(document).ready(function() {
				 $("#idBtn").click(function() {
				        var id = $('#u_id').val();
				        alert(id);
				        console.log(id)
				        $.ajax({
				            url: '/idCheck.do', // 아이디 중복확인을 처리하는 서버 URL (적절히 변경 필요)
				            type: 'post', // POST 방식으로 요청
				            data: id, // 서버로 전달할 데이터
				            success: function(result) {
				                if (result === "available") {
				                    $('#chkIdMessage').text("사용 가능한 아이디입니다.").css("color", "green");
				                } else if (result === "duplicate") {
				                    $('#chkIdMessage').text("이미 사용 중인 아이디입니다.").css("color", "red");
				                }
				            },
				            error: function() {
				                $('#chkIdMessage').text("에러가 발생했습니다.").css("color", "red");
				            }
				        });
				    });
				 
			});
		    });
	</script>
		</head>
		<body>
		
			<title>camp : 회원가입</title>
		</head>
		<body>
			<form action="/signup.do" method="post" id="signupForm" onsubmit="validateForm();">
				<div class="wrap">
					<div class="login">
						<h3 text-align="center" style="font-family: 'Noto Sans KR', sans-serif; font-size : 40px">회원 가입</h3><br>
						<div class="textForm2">
							<!--이메일 입력-->
							<input type="email" class="u_email" name="u_email" id="u_email"
								 placeholder="*이메일을 입력해주세요." required>
								<div class="emailchk">
							<!--이메일 중복확인-->
							<button type="button" id="emailBtn" class="bttn" >중복 확인</button>
   							 <span id="emailDupCheckMsg"></span> <!-- 중복확인 결과를 나타내는 스팬 -->
							

								</div>
						</div>
						
						<!--아이디 확인-->
						<div class="textForm2">
							<input type="id" class="u_id" name="u_id" id="u_id" 
								placeholder="*아이디를 입력해주세요." required> 
								<button type="button" id="idBtn" class="bttn">중복 확인</button>
								<span id="chkIdMessage"></span>
						</div>
						<!--비밀번호 확인-->	
						<div class="textForm">
							<input type="password" class="u_pw" name="u_pw" id="upwd1" oninput="chkPwd();"
								placeholder="*비밀번호를 입력해주세요." required> <br> <span
								id="chkPwdMessage"></span>
						</div>
						<!--비밀번호 재확인-->
						<div class="textForm">
							<input type="password" class="u_pw" id="upwd2" oninput="validPW();"
								placeholder="*비밀번호 확인"> <Br> <span
								id="pwRuleChk"></span>
						</div>
						<!--닉네임 중복확인-->
						<div class="textForm">
							<input type="text" name="u_nickname" id="u_nickname"
								oninput="dupCheckNick();" class="u_nickname" placeholder="*닉네임을 입력해주세요."
								required> <br> <span id="nicknameDupCheckMsg"></span>
						</div>
					<div class="textForm2">
						<!-- 생일 입력 -->
						<input type="date" class="u_birthday" name="u_birthday"
							id="u_birthday" onchange="validateBirthday();"
							placeholder="*생일을 입력해주세요." required>
					</div>
					<div class="textForm2">
						<!-- 핸드폰 번호 입력 -->
						<input type="tel" class="u_phone" name="u_phone" id="u_phone"
							onchange="validatePhoneNumber();" placeholder="*핸드폰 번호를 입력해주세요."
							required>
					</div>
	
    						<!-- Your form fields here -->

    							<!-- Submit button -->
				    
					</form>
						<br>
						<div>
	
						
						<button class="submit2" onclick="validateForm()">가입하기</button>
						<a id="main" href="">홈으로</a>
	
					</div>
			</form>	
		
			<hr style="clear: both;">
		
		</body>
		</html>