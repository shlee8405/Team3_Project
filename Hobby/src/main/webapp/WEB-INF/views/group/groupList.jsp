<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑 모임</title>
<style>
.fixed-position {
	position: fixed;
	top: 60px;
	right: 10px;
	z-index: 9999;
}

.board-item {
	position: relative;
}

.board-item>p:last-child {
	position: absolute;
	right: 10px;
	bottom: 10px;
}

.fixed-position {
	position: fixed;
	top: 260px;
	right: 10px;
	z-index: 9999;
	padding: 5px; /* Adding some padding for better visibility */
}

.board-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
	padding: 20px;
}

.board-item {
	width: 300px;
	height: 310px;
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.thumbnail {
	width: 150px; /* Add "px" unit here */
	height: 150px;
}
/* 마우스커서 */
#group_item {
	cursor: pointer;
}

#group_item.hovered {
	cursor: grab;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column; /* 수직 방향으로 요소를 중앙 정렬하기 위함 */
}

#listgroup {
	margin: auto; /* 수직 중앙 정렬 */
}
/* paging */
ol.paging {
	list-style: none;
}

ol.paging li {
	float: left;
	margin-right: 8px;
}

ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.hide {
	display: none;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
/* 검색창 */
.search-box {
	padding: 10px;
	height: 50px;
	background-color: #fff;
	border: 1px solid #51e3d4;
	border-radius: 30px;
	width: 400px; /* 원하는 너비로 변경 */
	display: flex; /* 추가 */
	align-items: center; /* 추가 */
}

.serch_all {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; /* 이 부분은 중앙 정렬을 위해 추가한 것입니다. */
	border: 1px solid lightgray;
	margin: auto;
	border-radius: 10px;
	background: linear-gradient(90deg, rgba(147,188,136,0.24) 0%, rgba(180,188,136,0.24) 35%, rgba(200,180,146,0.24) 100%);
}
.serch_all2 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; /* 이 부분은 중앙 정렬을 위해 추가한 것입니다. */
	margin: auto;
	border-radius: 10px;
	
}

.search-container {
	display: flex;
	justify-content: center;
	width: 100%;
}
/* .search-box:hover{
  box-shadow: 0px 0px .5px 1px #51e3d4;
  width: 282px;
}  */
.search-btn {
	text-decoration: none;
	width: 30px;
	height: 30px;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #51e3d4;
}

.search-box:hover>.search-btn {
	background-color: #fff;
}

.search-box, .search_boxes {
	margin: 5px;
}

.search-box, .search_boxes {
	flex: 1;
}

.search-txt {
	flex: 1; /* 추가 */
	padding: 0;
	border: none;
	background: none;
	width: 200px; /* 원하는 너비로 변경 */
}

.button-container {
	display: flex;
	justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
	width: 100%;
}

.ser_btn {
	background-color: #548C54;
	width: 120px;
	height: 50px;
	font-size: 22px;
	font-weight: bold;
	border-radius: 10px;
	color: #FFFCFC;
	margin: 5px; /* 상하좌우 마진을 모두 5px로 설정 */
	cursor: pointer;
}
.container-top {
	width:100vw!important;
	margin-left:0px!important;
	margin-right:0px!important;
	height: 330px!imporant;
	transform: translateY(9vh)!important;
}

.carousel-item {
	height:380px!important;
}
.container-title {
	font-family: MBCM;
	font-size:10rem;
	position:absolute;
	z-index:9;
	top:15vh;
	margin: auto;
	width:100%;
	text-align:center;
	white-space: nowrap;
	font-size: 72px;
	background: -webkit-linear-gradient(rgba(221,221,221,0.8), rgba(20,20,20,0.6));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
} 

/* 페이지 기본 버튼 색상 변경 */
.pagination .page-link {
    color: #4CAF50; /* 녹색 텍스트 */
    border: 1px solid #4CAF50; /* 녹색 테두리 */
}

/* 페이지 활성화된 버튼의 배경 및 텍스트 색상 변경 */
.pagination .page-item.active .page-link {
    background-color: #4CAF50; /* 녹색 배경 */
    border-color: #4CAF50; /* 녹색 테두리 */
    color: white; /* 흰색 텍스트 */
}

/* 페이지 마우스 오버 시 버튼의 배경 및 텍스트 색상 변경 */
.pagination .page-link:hover {
    background-color: #45a049; /* 조금 더 진한 녹색 배경 */
    color: white; /* 흰색 텍스트 */
}

/* 페이지 비활성화된 버튼의 텍스트 색상 변경 */
.pagination .page-item.disabled .page-link {
    color: #a8d5a8; /* 연한 녹색 텍스트 */
}

#group_item{
	transition : all .2s ease-in-out;
}

#group_item:hover{
	transform: scale(1.05);
}

