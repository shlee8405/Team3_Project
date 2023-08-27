<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
    <form action="/login.do" method="post">
        <div class="wrap">
            <div class="login">
                    <h3 style="font	-size:50px;  font-family: 'Noto Sans KR', sans-serif;">/캠핑.DO</h3>
                <!--이메일 입력-->
                <div class="u_id">
                    <h4 style=" font-family: 'Noto Sans KR', sans-serif;">아이디</h4>
                    <input type="text" name="u_id" class="pos" placeholder="ID(아이디)">
                </div>
                <!--비밀번호 입력-->
                <div class="u_pw"> 
                    <h4 style=" font-family: 'Noto Sans KR', sans-serif;">비밀번호</h4>
                    <input type="password" name="u_pw" class="pos" placeholder="비밀번호">
                </div>
                <!--로그인 버튼-->
                <div class="submit">
                    <input style="font-family: 'Noto Sans KR', sans-serif;" type="submit" value="로그인">
                </div>
                <br>
                <div class="loginmenu">
	                <!--아이디 찾기-->
                    <div class="schid">
                        <c:url var="findId" value="/IdRecovery.do" />
                        <a href="idfind.html"style="font-family: 'Noto Sans KR', sans-serif;">
                          아이디찾기
                        </a>
                    </div>
                    <span style="margin-top: 8px;">|</span>
                	<!--비밀번호 찾기-->
	                <div class="schpw">
	                    <c:url var="findPwd" value="/PwdRecovery.do" />
	                    <a href="pwfind.html" style="  font-family: 'Noto Sans KR', sans-serif;">
	                       비밀번호찾기
	                    </a>
	                </div>
	                <!--비밀번호 찾기-->
	                <span style="margin-top: 8px;">|</span>
	                <div class="schpw">
	                    <c:url var="findPwd" value="/PwdRecovery.do" />
	                    <a href="pwfind.html" style="  font-family: 'Noto Sans KR', sans-serif;">
	                        회원가입
	                    </a>
	                </div>
	            </div>
	            
                <br>
                
                <!--카카오 로그인 -->
                <div class="login_api">
				  <a href="javascript:void(0)" id="kakaoLoginBtn"><img src="resources/images/kakao_login_btn.png" style="width:100%; height:50px; "></a>
				  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				</div>	
			</div>
		</div>
	</form>
				
				



<script>
  Kakao.init('c6915a815f664f1b0e24428d4202b72f'); // Initialize Kakao SDK with your API key

  // Attach event listener to Kakao login button
  document.getElementById('kakaoLoginBtn').addEventListener('click', function() {
    if (Kakao.Auth.getAccessToken()) {
      kakaoLogout();
    } else {
      kakaoLogin();
    }
  });

  // Kakao login function
  function kakaoLogin() {
    Kakao.Auth.login({
      success: function(response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(response) {
            console.log(response);
            console.log(response.id);
            $.ajax({
				 url: '/kakaoLogin.do', // 중복확인을 처리하는 서버 URL (적절히 변경 필요)
		            type: 'post', // POST 방식으로 요청
		            contentType: 'application/json; charset=utf-8',
		            data: JSON.stringify(response), // 서버로 전달할 데이터
		            success: function(result) {
		            	location.href="/home.do";
		            	//modal화 되면 여기에 모달 숨기기 넣으면 될듯
		            },
		            error: function(error) {
		            	console.log(error);
		            }
		        });
          },
          fail: function(error) {
            console.log(error);
          },
        });
      },
      fail: function(error) {
        console.log(error);
      },
    });
  }

  // Kakao logout function
  function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function(response) {
          console.log(response);
        },
        fail: function(error) {
          console.log(error);
        },
      });
      Kakao.Auth.setAccessToken(undefined);
    }
  }
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 네이버 로그인 버튼 노출 영역 -->
    <div id="naver_id_login"></div>
    <!-- //네이버 로그인 버튼 노출 영역 -->
    <script type="text/javascript">
    var naver_id_login = new naver_id_login("64LV1RLj1gi5COZg0EVh", "http://localhost:8090/home.do");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 70, 70);
    naver_id_login.setDomain("http://localhost:8090");
    naver_id_login.setState(state);	
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();   
</script>
    <script type="text/javascript">
  // 접근 토큰 값 출력	
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
  }
</script>
</body>

</html>