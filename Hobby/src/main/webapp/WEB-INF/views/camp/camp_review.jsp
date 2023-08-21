<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장후기</title>
<style type="text/css">
#container {
    position: relative;
    margin: 0 auto;
}
    
#header {
    display: flex;
    align-items: center;
    position: absolute;
    left: 360px;
    top: -88px;
}

#camp_icon {
    width: 90px;
    height: 90px;
    display: inline-block;
    vertical-align: middle;
}

#review_title {
    display: inline-block;
    vertical-align: middle;
    margin: 0;
    padding-left: 15px;
}

#review_write_box {
    position: relative;  /* 상대 위치 지정 */
    border: 3px solid #D3D3D3; 
    padding: 10px; 
    width: 800px; 
    margin: 0 auto; 
    margin-top: 97px; /* 이 값을 조절하여 header와의 간격을 제공합니다. */
}

#review_write_box fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#review_write_box fieldset legend {
	text-align: right;
}

#review_write_box input[type=radio] {
	display: none;
}

#review_write_box label {
	font-size: xx-large;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
	cursor: pointer; /* 추가: 마우스 커서 모양을 변경 */
}

#review_write_box label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#review_write_box label.checked,
#review_write_box label:hover ~ label.checked {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	color: gold; /* 노란색으로 채우기 */
}

.review-box {
    display: flex; /* Flexbox 사용 */
    align-items: center; /* 아이템들을 중앙에 수직 정렬합니다 */
    border: 3px solid #D3D3D3; 
    padding: 10px; 
    width: 800px; 
    margin: 0 auto;
    margin-top: 10px;
}

.review-box > div {
    margin-right: 10px; /* 오른쪽 간격을 추가합니다. */
    flex: 1; /* 모든 아이템에 동일한 너비를 부여합니다. */
}

.review-box .user-id span {
    font-weight: bold;
}
.review-box .user-rating span,
.review-box .review-content {
    flex: 6; /* 다른 요소들보다 너비가 6배 넓습니다. */
}
.review-box .review-date {
    color: gray;
    font-size: 15px;
}

#reviewContents {
	width: 800px;
	height: 90px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
#submit_btn { 
	background-color: #548C54;
	width: 77px;
    height: 37px;
    margin-left: 392px;
    margin-top: 10px;
    color: white;
    font-size: 17px;
    font-weight: bold;
	border: none; 
    border-radius: 10px; 
}

</style>
</head>
<body>
    <link href="/assets/css/star.css" rel="stylesheet" />

<div id="container">
	<div id="header">
 	   <img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
 	   <h1 id="review_title">후기</h1>
	</div>
</div>
    <form class="review_write_box" name="review_write_box" id="review_write_box" method="post">
        <span class="text-bold" style="display: inline-block;"><h2>별점 선택</h2></span>
        <fieldset>
            <input type="radio" name="reviewStar" value="5" id="star1">
            <label class="star" for="star1">★</label>
            <input type="radio" name="reviewStar" value="4" id="star2">
            <label class="star" for="star2">★</label>
            <input type="radio" name="reviewStar" value="3" id="star3">
            <label class="star" for="star3">★</label>
            <input type="radio" name="reviewStar" value="2" id="star4">
            <label class="star" for="star4">★</label>
            <input type="radio" name="reviewStar" value="1" id="star5">
            <label class="star" for="star5">★</label>
        </fieldset>
	        <button type="submit" id="submit_btn" onclick="comment_go(this.form)">작 성</button>
        <div>
            <textarea class="reviewContents" type="text" id="reviewContents"
                placeholder="즐거웠던 여행후기를 남겨주세요."></textarea>
        </div>
    </form>
    
    <div class="review-box">
    	<div class="user-id"><span>exampleUser</span></div>
    	<div class="user-rating"><span>★★★★☆</span></div>
   		<div class="review-content">튜브타고 물에 둥둥 떠있고 싶다. 룰루랄라 하하하하 호호호호</div>
   		<div class="review-date">2023-08-18</div>
	</div>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".star").on('click', function() {
                var idx = $(this).index();
                $(".star").removeClass("checked");
                for (var i = 0; i <= idx; i++) {
                    $(".star").eq(i).addClass("checked");
                }
            });
        });
    </script>
</body>
</html>