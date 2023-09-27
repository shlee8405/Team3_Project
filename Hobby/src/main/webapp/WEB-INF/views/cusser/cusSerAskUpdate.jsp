<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
    .container-fluid {
        margin: auto;
        width: 60%;
        background-color: #637F42;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }
    
    .bbs-form {
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 10px;
    }
    
    .bbs-form input[type="text"],
    .bbs-form textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .bbs-form .note-toolbar {
        background-color: #f8f9fa;
        border-top: 1px solid #ced4da;
        margin-top: 10px;
        padding: 5px 0;
    }
    
    .bbs-form .note-editing-area {
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .bbs-form .note-editor {
        border-radius: 5px;
        border: none;
    }
    
    .bbs-form .note-btn-group {
        margin: 0;
    }
    
    .navbar {
        height: auto;
        min-height: 100vh;
        width: 250px;
   }
   
   .navbar-toggler {
        margin: auto;
   }
   
   .offcanvas {
        width: 320px;
        background-color: #637F42;
   }
   
   .navbar-nav.flex-column {
        align-items: center;
   }
   
   .navbar-nav.flex-column .nav-item {
        width: 100%;
        text-align: center;
   }

   .offcanvas-body {
       display: flex;
       flex-direction: column;
       align-items: center;
   }
   .dropdown {
       margin-top: 10px;
   }
</style>
<script type="text/javascript">
    function sendData(f) {
        f.action="/Update_QNA.do"; // 수정: 여기서 작은 따옴표를 삭제하고 세미콜론 추가
        f.submit();
    }
    
    function list_go(f) {
        f.action="/cusSerAsk.do";
        f.submit();
    }
</script>

</head>
<body>

<jsp:include page="../header.jsp"  />

<div class="d-flex">

<nav class="navbar navbar-dark" style="background-color: #637F42; width: 80px;">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" style="color: black;"></span>
            </button>
        </nav>
        <!-- Offcanvas Navbar Content -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel" style="background-color: #637F42;">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white;">고객센터</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" >
            	<div> <!-- 오른쪽 정렬 -->
                	<a class="btn btn-light" href="/cusSerFAQ.do" role="button">FAQ</a>
            	</div>
                <!-- Offcanvas Navigation Links -->
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      QnA
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerAsk.do">문의 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/go_inquiry.do">문의 하기</a></li>
                    </ul>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Report
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerReport.do">신고 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/report.do">신고하기</a></li>
                    </ul>
                  </div>
            </div>
        </div>

    <div class="container-fluid align-self-end" style="width: 50%">
    <div class="bbs-form">
    <form method="post">
        <h3 class="mb-4">문의 수정하기</h3>
        <div class="row g-3" style="padding-bottom: 20px;">
	        <div class="col-md-9">
	            <label for="q_title" class="form-label">제목</label>
	            <input type="text" id="q_title" name="q_title" class="form-control" value="${qvo.q_title }"/>
	        </div>
	        <div class="col-md-3">
	            <label for="q_name" class="form-label">작성자</label>
	            <input type="text" id="q_name" name="q_name" class="form-control" value="${user.u_name}" disabled/>
	        </div>
        </div>
        <div class="mb-3">
            <label for="q_content" class="form-label">내용</label>
            <textarea id="q_content" name="q_content" class="form-control" rows="8">${qvo.q_content}</textarea>
        </div>
        <div class="text-center">
        	<input type="hidden" name="q_idx" value="${qvo.q_idx}">
            <input type="button" class="btn btn-primary" value="수정" onclick="sendData(this.form)"/>
            <input type="reset" class="btn btn-secondary" value="다시"/>
            <input type="button" class="btn btn-secondary" value="목록" onclick="list_go(this.form)"/>
        </div>
    </form>
    </div>
    <!-- Summernote 기능 유지 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/summernote-lite.js"></script>
    <script src="resources/js/lang/summernote-ko-KR2.js"></script>
    <script type="text/javascript">
    $(function(){
        $('#q_content').summernote({
            lang : 'ko-KR',
            height : 300,
            focus : true,
            callbacks : {
                onImageUpload :  function(files, editor){
                    for (var i = 0; i < files.length; i++) {
                        sendImage(files[i], editor);
                    }
                }
            }
        });
    });
    
    function sendImage(file, editor) {
        var frm = new FormData();
        frm.append("s_file",file);
        $.ajax({
            url : "/saveImage.do",
            data : frm,
            type : "post",
            contentType : false,
            processData : false,
            dataType : "json",
        }).done(function(data) {
            var path = data.path;
            var fname = data.fname;
            alert("path : "+path+"\nfname : "+fname);
            $("#q_content").summernote("editor.insertImage",path+"/"+fname);
        });
    }
    </script>
    </div>
    
    </div>

</body>
</html>
