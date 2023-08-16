<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>



<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<meta name ="google-signin-client_id" content="516212483548-l0von8bqb97k9ao0pjaea7c5g9asouvp.apps.googleusercontent.com">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<title>캠핑 : 로그인</title>
</head>
<body>
    <form action="" method="">
        <div class="wrap">
            <div class="login">
                <a href="index.html">
                    <h3 style="font-size:50px;  font-family: 'Noto Sans KR', sans-serif;">/캠핑.do</h3>
                </a>
                <!--이메일 입력-->
                <div class="login_id">
                    <h4 style=" font-family: 'Noto Sans KR', sans-serif;">아이디</h4>
                    <input type="text" name="m_id" class="pos" placeholder="ID(아이디)">
                </div>
                <!--비밀번호 입력-->
                <div class="login_pw">
                    <h4 style=" font-family: 'Noto Sans KR', sans-serif;">비밀번호</h4>
                    <input type="password" name="m_pw" class="pos" placeholder="비밀번호">
                </div>
                <!--로그인 버튼-->
                <div class="submit">
                    <input style="  font-family: 'Noto Sans KR', sans-serif;" type="submit" value="로그인">
                </div>
                <br>
                <!--아이디 찾기-->
                <div class="loginmenu">
                    <div class="schid">
                        <c:url var="findId" value="/IdRecovery.do" />
                        <a href="idfind.html">
                            <p style="font-family: 'Noto Sans KR', sans-serif;">아이디찾기</p>
                        </a>
                    </div>
                    <span style="margin-top: 8px;">|</span>
                <!--비밀번호 찾기-->
                <div class="schpw">
                    <c:url var="findPwd" value="/PwdRecovery.do" />
                    <a href="pwfind.html">
                        <p style="  font-family: 'Noto Sans KR', sans-serif;">비밀번호찾기</p>
                    </a>
                </div>
                <!--비밀번호 찾기-->
                <span style="margin-top: 8px;">|</span>
                <div class="schpw">
                    <c:url var="findPwd" value="/PwdRecovery.do" />
                    <a href="pwfind.html">
                        <p style="  font-family: 'Noto Sans KR', sans-serif;">회원가입</p>
                    </a>
                </div>
                </div>
                <br>
                <!--카카오 로그인 -->
                <div class="login_api">
  <a href="javascript:void(0)" id="kakaoLoginBtn"><img src="resources/images/kakao_login_btn.png" style="width:100%; height:50px; "></a>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</div>



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

</body>

</html>