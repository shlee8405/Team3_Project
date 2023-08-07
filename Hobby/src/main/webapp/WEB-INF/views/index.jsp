<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Material Design for Bootstrap</title>
<link rel="stylesheet" href="resources/css/style.css" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="resources/css/mdb.min.css" />
<!-- Custom styles -->
<style>
/* Carousel styling */
#introCarousel, .carousel-inner, .carousel-item, .carousel-item.active {
	height: 100vh;
}

.carousel-item:nth-child(1) {
	background-image:
		url('https://mdbootstrap.com/img/Photos/Others/images/76.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.carousel-item:nth-child(2) {
	background-image:
		url('https://mdbootstrap.com/img/Photos/Others/images/77.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.carousel-item:nth-child(3) {
	background-image:
		url('https://mdbootstrap.com/img/Photos/Others/images/78.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

/* Height for devices larger than 576px */
@media ( min-width : 992px) {
	#introCarousel {
		margin-top: -58.59px;
	}
}

.navbar .nav-link {
	color: #fff !important;
}
</style>
<script type="text/javascript" src="resources/js/mdb.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="resources/js/script.js">
	
</script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>
<script type="text/javascript">
	function go_camp() {
		location.href = "/camp.do"
	}

	function go_group() {
		location.href = "/group.do"
	}

	function go_login() {
		location.href = "/login.do"

	}
	function go_signup() {
		location.href = "/signup.do"

	}
	function go_hello() {
		location.href = "/hello.do"

	}
	function go_world() {
		location.href = "/world.do"

	}
	function go_test() {
		location.href = "/test.do"

	}
	function go_map() {
		location.href = "/map.do"
	}
	function go_admin() {
		location.href = "/adminHome.do"
	}
</script>
</head>
<body>
	<!--Main Navigation-->
	<header>
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark d-none d-lg-block"
			style="z-index: 2000;">
			<div class="container-fluid">
				<!-- Navbar brand -->
				<a class="navbar-brand nav-link" target="_blank"
					href="https://mdbootstrap.com/docs/standard/"> <strong>MDB</strong>
				</a>
				<button class="navbar-toggler" type="button"
					data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
					aria-controls="navbarExample01" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarExample01">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item active"><a class="nav-link"
							aria-current="page" href="#intro">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="https://www.youtube.com/channel/UC5CF7mLQZhvx8O5GODZAhdA"
							rel="nofollow" target="_blank">Learn Bootstrap 5</a></li>
						<li class="nav-item"><a class="nav-link"
							href="https://mdbootstrap.com/docs/standard/" target="_blank">Download
								MDB UI KIT</a></li>
					</ul>

					<ul class="navbar-nav list-inline">
						<!-- Icons -->
						<li class=""><a class="nav-link"
							href="https://www.youtube.com/channel/UC5CF7mLQZhvx8O5GODZAhdA"
							rel="nofollow" target="_blank"> <i class="fab fa-youtube"></i>
						</a></li>
						<li class=""><a class="nav-link"
							href="https://www.facebook.com/mdbootstrap" rel="nofollow"
							target="_blank"> <i class="fab fa-facebook-f"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="https://twitter.com/MDBootstrap" rel="nofollow"
							target="_blank"> <i class="fab fa-twitter"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="https://github.com/mdbootstrap/mdb-ui-kit" rel="nofollow"
							target="_blank"> <i class="fab fa-github"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Navbar -->

		<!-- Carousel wrapper -->
		<div id="introCarousel"
			class="carousel slide carousel-fade shadow-2-strong"
			data-mdb-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="0"
					class="active"></li>
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="1"></li>
				<li data-mdb-target="#introCarousel" data-mdb-slide-to="2"></li>
			</ol>

			<!-- Inner -->
			<div class="carousel-inner">
				<!-- Single item -->
				<div class="carousel-item active">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
						<div
							class="d-flex justify-content-center align-items-center h-100">


							<div class="text-center">
								<a href="" class="btn btn-default btn-rounded mb-4"
									data-toggle="modal" data-target="#modalLoginForm">Launch
									Modal Login Form</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Single item -->
				<div class="carousel-item">
					<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h2>You can place here any content</h2>
							</div>
						</div>
					</div>
				</div>

				<!-- Single item -->
				<div class="carousel-item">
					<div class="mask"
						style="background: linear-gradient(45deg, rgba(29, 236, 197, 0.7), rgba(91, 14, 214, 0.7) 100%);">
						<div
							class="d-flex justify-content-center align-items-center h-100">
							<div class="text-white text-center">
								<h2>And cover it with any mask</h2>
								<a class="btn btn-outline-light btn-lg m-2"
									href="https://mdbootstrap.com/docs/standard/content-styles/masks/"
									target="_blank" role="button">Learn about masks</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Inner -->

			<!-- Controls -->
			<a class="carousel-control-prev" href="#introCarousel" role="button"
				data-mdb-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#introCarousel" role="button"
				data-mdb-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<!-- Carousel wrapper -->
	</header>





	<!--Main layout-->
	<main class="mt-5">
		<div class="container">
			<!--Section: Content-->
			<section>
				<div class="row justify-content-center">
					<div class="col-auto">
						<table class="table table-responsive">
							<thead>
								<tr>
									<th>캠핑장</th>
									<th>캠핑장모임</th>
									<th>로그인</th>
									<th>회원가입</th>
									<th>Hello</th>
									<th>World</th>
									<th>modal</th>
									<th>지도</th>
									<th>관리자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<button onclick="go_camp()">캠핑장</button>
									</td>
									<td>
										<button onclick="go_group()">캠핑장모임</button>
									</td>
									<td>
										<button onclick="go_login()">로그인</button>
									</td>
									<td>
										<button onclick="go_signup()">회원가입</button>
									</td>
									<td>
										<button onclick="go_hello()">Hello</button>
									</td>
									<td>
										<button onclick="go_world()">World</button>
									</td>
									<td><button onclick="go_test()">TEST</button></td>
									<td>
										<button onclick="go_map()">지도</button>
									</td>
									<td>
										<button onclick="go_admin()">관리자</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
	</main>
	<!--Main layout-->

	<!--Footer-->
	<footer class="bg-light text-lg-start">
		<div class="py-4 text-center">
			<a role="button" class="btn btn-primary btn-lg m-2"
				href="https://www.youtube.com/channel/UC5CF7mLQZhvx8O5GODZAhdA"
				rel="nofollow" target="_blank"> Learn Bootstrap 5 </a> <a
				role="button" class="btn btn-primary btn-lg m-2"
				href="https://mdbootstrap.com/docs/standard/" target="_blank">
				Download MDB UI KIT </a>
		</div>

		<hr class="m-0" />

		<div class="text-center py-4 align-items-center">
			<p>Follow MDB on social media</p>
			<a href="https://www.youtube.com/channel/UC5CF7mLQZhvx8O5GODZAhdA"
				class="btn btn-primary m-1" role="button" rel="nofollow"
				target="_blank"> <i class="fab fa-youtube"></i>
			</a> <a href="https://www.facebook.com/mdbootstrap"
				class="btn btn-primary m-1" role="button" rel="nofollow"
				target="_blank"> <i class="fab fa-facebook-f"></i>
			</a> <a href="https://twitter.com/MDBootstrap"
				class="btn btn-primary m-1" role="button" rel="nofollow"
				target="_blank"> <i class="fab fa-twitter"></i>
			</a> <a href="https://github.com/mdbootstrap/mdb-ui-kit"
				class="btn btn-primary m-1" role="button" rel="nofollow"
				target="_blank"> <i class="fab fa-github"></i>
			</a>
		</div>

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			© 2020 Copyright: <a class="text-dark"
				href="https://mdbootstrap.com/">MDBootstrap.com</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!--Footer-->
	<!-- MDB -->

</body>
</html>