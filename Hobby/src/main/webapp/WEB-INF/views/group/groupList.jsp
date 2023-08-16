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
    </style>
</head>
<body>
    <h3>모임</h3>
    <div class="board-container">
        <c:choose>
            <c:when test="${empty posts}">
                <div class="board-item">
                    <h3>작성된 글이 없습니다.</h3>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="k" items="${posts}">
                    <div class="board-item">
                        <img class="thumbnail" src="${k[2]}" alt="Thumbnail">
                        <h4>${k[0]}</h4>
                        <p>${k[1]}</p>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
