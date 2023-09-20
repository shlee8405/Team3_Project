<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.fixed-position {
	position: fixed;
	top: 10px;
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
	top: 250px;
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
	background-color: rgba(128, 128, 0, 0.2);
}

.search-container {
	display: flex;
	justify-content: center;
	width: 100%;
}
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
</style>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


</head>
<body>
	<div id="listgroup" style="width: 1000px;">
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
							onclick="go_groupOnelist(${k.g_idx})">
							<c:set var="thumbnailSrc" value="/resources/images/캠핑.png" />
							<c:if test="${not empty k.g_fname}">
								<c:set var="thumbnailSrc" value='/resources/images/${k.g_fname}' />
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
			 <ol class="paging">
					<!-- 이전 버튼 -->
					<c:choose>
						<c:when test="${paging.beginBlock <= 1}">
							<li class="hide">이전으로</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/groupList.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
						</c:otherwise>
					</c:choose>

					<!-- 페이지번호들 -->
					<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }"
						step="1" var="k">
						<!--  현재 페이지는 링크 X, 나머지 페이지는 해당 페이지로 이동하게 링크 처리 -->
						<c:if test="${ k == paging.nowPage}">
							<li class="now">${k}</li>
						</c:if>
						<c:if test="${ k != paging.nowPage}">
							<li><a href="/groupList.do?cPage=${k}">${k}</a></li>
						</c:if>
					</c:forEach>

					<!-- 이후 버튼 -->
					<c:choose>
						<c:when test="${paging.endBlock >= paging.totalPage }">
							<li class="hide">다음으로</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/groupList.do?cPage=${paging.nowPage+paging.pagePerBlock}">다음으로</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
		</div>
	</div>
</body>
</html>