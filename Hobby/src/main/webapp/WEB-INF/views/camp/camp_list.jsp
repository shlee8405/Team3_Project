<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑장 리스트</title>
<%-- jQuery 라이브러리 CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	/* html문서가 준비되면 실행 */
	$(document).ready(function(){
		var pageNo = 1;
		
		/* more-btn이 클릭되면 실행됨 */
		$("#more-btn").on("click", function() {
			
			$.ajax({
				url : "/campList.do",
				method : "get",
				data : {pageNo: pageNo},
				dataType : "json", 
				success : function(data) {
					var list = "";
					
					// $.each() 함수를 사용하여 서버에서 받아온 데이터를 반복적으로 처리하는 HTML 내용을 생성
					$.each(data, function (index, item) {
						list += "<div>"
						+ "<a href='/campDetail.do?keyword=" + item.facltNm + "'>" + item.facltNm + "</a>"
						+ "<p>" + item.addr1 + "</p>"
						+ "<p>" + item.lineIntro + "</p>"
						+ "</div>";
					});
					
					$("#camp-list").append(list);
					pageNo++; // 더보기 버튼 클릭할 때마다 pageNo 1씩 증가
				},
				error : function() {
					alert("가져오기 실패");
				}
			});
		}); //click
	/* 페이지 로드시에도 한번 호출되도록 */
	$('#more-btn').trigger("click");
	});
	
	
	function doSearch() {
		var pageNo = 0;
		var keyword = $("#searchBox").val();
		
		$.ajax({
			url: "/campSearch.do",
			method : "get",
			data : {
				pageNo: pageNo,
				keyword: keyword
			},
			dataType : "json", 
			success : function(data) {
				var list = "";
				
				// $.each() 함수를 사용하여 서버에서 받아온 데이터를 반복적으로 처리하는 HTML 내용을 생성
				$.each(data, function (index, item) {
					list += "<div>"
					+ "<a href='/campDetail.do?keyword=" + item.facltNm + "'>" + item.facltNm + "</a>"
					+ "<p>" + item.addr1 + "</p>"
					+ "<p>" + item.lineIntro + "</p>"
					+ "</div>";
				});
				 $("#camp-list").html(list);
			},
	        error: function() {
	            alert("검색 실패");
	      }
	  });
}
</script>
</head>
	<body>
		<input type="text" id="searchBox" placeholder="캠핑장 이름을 입력하세요"/>
   		<button onclick="doSearch()">검색</button>
   		<br><br><br>
    
		<div id="camp-list">
			<!-- 이 안에 내용 들어감 -->
		</div>
	
		
		<button id="more-btn">더보기</button>
	</body>
</html>