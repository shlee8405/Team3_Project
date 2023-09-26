<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
	#container table {
	    width:1000px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid lightgray;
	    border-radius: 10px; 
	    border-collapse:collapse;
	    font-size:14px;
	}
	
	#container table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#container table th {
	    text-align:center;
	    border:1px solid lightgray;
	    padding:4px 10px;
	}
	
	#container table td {
	    text-align:left;
	     border:1px solid lightgray;
	    padding:4px 10px;
	}
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	
	.note-modal-backdrop {
    display: none !important;
	}
	
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function sendData(f) {
		// 유효성 검사 
		const cdo = document.getElementById("g_cdo").value;
    const gugun = document.getElementById("g_gugun").value;
		if(f.g_title.value.trim().length <=0){
			alert("제목을 입력하세요");
			f.g_title.focus();
			return;
		}
		if(f.g_maxPeople.value.trim().length <=0){
			alert("총인원을 입력하세요");
			f.g_maxPeople.focus();
			return;
		}
		if(f.g_intro.value.trim().length <=0){
			alert("모임소개를 입력하세요");
			f.g_intro.focus();
			return;
		}
		if(f.g_desc.value.trim().length <=0){
			alert("내용을 입력하세요");
			f.g_desc.focus();
			return;
		}
		if(f.g_date.value.trim().length <=0){
			alert("날짜를 입력하세요");
			f.g_date.focus();
			return;
		}
		if(f.g_location.value.trim().length <=0){
			alert("캠핑 장소를 입력하세요");
			f.g_location.focus();
			return;
		}
		if (cdo === "시/도 선택" || gugun === "군/구 선택") {
		      alert("지역을 선택하세요");
		      return;
		    }
		
		f.action="/groupInsert.do";
		f.submit();
	}
	function list_go(f) {
		f.action="/groupList.do";
		f.submit();
	}
	function categoryChange(e) {
		  const state = document.getElementById("g_gugun");

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

		  g_gugun.options.length = 1;
		  // 군/구 갯수;
			for (property in add) {
				let opt = document.createElement("option");
				opt.value = add[property];
				opt.innerHTML = add[property];
				g_gugun.appendChild(opt);
			}
		}
</script>

<script type="text/javascript">
    function limitInputLength(event) {
        if (event.target.value.length > 18) {
            event.target.value = event.target.value.slice(0, 18);
            alert("17자 이하로 작성해주세요");
        }
    }

</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0y5NLA313y5Ora0HXJz4C+KY4Ck4SOF4y4Ck4SOF4y4Ck4C2DgHfViXydVeLm+JDM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-0y5NLA313y5Ora0HXJz4C+KY4Ck4SOF4y4Ck4SOF4y4Ck4C2DgHfViXydVeLm+JDM" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
	
		<div id="container" style="width: 50%; margin: auto; background-color: skyblue; height: 120vh; border-radius: 10px; padding: 15px;">
    	<div id="container" style="background-color: white; height: 117.3vh; border-radius: 10px;">
		
		<h2 style="margin: auto; text-align: center;">모임 개설하기</h2>
		
			<form method="post" enctype="multipart/form-data">
				<div class="container-fluid ask-form" summary="게시판 글쓰기">
					<div>
						<div class="mb-3">
							<label class="form-label">제목</label>	
							<div><input class="form-control" type="text" name="g_title" size="45"/></div>
						</div>
						<div class="mb-3" style="width: 20%;">
							<label class="form-label">작성자</label>
							<div><input class="form-control" type="text" name="u_idx" value="${user.u_nickname}" readonly /></div>
						</div>
						<div class="mb-3" style="width: 20%;">
							<label class="form-label">모임 총인원</label>
							<div><input class="form-control" type="number" name="g_maxPeople" /></div>
						</div>
						<div class="mb-3">
							<label class="form-label">썸네일 이미지</label>  <!-- 첨부파일 유효성검사 해주자 -->
							<div><input class="form-control" type="file" name="file"/></div>
						</div>
						<div class="mb-3">
							<label class="form-label">모임 소개</label>  <!-- 첨부파일 유효성검사 해주자 -->
							<div><input class="form-control" type="text" name="g_intro" size="60" oninput="limitInputLength(event)"/></div>
						</div>
						<div class="mb-3">
							<label class="form-label">캠핑 날짜</label>
							<div style="width: 20%"><input class="form-control" type="datetime-local" name="g_date" size="10" id="g_date"/></div>
						</div>
						<div class="mb-3">
							<label class="form-label">캠핑 장소</label>
							<div style="width: 20%;">
								<div class="search_boxes">
					            <select class="form-control" name="g_cdo" id="g_cdo" onchange="categoryChange(this)">
					              <option>시/도 선택</option>
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
					            </select>
					          
					            <select class="form-control" name="g_gugun" id="g_gugun">
					              <option>군/구 선택</option>
					            </select>
					          	</div>
					          	<input class="form-control" type="text" name="g_location" id="g_location" placeholder="캠핑장 이름을 입력하세요"/>
					          </div>
						</div>
						<div class="mb-3">
							<!-- <label class="form-label">내용</label> -->
							<div colspan="2"><textarea name="g_desc" cols="60" rows="10" id="g_desc"></textarea></div>
						</div>
						<div class="mb-3 d-flex justify-content-end">
						    <input class="form-control me-2" type="button" value="완료" onclick="sendData(this.form)" style="width: 80px;"/>
						    <input class="form-control" type="button" value="취소" onclick="list_go(this.form)" style="width: 80px;"/>
						</div>
					</div>
				</div>
				<br><br><br><br>
			</form>
			</div>
			</div>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
		    	<script src="resources/js/summernote-lite.js"></script>
		    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
		    	<script type="text/javascript">
		    	$(function(){
		    		$('#g_desc').summernote({
		    	        lang : 'ko-KR',
		    	        height : 300,
		    	        focus : true,
		    	        callbacks : {
		    	            onImageUpload :  function(files, editor){
		    	                for (var i = 0; i < files.length; i++) {
		    	                    sendImage(files[i], editor);
		    	                }
		    	            }
		    	        }
					});
		    	});
		    	function sendImage(file, editor) {
					var frm = new FormData();
					frm.append("s_file",file);
					$.ajax({
						url : "/saveImage.do",
						data : frm,
						type : "post",
						contentType : false,
						processData : false,
						dataType : "json",
					}).done(function(data) {
						var path = data.path;
						var fname = data.fname;
						alert("path : "+path+"\nfname : "+fname);
						$("#g_desc").summernote("editor.insertImage",path+"/"+fname);
					});
				}
		    	</script>
			</div>
    	
</body>
</html>