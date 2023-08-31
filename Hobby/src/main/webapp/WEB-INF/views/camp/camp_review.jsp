<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장후기</title>
<style type="text/css">
.reviewBox {
  border: 1px solid #ccc;  				 /* 1px 두께의 회색 테두리 */
  padding: 20px;           				 /* 내부 패딩 */
  border-radius: 5px;       			 /* 모서리 둥글게 */
  box-shadow: 0 0 10px rgba(0,0,0,0.1);  /* 그림자 효과 */
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
</style>

<!-- 평균 별점 -->
<div class="container mt-5">
	<div id="title">
		<img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
		<h2 id="review_title" style="font-weight: bolder;">후기</h2>
	</div>

	<h2>평균 별점</h2>
	<div class="star-display">
		<c:forEach begin="1" end="${averageRating}" varStatus="status">
			<span class="star checked">★</span>
		</c:forEach>
		<c:forEach begin="${averageRating + 1}" end="5" varStatus="status">
			<span class="star">★</span>
		</c:forEach>
	</div>
</div>

<!-- 별점 평가 폼 -->
<div class="container mt-5">
	<div class="reviewBox">
	<h2>후기 남기기</h2>
	<form action="/addReview.do" method="post" class="mt-3">
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
		<button type="submit" class="btn btn-primary">후기 남기기</button>
		<input type="hidden" name="facltNm" value="${cvo.facltNm}"> <input
			type="hidden" name="u_Id" value="user02"> <!-- 로그인한 회원 ID 수정하기 -->
	</form>
	</div>
</div>

<!-- 저장된 후기와 별점 보여주기 -->
<div class="container mt-5">
	<h2>후기 목록</h2>
	<c:forEach items="${reviews}" var="review">
		<div class="card mt-3">
			<div class="card-body">
				<h5 class="card-title">${review.comment}</h5>
				<p class="card-text">
					<c:forEach var="i" begin="1" end="${review.rating}">
						<span class="star filled">★</span>
					</c:forEach>
					<c:forEach var="i" begin="${review.rating + 1}" end="5">
						<span class="star">★</span>
					</c:forEach>
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
});

</script>