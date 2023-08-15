<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 상세보기</title>
</head>
<body>
	<h1>${cvo.facltNm}</h1>
	<p><font color="gray">${cvo.lineIntro}</font></p>
	<p><img src='${cvo.firstImageUrl}' width="500px"></p>
	<p><strong>주소 : </strong>${cvo.addr1}</p>
	<p><strong>문의처 : </strong>${cvo.tel}</p>
	<p><strong>운영일 : </strong>${cvo.operDeCl}</p>
	<p><strong>캠핑장 환경 : </strong>${cvo.lctCl}</p>
	<p><strong>캠핑장 유형 : </strong>${cvo.induty}</p>
	<p><strong>주변이용가능시설 : </strong>${cvo.posblFcltyCl}</p>
	<p><strong>소개글 : </strong>${cvo.featureNm}</p>
	
	<%-- 카카오맵 api --%>
		<h2>찾아오시는 길</h2>
		<div id="map" style="width: 500px; height: 400px;"></div>
	<%-- 지도를 그리는 Javascript API를 불러오기 --%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a447b9339cfa86beab10e8ff569b495"></script>
		<script type="text/javascript">
			var mapX = ${cvo.mapX} //API로부터 받은 캠핑장의 X좌표
			var mapY = ${cvo.mapY} //API로부터 받은 캠핑장의 Y좌표
			
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(mapY, mapX), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(mapY, mapX);  // 마커가 표시될 위치 
			var marker = new kakao.maps.Marker({  // 마커를 생성한다
			    position: markerPosition
			});

			marker.setMap(map); // 마커가 지도 위에 표시되도록 설정한다

			// 아래 코드는 지도 위의 마커를 제거하는 코드이다
			// marker.setMap(null);
	</script>
</body>
</html>