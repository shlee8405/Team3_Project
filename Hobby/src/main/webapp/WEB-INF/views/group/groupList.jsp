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
            width: 100px; /* Add "px" unit here */
            height: auto;
        }
        #group_item{
        	cursor: pointer;
        }
        #group_item.hovered {
	      cursor: grab;
	    }
    </style>
<script type="text/javascript">
	function group_write_go() {
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
<script type="text/javascript">
	function name() {
		
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
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
                        <img class="thumbnail" src="/resources/images/${k.g_fname}" width="100">
                        <h4>${k.g_title}</h4>
                        <p>${k.g_intro}</p>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <button onclick="group_write_go()">글쓰기</button>
    </div>
</body>
</html>
