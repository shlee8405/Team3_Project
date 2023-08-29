<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




  <!DOCTYPE html>
  <html >
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
        body, html {
          padding: 0;
          margin:0;
          height: 100%;
        }

        .section {
          width: 100%;
          height: 100%;
          background-attachment: fixed;
          background-size: 100% 100%;
          position: relative;
          background-color: white;
          z-index: 2;
        }

        .section.three {
            background-color: rgba(0, 0, 0, 0.4);
          height:60%;
        }
        .section.one {
          /* background-image: url(https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1); */
          background-color: rgba(5, 51, 27, 0.267);
          height:60%;
        }

        /* 투명 */
        .section.two {
          background: none;
        }    
        .section.two.one{
            height:40%;
        }
        .section.four{
            background:none;
            height:70%;
        }
        .sleep-video {
            left: 0;
            top: 0;
            position: fixed;
            width: 100%;
            z-index: 1;
        }




        /* NAVBAR STYLE */
        html,
body {
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
    background-color:rgba(4, 4, 4, 0);
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
    text-decoration: none;
    color: black;
    line-height: 65px;
    font-size: 2.4rem;
}
.affix div.main_list ul li a {
    color: rgba(199, 196, 196, 0.637);
}

.navHD div.main_list ul li a:hover {
    color: gray;
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

@-webkit-keyframes inM {
    50% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(45deg);
    }
}

@keyframes inM {
    50% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(45deg);
    }
}

@-webkit-keyframes outM {
    50% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(45deg);
    }
}

@keyframes outM {
    50% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(45deg);
    }
}

@-webkit-keyframes inT {
    0% {
        -webkit-transform: translateY(0px) rotate(0deg);
    }
    50% {
        -webkit-transform: translateY(9px) rotate(0deg);
    }
    100% {
        -webkit-transform: translateY(9px) rotate(135deg);
    }
}

@keyframes inT {
    0% {
        transform: translateY(0px) rotate(0deg);
    }
    50% {
        transform: translateY(9px) rotate(0deg);
    }
    100% {
        transform: translateY(9px) rotate(135deg);
    }
}

@-webkit-keyframes outT {
    0% {
        -webkit-transform: translateY(0px) rotate(0deg);
    }
    50% {
        -webkit-transform: translateY(9px) rotate(0deg);
    }
    100% {
        -webkit-transform: translateY(9px) rotate(135deg);
    }
}

@keyframes outT {
    0% {
        transform: translateY(0px) rotate(0deg);
    }
    50% {
        transform: translateY(9px) rotate(0deg);
    }
    100% {
        transform: translateY(9px) rotate(135deg);
    }
}

@-webkit-keyframes inBtm {
    0% {
        -webkit-transform: translateY(0px) rotate(0deg);
    }
    50% {
        -webkit-transform: translateY(-9px) rotate(0deg);
    }
    100% {
        -webkit-transform: translateY(-9px) rotate(135deg);
    }
}

@keyframes inBtm {
    0% {
        transform: translateY(0px) rotate(0deg);
    }
    50% {
        transform: translateY(-9px) rotate(0deg);
    }
    100% {
        transform: translateY(-9px) rotate(135deg);
    }
}

@-webkit-keyframes outBtm {
    0% {
        -webkit-transform: translateY(0px) rotate(0deg);
    }
    50% {
        -webkit-transform: translateY(-9px) rotate(0deg);
    }
    100% {
        -webkit-transform: translateY(-9px) rotate(135deg);
    }
}

@keyframes outBtm {
    0% {
        transform: translateY(0px) rotate(0deg);
    }
    50% {
        transform: translateY(-9px) rotate(0deg);
    }
    100% {
        transform: translateY(-9px) rotate(135deg);
    }
}

.affix {
    padding: 0;
    background-color: black;
    opacity:100%;
    z-index:8;
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


        /* NAVBAR STYLE END */


</style>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    $('.navTrigger').click(function () {
$(this).toggleClass('active');
console.log("Clicked menu");
$("#mainListDiv").toggleClass("show_list");
$("#mainListDiv").fadeIn();

});

</script>
  <body>
   
    <!-- NAVBAR -->

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
            <span class="navTrigger">
                <i></i>
                <i></i>
                <i></i>
            </span>
        </div>
    </nav>

<!-- Jquery needed -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Function used to shrink nav bar removing paddings and adding black background -->
    <script>
        $(window).scroll(function() {
            if ($(document).scrollTop() > 50) {
                $('.navHD').addClass('affix');
                console.log("OK");
            } else {
                $('.navHD').removeClass('affix');
            }
        });
    </script>





    <!-- NAVBAR END -->

    <!-- <video src=""   loop muted autoplay>
    </video> -->
 
    <video class="sleep-video" loop muted autoplay>
        <source src="/resources/video/video.mp4" type="video/mp4">
        
      </video>

      <div class="section two ">
        <div class="row" style="position:absolute; left:30%;  top:33%; z-index: 9;">
            <div class="col" style="margin-left:0px;font-weight:bolder;font-size: 10rem; color:transparent; text-shadow:  3px 3px 0px rgba(5,5,5, 0.2)">./CAMP.DO</div>
        </div>
      </div>
      <div class="section one  w-100 " >
        <div class="container" style="margin:10px; height:inherit; position:relative;">  
            <div class="row mb-0 mt-5" > 
                <h2 style="margin-top: 50px;">캠핑장</h2> 
            </div>
            <div class="row mt-5" style="width: 100%; flex-wrap: nowrap; align-items: center;">
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/1687845/pexels-photo-1687845.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/1061640/pexels-photo-1061640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/939723/pexels-photo-939723.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>

      </div>
      <div class="section two one"></div>
      <div class="section three">
        <div class="container" style="margin:10px; height:inherit; position:relative;">  
            <div class="row mb-0 mt-5" > 
                <h2 style="margin-top: 50px;">캠핑장</h2> 
            </div>
            <div class="row mt-5" style="width: 100%; flex-wrap: nowrap; align-items: center;">
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/1687845/pexels-photo-1687845.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/1061640/pexels-photo-1061640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
                <div class="card" style="width: 18rem; margin-right:20px; background-color: rgba(0, 0, 0, 0.2);">
                    <img src="https://images.pexels.com/photos/939723/pexels-photo-939723.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    </div>
                </div>
            </div>
        </div>
      </div>
      <div class="section four"></div>

  </body>
  </html>