<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>모임 생성</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 
crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/groupAdd.css">
</head>
<body>
	<div class="col-md-12">
                  <h2 class="title-txt">캠프 모임</h2>
               <div class="search-select">
                  <select class="selectbox" id="test" onchange="Change()">
                  <option value="1">모임1</option>
                  <option value="2">모임2</option>
                  <option value="3">모임3</option>
                   </select>
                  <div style="display: block">
                     <form action="" method="" >
                        <input type="search" class="search" name="keyword">
                        <input type="submit" class="submit" value="검색">
                     </form>
                  </div>

                  </div>
            </div>
	
	
	<form action="/test_groupSend.do" method="post">
	<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">이름</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">1</th>
      <td>안녕</td>
      <td>안녕하세요</td>
      <td>전시유</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>방가</td>
      <td>반가워요</td>
      <td>이수환</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>안녕 방가</td>
      <td>안녕하세요 반가워요</td>
      <td>표동</td>
    </tr>
  </tbody>
</table>
<div class="click">
<button type="button" class="btn btn-primary">글쓰기</button>
<button type="button2" class="btn btn-primary">뒤로가기</button>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</form>

</body>
</html>