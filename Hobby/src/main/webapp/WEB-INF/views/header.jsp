<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    text-decoration: none;
    color: #fff;
    line-height: 65px;
    font-size: 2.4rem;
}

.navHD div.main_list ul li a:hover {
    color: #00E676;
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
} */
>>>>>>> refs/remotes/origin/main




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

    </script>
</head>
<body>
    <nav class="navHD">
        <div class="containerHD">
            <div class="logo">
                <a href="#"><img src="/resources/images/logo3.png" style="width:200px; position:relative; top:-25px; margin:0;"></a>
            </div>
            <div id="mainListDiv" class="main_list">
                <ul class="navlinks">
                    <li><a href="#">캠핑장</a></li>
                    <li><a href="#">캠핑모임</a></li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">로그인</a></li>
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