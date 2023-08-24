<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
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
        #group_item{
        	cursor: pointer;
        }
        #group_item.hovered {
	      cursor: grab;
	    }
	    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* 화면의 전체 높이 */
        flex-direction: column; /* 수직 방향으로 요소를 중앙 정렬하기 위함 */
    }
    
    #listgroup {
        margin: auto; /* 수직 중앙 정렬 */
    }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function group_write_go() {
		alert("로그인이 필요합니다");
		location.href= "/group_writeForm.do";
	}
	function go_groupOnelist(f) {
		var div = document.getElementById("group_item");
		div.classList.add("hovered");
	      div.addEventListener("mouseleave", function() {
	        div.classList.remove("hovered");
	      });
		
		location.href= "/group_onelist.do?g_idx="+ f;
	}
	
</script>

</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
<div id="listgroup" style="width: 1000px ;">
    <h3>모임</h3>
    <div class="board-container">
        <c:choose>
            <c:when test="${empty glist}">
                <div class="board-item">
                    <h3>작성된 글이 없습니다.</h3>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="k" items="${glist}">
    <div id="group_item" class="board-item" onclick="go_groupOnelist(${k.g_idx})">
        <c:set var="thumbnailSrc" value="/resources/images/캠핑.png" />
        <c:if test="${not empty k.g_fname}">
            <c:set var="thumbnailSrc" value='/resources/images/${k.g_fname}' />
        </c:if>
        <img class="thumbnail" src="${pageContext.request.contextPath}${thumbnailSrc}">
        <h4 style="margin-top: 20px">${k.g_title}</h4>
        <p>${k.g_intro}</p>
    </div>
</c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <button id="write_btn" onclick="group_write_go()">글쓰기</button>
    </div>
    </div>
</body>
</html>