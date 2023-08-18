<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 main</title>

<style type="text/css">
 #green-header {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     #green-footer {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     
	a{text-decoration: none;}
	table{
		width:600px; border-collapse: collapse; text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px;	
	}
	div{width:600px; margin: auto; text-align: center;}
</style>
</head>
<body>
    <div>
    	<div class="header">
        <div class="green-background"></div>
        <div id="green-header"></div>
        <h1 class="mypage-title">마이페이지</h1>
    </div>
    	
    	<hr>
    	<h2>내가 찜한 캠핑장 | 내가 작성한 리뷰 | 1:1 문의 | 회원정보 </h2>

   <table>
		<thead>
			<tr style="background-color: #99ccff">
				<th>캠핑장 이름 </th>
				<th>1 </th>
				<th>2</th>
				<th>3</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${k.cw_idx}</td>
							<td>${k.u_idx}</td>
							<td>${k.c_name}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
    
    <div id="green-footer"></div>
        <div class="green-background"></div>
    </div>
</body>
</html>
