<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
	z-index: 5 !important;
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
    z-index: 10;
  
}

.footerHD {
	width: 100%;
	height:0px;
	position: fixed;
	line-height:65px;
	text-align:center;
    background-color:#0F4200;
    bottom: 0;
    z-index: 10;
    padding:0;
	visibility: hidden;
	opacity: 0;
	transition: visibility 0s, opacity 0.3s linear;
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
    z-index:8;
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
		location.href="/checkSession.do"
	}
	
	function go_logOut() {
		location.href="/logOut.do"
	}

    </script>
</head>
<body>
    <nav class="navHD">
        <div class="containerHD">
            <div class="logo">
                <a href="/home.do"><img src="/resources/images/logo3.png" style="width:200px; position:relative; top:-25px; margin:0;"></a>
            </div>
            <div id="mainListDiv" class="main_list">
                <ul class="navlinks">
                    <li><a href="/adminHome.do" style="text-family:sans-seriff; font-size: 1rem;">관리자</a></li>
                     <li><a href="/checkSession.do" style="text-family:sans-seriff; font-size: 1rem;">sysout sessionIdx</a></li>
                      <li><a href="/logOut.do" style="text-family:sans-seriff; font-size: 1rem;">로그아웃</a></li>
                    <li><a href="/campMain.do">/캠핑장.do</a></li>
                    <li><a href="/groupList.do">/캠핑모임.do</a></li>
                    <li><a href="/myPagemain.do">/마이페이지.do</a></li>
                    <li><a href="/cusSer.do">/고객센터.do</a></li>
                    <li><a href="/login.do">/로그인.do</a></li>
                </ul>
            </div>
          
        </div>
    </nav>
	
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
    
    
    <footer class="footerHD" >
    	<div> hi</div>
    </footer>
</body>
</html>