</style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
function group_write_go(f) {
	
	var sessionUidx = "${user.u_idx}";
	
	console.log('group_write_go function called');
    console.log('sessionUidx value:', sessionUidx);

    // sessionUidx 변수를 사용하여 ${user.u_idx} 값을 가져옵니다.
    var Uidx = sessionUidx;

    if (Uidx === null || Uidx === '') {
        alert('로그인이 필요한 기능입니다.');
        return false;
    } else {
        // Uidx 값을 사용하여 원하는 동작을 수행합니다.
        location.href = "/group_writeForm.do?u_idx=" + Uidx;
    }
}
	function allSearch() {
		location.href="/groupList.do";
	}

	function go_groupOnelist(f) {
		var cPage = ${paging.nowPage}
		var div = document.getElementById("group_item");
		div.classList.add("hovered");
	      div.addEventListener("mouseleave", function() {
	        div.classList.remove("hovered");
	      });
		
		location.href= "/group_onelist.do?g_idx="+ f+"&cPage="+cPage;
		console.log("g_idx");
	}

	function categoryChange(e) {
		  const state = document.getElementById("state");

		  const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		  const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
		  const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
		  const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		  const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
		  const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
		  const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
		  const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		  const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		  const ulsan = ["남구","동구","북구","중구","울주군"];
		  const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
		  const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		  const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
		  const jeju = ["서귀포시","제주시","남제주군","북제주군"];
		  const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];

		  if (e.value == "강원") {
		    add = gangwon;
		  } else if (e.value == "경기") {
		    add = gyeonggi;
		  } else if (e.value == "경남") {
		    add = gyeongsangnam;
		  } else if (e.value == "경북") {
		    add = gyeongsangbuk;
		  } else if (e.value == "광주") {
		    add = gwangju;
		  } else if (e.value == "대구") {
		    add = daegu;
		  } else if (e.value == "대전") {
		    add = daejeon;
		  } else if (e.value == "부산") {
		    add = busan;
		  } else if (e.value == "서울") {
		    add = seoul;
		  } else if (e.value == "울산") {
		    add = ulsan;
		  } else if (e.value == "인천") {
		    add = incheon;
		  } else if (e.value == "전남") {
		    add = jeonnam;
		  } else if (e.value == "전북") {
		    add = jeonbuk;
		  } else if (e.value == "제주") {
		    add = jeju;
		  } else if (e.value == "충남") {
		    add = chungnam;
		  } else if (e.value == "충북") {
		    add = chungbuk;
		  }

		  state.options.length = 1;
		  // 군/구 갯수;
			for (property in add) {
				let opt = document.createElement("option");
				opt.value = add[property];
				opt.innerHTML = add[property];
				state.appendChild(opt);
			}
		}

	// 검색액션
	/*
	 $(document).ready(function() {
            $("#myButton_ok").click(function() {
		 $(".board-container").empty();
                // 입력 값을 가져옵니다.
                var title = $(".search-txt").val();
                var city = $("select[name='']").val();
                var state = $("#state").val();

                
                // AJAX 요청을 보냅니다.
                $.ajax({
                	url: '/search', // 요청할 서버의 URL
                    type: 'GET', // HTTP 메서드 (GET 또는 POST)
                    data: { // 서버로 보낼 데이터
                        title: title,
                        city: city,
                        state: state
                    },
                    
                    success: function(data) {
                    	
                        console.log(title);
                        console.log(city);
                        console.log(state);
                        
                        console.log("Success! Data received:", data);
                        $(".board-container").html(data);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error fetching data:", error);
                    }

                });
            });
        });*/
</script>

