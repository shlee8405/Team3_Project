<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

<style type="text/css">
table{width: 600px;
    height: 300px;
    border-collapse: collapse;
    text-align: center;
    margin: 0 auto; /* 수평 가운데 정렬 */
    margin-top: 100px;}
    
.btn-custom{
	background-color: white;
	color: black;
    border-color: #637F42;
}

.btn-custom:hover{ 
background-color: #637F42;
color: white;
}
.btn-custom:active{ 
background-color: #637F42;
color: black;
color: white;
}

.btn-active{
background-color: #637F42;
color: black;
color: white;
}
.btn-group {
    display: flex; /* 요소들을 가로로 정렬 */
}
.menu {
	display: flex;
	background-color: #f2f2f2;
	width: 100%;
	height: 50px;
}

.menu-item {
	flex:1;
	padding: 10px;
	text-align: center;
	border: 1px solid; 
	background-color: white;
	margin: 0;
}

.menu-item-info{
	background-color: #637F42;
	color: white;
}
	a{text-decoration: none;}
	table{
		width:600px; border-collapse: collapse; text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px;	
	}
	div{   margin: auto; text-align: center;}
</style>
<script type="text/javascript">
	function save_go(f) {
		f.action="/myPageEdit.do";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
		
    <div>
		<h1 class="mypage-title">마이페이지</h1>
	</div>
	<!-- 메뉴바 -->
		<!-- 메뉴바 -->
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myqna.do')">1:1문의 내역</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
            </div>
		<!-- 공백 -->
		<div style="height: 50px;"></div>
		<div class="user-info">
        <h4>회원정보 수정</h4>
            <table>
				<tr align="center">
					<td bgcolor="#637F42">이름</td>
					<td><input type="text" name="name" value="${vo.u_name }" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#637F42">아이디</td>
					<td><input type="text" name="id" value="${vo.u_id }" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#637F42">휴대전화</td>
					<td><input type="text" name="phone" value="${vo.u_phone }" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#637F42">이메일</td>
					<td><input type="text" name="email" value="${vo.u_email }" size ="20"/></td>
				</tr>
				
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="button" value="수정" onclick="save_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" />
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
			
    </div>
    <script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
	</script>
</body>
</html>
