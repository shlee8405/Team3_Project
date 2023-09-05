<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장후기</title>
<style type="text/css">
@font-face {
     font-family: Jua-Regular;
     src: url(/resources/fonts/Jua-Regular.ttf);
}

#title{
	font-family: Jua-Regular;
    font-size:50px;
}

#review_title{
    margin-top: 10px;
}

.reviewBox {
  font-family: Jua-Regular;
  font-size:30px;
  border: 1px solid #ccc;  				 /* 1px 두께의 회색 테두리 */
  padding: 20px;           				 /* 내부 패딩 */
  border-radius: 5px;       			 /* 모서리 둥글게 */
  box-shadow: 0 0 10px rgba(0,0,0,0.1);  /* 그림자 효과 */
}

.form-control{
	font-family: Jua-Regular;
  	font-size:20px;
}

.star {
	font-size: 1.5em;
	cursor: pointer;
	color: grey;
}

/* 선택된 별 및 이전 별들은 노란색으로 표시 */
[type="radio"]:checked ~ .star, [type="radio"]:not(:checked) ~ .star {
	color: gold;
}

.star-rating .star {
	cursor: pointer; /* 후기 남기기 섹션에서만 별에 커서 스타일 적용 */
}

.checked, .filled {
	color: gold;
}

/* 평균 별점 및 후기 목록에서 별은 클릭할 수 없게 만듭니다. */
.star-display .star, .card-text .star {
	pointer-events: none;
}

.review_list{
	text-align: center;
	font-family: Jua-Regular;
  	font-size:30px;
}

.card-body {
    position: relative;
    font-family: Jua-Regular;
}
.card-body .card-text {
    font-size: 50px;  /* 원하는 크기로 설정 */
}

.card-body .card-title {  /* 후기 내용 */
    font-size: 25px;
}

.card-body .card-subtitle { /* 작성자, 작성일 */
    font-size: 20px;  
    margin-top: 15px;
}

.card-body .card-subtitle { /* 작성자, 작성일 */
    font-size: 20px;  
    margin-top: 15px;
}

.card-body .star {  /* 별 하나 크기 */
    font-size: 30px; 
}

.card-body .star.filled { /* 별 묶음 */
    font-size: 30px;  
}

.card-body .delete-button { /* 삭제 버튼 */
    font-size: 20px;  
}

.card-subtitle {
    display: flex;
    justify-content: space-between;
}
</style>

<!-- 평균 별점 -->
<div class="container mt-5">
	<div id="title">
		<img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
		<div id="review_title" style="font-weight: bolder;">후기</div>
	</div>
</div>

<!-- 별점 평가 폼 -->
<div class="container mt-5">
	<div class="reviewBox">
	<span>후기를 작성해주세요.</span>
	<form id="reviewForm" action="/addReview.do" method="post" class="mt-3">
		<div class="form-group star-rating">
			<label class="star">★</label> 
			<label class="star">★</label> 
			<label class="star">★</label> 
			<label class="star">★</label> 
			<label class="star">★</label> 
			<input type="hidden" name="rating" id="ratingValue">
		</div>
		<div class="form-group">
			<textarea class="form-control" rows="4" id="comment" name="comment"></textarea>
		</div>
		<button type="submit" class="btn btn-success">후기 남기기</button>
		<input type="hidden" name="facltNm" value="${cvo.facltNm}"> 
	</form>
	</div>
</div>

<!-- 저장된 후기와 별점 보여주기 -->
<div class="container mt-5">
	<c:forEach items="${reviews}" var="review">
		<div class="card mt-3">
			<div class="card-body">
				<!-- 별점 표시와 삭제 버튼 -->
                <div class="d-flex justify-content-between align-items-center">
                    <p class="card-text mb-0">
                        <c:forEach var="i" begin="1" end="${review.rating}">
                            <span class="star filled">★</span>
                        </c:forEach>
                        <c:forEach var="i" begin="${review.rating + 1}" end="5">
                            <span class="star">★</span>
                        </c:forEach>
                    </p>
                    
                    <!-- 삭제 버튼 -->
					<c:if test="${sessionUidx == review.u_idx}">
					    <form id="deleteForm_${review.id}" action="/deleteReview.do" method="post">
					        <input type="hidden" name="id" value="${review.id}">
					        <input type="hidden" name="facltNm" value="${review.facltNm}">
					        <button type="button" onclick="confirmDelete(${review.id})" class="btn btn-link btn-sm delete-button">X</button>
					    </form>
					</c:if>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">${review.comment}</h5>
                </div>
                <!-- 닉네임과 날짜 추가 -->
                <p class="card-subtitle mb-2 text-muted">
                    <span>${review.u_nickname}님</span>
                    <span>${review.formatted_date}</span>
                </p>
			</div>
		</div>
	</c:forEach>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $(".star-rating .star").on('click', function() { // 후기 남기기 섹션에서만 별 클릭 이벤트를 적용
        var idx = $(this).index();
        $(".star-rating .star").removeClass("checked");
        for (var i = 0; i <= idx; i++) {
            $(".star-rating .star").eq(i).addClass("checked");
        }
        // 별점 값을 숨겨진 input에 저장
        $("#ratingValue").val(idx + 1);
    });
    
 	// 별점 선택 강요
    $("#reviewForm").on('submit', function(e) {
        if ($("#ratingValue").val() == "") {
            alert("별점을 선택해주세요.");
            e.preventDefault();
        }
    });
});

// 삭제 확인
function confirmDelete(reviewId) {
    var r = confirm("정말 삭제하시겠습니까?");
    if (r == true) {
        // 삭제 로직 실행
        document.getElementById('deleteForm_' + reviewId).submit();
    }
}

</script>