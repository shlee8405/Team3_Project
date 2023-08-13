<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑장 리스트</title>
</head>
	<body>
		<c:forEach items="${dataList}" var="item">
			Content ID : ${item.contentId}<br>
			Name : ${item.facltNm}<br>
			featureNm : ${item.featureNm}<br>
			<!-- 나중에 추가로 더 불러오기 -->
		</c:forEach>
	</body>
</html>