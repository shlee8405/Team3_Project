<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">

	@font-face{
        font-family: OpenSans-Bold;
        src: url(/resources/fonts/IBMPlexSansKR-Light.ttf);
    }
    
    h1{
    	font-family: OpenSans-Bold;
    	text-align: center;
    }
    
	.container-fluid {
        margin: auto;
        width: 60%;
        background-color: #637F42;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }
    
    .ask-form {
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 10px;
    }
    
    .ask-form input[type="text"],
    .ask-form textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .ask-form .note-toolbar {
        background-color: #f8f9fa;
        border-top: 1px solid #ced4da;
        margin-top: 10px;
        padding: 5px 0;
    }
    
    .ask-form .note-editing-area {
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .ask-form .note-editor {
        border-radius: 5px;
        border: none;
    }
    
    .ask-form .note-btn-group {
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
    	
	if(document.getElementById('q_title').value.trim() === "" || document.getElementById('q_content').value.trim() === "") {
    	alert('제목과 내용을 모두 입력해주세요.');
    return false;
	}
        f.action="/insert_QNA.do"; // 수정: 여기서 작은 따옴표를 삭제하고 세미콜론 추가
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

	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
    <div class="container-fluid align-self-end" style="width: 50%">
    <div class="ask-form">
    <form method="post">
        <h3 class="mb-4">문의 게시판</h3>
        
        <div class="row g-3" style="padding-bottom: 20px;" >
	        <div class="col-md-9">
	            <label for="q_title" class="form-label">제목</label>
	            <input type="text" id="q_title" name="q_title" class="form-control" required/>
	        </div>
	        <div class="col-md-3">
	            <label for="q_name" class="form-label">작성자</label>
	            <input type="text" id="q_name" name="q_name" class="form-control" value="${user.u_name}" required disabled/>
	        </div>
        </div>
        
        <div class="mb-3">
            <label for="q_content" class="form-label">내용</label>
            <textarea id="q_content" name="q_content" class="form-control" rows="8" required></textarea>
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-primary" value="보내기" onclick="sendData(this.form)"/>
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
    
</body>
</html>
