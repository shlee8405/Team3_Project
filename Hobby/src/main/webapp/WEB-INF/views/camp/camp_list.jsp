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

		var searchMode = false; //검색모드인지 확인하는 용도. 기본값은 false, 검색 모드일 때 true
		var searchKeyword = "";
		var pageNo = 1;
		
		/* more-btn이 클릭되면 실행됨 */
		function loadMore() {
			
			// url: 검색모드인지 여부에 따라 다르게 설정하는 삼항연산자
			var url = searchMode ? "/campSearch.do" : "/campList.do";
			var dataObj = { pageNo: pageNo };
			
			// searchMode가 true일 경우에만 dataObj 객체에 keyword 속성을 추가
			if(searchMode == true) {
				dataObj.keyword = searchKeyword;
			}
			
			$.ajax({
				url : url,
				method : "get",
				data : dataObj,
				dataType : "json", 
				success : function(data) {
					if(data.length == 0) {
			            alert("마지막 페이지입니다");
			            return;  // 추가된 데이터가 없으므로 이후 코드 실행을 중단합니다.
			        }
					
					var list = "";
					
					// $.each() 함수를 사용하여 서버에서 받아온 데이터를 반복적으로 처리하는 HTML 내용을 생성
					$.each(data, function (index, dataList) {
						list += "<div>"
						+ "<a href='/campDetail.do?keyword=" + dataList.facltNm + "'>" + dataList.facltNm + "</a>"
						+ "<p>" + dataList.addr1 + "</p>"
						+ "<p>" + dataList.lineIntro + "</p>"
						+ "</div>";
					});
					
					$("#camp-list").append(list);
					pageNo++;  // 더보기 버튼 클릭할 때마다 pageNo 1씩 증가
				},
				error : function() {
					alert("가져오기 실패");
				}
			});
		}
	$('#more-btn').trigger("click");
	
	
	function doSearch() {
		searchMode = true; // 검색 모드 활성화
		searchKeyword = $("#searchBox").val(); // var 키워드 제거
	 	
		$("#camp-list").empty(); // 초기화
		pageNo = 1; // 페이지 번호 초기화
		
		loadMore(); // loadMore 함수 호출
		
		}
	
		$(document).ready(function() {
       	 $("#more-btn").on("click", loadMore);
         $('#more-btn').trigger("click");
    });
</script>
</head>
	<body>
		<input type="text" id="searchBox" placeholder="캠핑장 이름을 입력하세요"/>
   		<button type="button" onclick="doSearch()">검색</button>
   		<br><br><br>
    
		<div id="camp-list">
			<!-- 이 안에 내용 들어감 -->
		</div>
	
		
		<button id="more-btn">더보기</button>
	</body>
</html>