</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="container-top"  >
			<section>
	    		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	    		
	        		<div class="carousel-inner">
	            		<div class="carousel-item active">
	               			 <img src="resources/images/camp_search_box2.jpg" class="d-block" alt="...">
	           			</div>
	            		<div class="carousel-item">
	                		<img src="resources/images/camp_search_box3.jpg" class="d-block" alt="...">
	            		</div>
	            		<div class="carousel-item">
	                		<img src="resources/images/camp_search_box1.jpg" class="d-block" alt="...">
	            		</div>
	            		<!--https://upload.wikimedia.org/wikipedia/commons/8/8d/Yarra_Night_Panorama%2C_Melbourne_-_Feb_2005.jpg-->
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
			</section>
			<div class="container-title" style="font-family:MBCM; font-size:10rem; ">
				/캠핑모임.do
			</div>
	</div>
	<div class="container mb-5"  >
		<div style="position: relative; top: 200px; z-index: 1; margin-bottom:200px;">
		<form action="/search.do" method="get">
			<div class="serch_all" style="width: 800px">
				<h2 style="margin-top: 20px; text-align: left; font-family:MBCM; font-size:3rem;">모임 검색</h2>
				<br>
				<div class="search-container">
					<div class="search-box ms-5" style="background-color:rgba(20,20,20,0.1);">
						<input type="text" class="search-txt ms-2" name="title"
							placeholder="제목을 입력하세요" style="font-family:TAEBAEK; font-weight:bold;" >
					</div>
					&nbsp;&nbsp; <br>
					<div class="search_boxes">
						<select name="city" id="" onchange="categoryChange(this)"
							style="height: 40px; width: 120px; border-radius: 30px;font-family:TAEBAEK; font-weight:bold;">
							<option value="">시/도 선택</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="경남">경남</option>
							<option value="경북">경북</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="서울">서울</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="전남">전남</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="충남">충남</option>
							<option value="충북">충북</option>
						</select>&nbsp; <select name="state" id="state"
							style="height: 40px; width: 120px; border-radius: 30px;font-family:TAEBAEK;font-weight:bold; ">
							<option value="">군/구 선택</option>
						</select>
					</div>
				</div>
				&nbsp;&nbsp;
				<!-- <div class="button-container">
				<button class="ser_btn" id="myButton_ok">검색</button>
			</div> -->
				<div class="button-container">
					<input class="ser_btn" type="submit" value="검색">
				</div>
			</div>
		</form>
		<br>
		<div id="listgroup" class="mt-3 pt-3" style="width: 1000px; margin-bottom:250px; border:0px solid black; border-radius:10px; background-color: rgba(200, 180, 146, 0.24); ">
			<h3 style="font-family: MBCM; text-align:center;">모임</h3>
			<div class="board-container">
				<c:choose>
					<c:when test="${empty glist}">
						<div class="board-item">
							<h3>작성된 글이 없습니다.</h3>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${glist}">
							<div id="group_item" class="board-item"
								onclick="go_groupOnelist(${k.g_idx})" style="border-radius:10px; background-color:rgba(150,200,100,0.15);">
								<c:set var="thumbnailSrc" value="/resources/images/캠핑.png" />
								<c:if test="${not empty k.g_fname}">
									<c:set var="thumbnailSrc"
										value='/resources/images/${k.g_fname}' />
								</c:if>
								<img class="thumbnail"
									src="${pageContext.request.contextPath}${thumbnailSrc}">
								<h4 style="margin-top: 20px">${k.g_title}</h4>
								<p>${k.g_intro}</p>
								<p class="fixed-position">${k.g_cdo}${k.g_gugun}</p>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="button-container"
				style="width: 100%; margin-right: 600px;">
				<button id="write_btn" class="ser_btn"
					onclick="group_write_go(this.form, '${user.u_idx}')">글쓰기</button>
				<br>
				<button id="allSearch" class="ser_btn" onclick="allSearch()">전체보기</button>
			</div>
			
			<div class="serch_all2">
			    <nav aria-label="Page navigation example">
			        <ul class="pagination">
			            <!-- 첫 페이지 버튼 -->
			            <li class="page-item">
			                <a class="page-link" href="/groupList.do?cPage=1" aria-label="First">
			                    <span aria-hidden="true">&laquo;&laquo;</span>
			                </a>
			            </li>
			            <!-- 이전 버튼 -->
						<c:choose>
						    <c:when test="${paging.nowPage <= 1}">
						        <li class="page-item disabled">
						            <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&laquo;</span></a>
						        </li>
						    </c:when>
						    <c:otherwise>
						        <li class="page-item">
						            <a class="page-link" href="/groupList.do?cPage=${paging.nowPage - 1}">
						                <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose>
			
			            <!-- 페이지번호들 -->
			            <c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
			                <c:if test="${k == paging.nowPage}">
			                    <li class="page-item active"><a class="page-link" href="#">${k}</a></li>
			                </c:if>
			                <c:if test="${k != paging.nowPage}">
			                    <li class="page-item"><a class="page-link" href="/groupList.do?cPage=${k}">${k}</a></li>
			                </c:if>
			            </c:forEach>
			
			            <!-- 이후 버튼 -->
			            <c:choose>
			                <c:when test="${paging.endBlock >= paging.totalPage}">
			                    <li class="page-item disabled">
			                        <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&raquo;</span></a>
			                    </li>
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item">
			                        <a class="page-link" href="/groupList.do?cPage=${paging.nowPage+1}">
			                            <span aria-hidden="true">&raquo;</span>
			                        </a>
			                    </li>
			                </c:otherwise>
			            </c:choose>
			            <!-- 마지막 페이지 버튼 -->
			            <li class="page-item">
			                <a class="page-link" href="/groupList.do?cPage=${paging.totalPage}" aria-label="Last">
			                    <span aria-hidden="true">&raquo;&raquo;</span>
			                </a>
			            </li>
			        </ul>
			    </nav>
			</div>

		</div>
	</div>
	</div>
</body>
</html>