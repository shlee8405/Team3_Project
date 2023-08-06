<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<style type="text/css">
.login-content{
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.img img{
  width: 500px;
}

form{
  width: 360px;
}

.login-content img{
    height: 100px;
}

.login-content h2{
  margin: 15px 0;
  color: #333;
  text-transform: uppercase;
  font-size: 2.9rem;
}

.login-content .input-div{
  position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 25px 0;
    padding: 5px 0;
    border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one{
  margin-top: 0;
}

.i{
  color: #d9d9d9;
  display: flex;
  justify-content: center;
  align-items: center;
}

.i i{
  transition: .3s;
}

.input-div > div{
    position: relative;
    height: 45px;
}

.input-div > div > h5{
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  color: #999;
  font-size: 18px;
  transition: .3s;
}

.input-div:before, .input-div:after{
  content: '';
  position: absolute;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background-color: #38d39f;
  transition: .4s;
}

.input-div:before{
  right: 50%;
}

.input-div:after{
  left: 50%;
}

.input-div.focus:before, .input-div.focus:after{
  width: 50%;
}

.input-div.focus > div > h5{
  top: -5px;
  font-size: 15px;
}

.input-div.focus > .i > i{
  color: #38d39f;
}

.input-div > div > input{
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  background: none;
  font-size: 1.2rem;
  color: #555;
  font-family: 'poppins', sans-serif;
}

.input-div.pass{
  margin-bottom: 4px;
}

a{
  display: block;
  text-align: right;
  text-decoration: none;
  color: #999;
  font-size: 0.9rem;
  transition: .3s;
}

a:hover{
  color: #38d39f;
}

.login_btn{
  display: block;
  width: 100%;
  height: 50px;
  outline: none;
  border: none;
  background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
  background-size: 200%;
  font-size: 1.2rem;
  color: #fff;
  font-family: 'Poppins', sans-serif;
  text-transform: uppercase;
  margin: 1rem 0;
  cursor: pointer;
  transition: .5s;
  border-radius: 2.5rem;
}
.login_btn:hover{
  background-position: right;
}

@media screen and (max-width: 1050px){
  .container{
    grid-gap: 5rem;
  }
}

@media screen and (max-width: 1000px){
  form{
    width: 290px;
  }

  .login-content h2{
        font-size: 2.4rem;
        margin: 8px 0;
  }

  .img img{
    width: 400px;
  }
}

@media screen and (max-width: 900px){
  .container{
    grid-template-columns: 1fr;
  }

  .img{
    display: none;
  }

  .wave{
    display: none;
  }

  .login-content{
    justify-content: center;
  }
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>

	<div class="container">
		<h2>Login Page</h2> 
	
		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">Login</button>

		<!-- The Modal -->
		<div class="modal fade" id="loginModal">
			<div class="modal-dialog centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h2 class="modal-title"></h2>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
				        <div class="login-content">
				            <form>
				                <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
				                <h2 class="title">Welcome</h2>
				                    <div class="input-div one">
				                        <div class="i">
				                            <i class="fas fa-user"></i>
				                        </div>
				                        <div class="div">
				                            <h5>Username</h5>
				                            <input type="text" class="input">
				                        </div>
				                    </div>
				                    <div class="input-div pass">
				                        <div class="i"> 
				                            <i class="fas fa-lock"></i>
				                        </div>
				                        <div class="div">
				                            <h5>Password</h5>
				                            <input type="password" class="input">
				                        </div>
				                    </div>
				                    <a href="#">Forgot Password?</a>
				                    <input type="submit" class="login_btn" value="Login">
				                    
				                    <div class="login_api">
                					<a href="#" id="kakaoLoginBtn"><img src="resources/images/kakao_login_btn.png" style="width:100%; height:50px; margin-top: 2rem;"></a>
                					
                					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

									<ul>
										<li onclick="kakaoLogin();">
									      <a href="javascript:void(0)">
									          <span>카카오 로그인</span>
									      </a>
										</li>
										<li onclick="kakaoLogout();">
									      <a href="javascript:void(0)">
									          <span>카카오 로그아웃</span>
									      </a>
										</li>
									</ul>
									<!-- 카카오 스크립트 -->
									<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
									
									<script>
									document.addEventListener("DOMContentLoaded", function() {
									    document.getElementById("kakaoLoginBtn").addEventListener("click", function() {
									        kakaoLogin();
									    });
									});
									</script>
									
									
									<script>
									Kakao.init('c6915a815f664f1b0e24428d4202b72f'); //발급받은 키 중 javascript키를 사용해준다.
									console.log(Kakao.isInitialized()); // sdk초기화여부판단
									//카카오로그인
									function kakaoLogin() {
									    Kakao.Auth.login({
									      success: function (response) {
									        Kakao.API.request({
									          url: '/v2/user/me',
									          success: function (response) {
									        	  console.log(response)
									          },
									          fail: function (error) {
									            console.log(error)
									          },
									        })
									      },
									      fail: function (error) {
									        console.log(error)
									      },
									    })
									  }
									
									//카카오로그아웃  
									function kakaoLogout() {
									    if (Kakao.Auth.getAccessToken()) {
									      Kakao.API.request({
									        url: '/v1/user/unlink',
									        success: function (response) {
									        	console.log(response)
									        },
									        fail: function (error) {
									          console.log(error)
									        },
									      })
									      Kakao.Auth.setAccessToken(undefined)
									    }
									  }  
									</script>
                					
           							</div>

            						<div class="login_api">
                					<a href=""><img src="resources/images/naver_login_btn.png" style="width:100%; height:50px; margin: 10px 0;"></a>
           							</div>
				            </form>
				        </div>
					</div>				
				</div>
			</div>
		</div>
	</div>
	
</body>
<!-- 네이버 로그인 api -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  var inputs = document.querySelectorAll(".input");

  function addcl(){
    let parent = this.parentNode.parentNode;
    parent.classList.add("focus");
  }

  function remcl(){
    let parent = this.parentNode.parentNode;
    if(this.value == ""){
      parent.classList.remove("focus");
    }
  }

  inputs.forEach(input => {
    input.addEventListener("focus", addcl);
    input.addEventListener("blur", remcl);
  });
});
</script>
</html>