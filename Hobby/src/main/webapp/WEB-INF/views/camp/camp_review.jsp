<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장후기</title>
<style type="text/css">
#header {
    display: flex;
    align-items: center;
    padding: 10px 0;
}

#camp_icon {
    width: 90px;
    height: 90px;
    margin-right: 15px;
}

#review_write_box {
    border: 3px solid #D3D3D3;
    padding: 10px;
    margin-top: 20px;
}

#review_write_box fieldset {
    display: inline-block;
    direction: rtl;
    border: 0;
}

#review_write_box input[type=radio] {
    display: none;
}

#review_write_box label {
    font-size: xx-large;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
    cursor: pointer;
}

#review_write_box label:hover {
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#review_write_box label.checked,
#review_write_box label:hover ~ label.checked {
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color: gold;
}


.review-box {
    display: flex;
    align-items: center; 
    border: 3px solid #D3D3D3;
    padding: 10px;
    margin-top: 10px;
}

.review-box > div {
    margin-right: 10px; 
    flex-shrink: 0; /* 항목들이 줄어들지 않게 설정 */
}

.review-box .user-id {
    font-weight: bold;
}

.review-box .user-rating {
    font-size: 18px;
    margin-right: 15px; /* 별점과 리뷰 내용 사이의 간격 */
}

.review-box .review-content {
    flex: 1; /* 리뷰 내용이 남은 공간을 모두 차지하도록 설정 */
    word-wrap: break-word; 
}

.review-box .review-date {
    white-space: nowrap;
    color: gray;
    font-size: 15px;
    margin-left: 10px; /* 리뷰 내용과 날짜 사이의 간격 */
}


#reviewContents {
    width: 100%;
    height: 90px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
    margin-bottom: 10px;
}

.text-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.rating-section {
    display: flex;
    align-items: center;
}

#submit_btn {
    background-color: #548C54;
    width: 77px;
    height: 37px;
    margin-left: auto;  /* 왼쪽으로부터 자동 마진을 적용하여 오른쪽 끝으로 밀어줌 */
    color: white;
    font-size: 17px;
    font-weight: bold;
    border: none;
    border-radius: 10px;
}

</style>

<div id="container">
    <div id="header">
        <img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
        <h1 id="review_title">후기</h1>
    </div>
    <form name="review_write_box" id="review_write_box" method="post">
<div class="text-head">
    <div class="rating-section">
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
    </div>
    <button type="submit" id="submit_btn">작 성</button>
</div>
        <textarea class="reviewContents" id="reviewContents" placeholder="즐거웠던 여행후기를 남겨주세요."></textarea>
      </form>

  	<div class="review-box">
	   	<div class="user-id"><span>exampleUser</span></div>
	   	<div class="user-rating"><span>★★★★☆</span></div>
	  		<div class="review-content">튜브타고 물에 둥둥 떠있고 싶다. 룰루랄라 하하하하 호호호호호호호호호호호호호호호호호호호호호호호호</div>
	  		<div class="review-date">2023-08-18</div>
		</div>
  	</div>
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