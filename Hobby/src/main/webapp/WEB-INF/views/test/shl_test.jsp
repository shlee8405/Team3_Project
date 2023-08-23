<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript">
function home() {
	
	location.href="/home.do"
}
</script>
</head>
<body>
	<button onclick="home()" style="width:100%; height: 50px;"> 홈</button>
	
	
	
	<div class="container border border-5 mb-5" style="justfify-content:center; width:400px; "> 
		<div class="mb-3">
		
			<h2>유저추가</h2>
		</div>
	
		<form method="post">
		
		  <div class="mb-3">
		    <label for="u_id" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="u_id" aria-describedby="idHelp">
		  </div>
		  
		  <div class="mb-3">
	  		<label for="u_nickname" class="form-label" > 닉네임</label>
	  		<input type="text" class="form-control" id="u_nickname" aria-describedby="nicknameHelp">
		  </div>
		  
		  
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="exampleInputPassword1">
		  </div>

		<div class="mb-3">
	  		<label for="u_name" class="form-label" > 이름</label>
	  		<input type="text" class="form-control" id="u_name" aria-describedby="nameHelp">
		  </div>
		  
		  <div class="mb-3">
	  		<label for="u_email" class="form-label" > 이메일</label>
	  		<input type="email" class="form-control" id="u_email" aria-describedby="emailHelp">
		  </div>
		  
		  <div class="mb-3">
	  		<label for="u_birthday" class="form-label" > 생년월일</label>
	  		<input type="date" class="form-control" id="u_birthday" aria-describedby="birthdayHelp">
		  </div>
		  
		  
		  <div class="mb-3 form-check">
		    <input type="checkbox" class="form-check-input" id="exampleCheck1">
		    <label class="form-check-label" for="exampleCheck1">Check me out</label>
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>


	<div class="container border border-5 mb-5" style="justfify-content:center; width:400px; "> 
		<div class="mb-3">
		
			<h2>1대1 문의 추가</h2>
		</div>
	
		<form method="post">
		  <div class="mb-3">
		    <label for="u_id" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="u_id" aria-describedby="idHelp">
		  </div>
		  
		  <div class="mb-3">
	  		<label for="q_content" class="form-label" > Content</label>
	  		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		  </div>
		  
		  <button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>





</body>
</html>