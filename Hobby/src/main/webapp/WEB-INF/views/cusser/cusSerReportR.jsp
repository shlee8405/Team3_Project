<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
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
    
    .report-form {
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 10px;
    }
    
    .report-form input[type="text"],
    .report-form textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .report-form .note-toolbar {
        background-color: #f8f9fa;
        border-top: 1px solid #ced4da;
        margin-top: 10px;
        padding: 5px 0;
    }
    
    .report-form .note-editing-area {
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .report-form .note-editor {
        border-radius: 5px;
        border: none;
    }
    
    .report-form .note-btn-group {
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
		if(document.getElementById('r_title').value.trim() === "" || document.getElementById('r_content').value.trim() === "") {
		    alert('제목과 내용을 모두 입력해주세요.');
		    return false;
		}else
		f.action="/report_insert.do";
        f.submit();
	}
	
    function list_go(f) {
        f.action="/cusSerReport.do";
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
	    <div class="report-form">
	    <form method="post">
	        <h3 class="mb-4">신고하기</h3>
	        <div class="row mb-3">
	        
	        <div class="row g-3" style="padding-bottom: 20px;">
		        <div class="col-md-9">
		            <label for="r_title" class="form-label">제목</label>
		            <input type="text" id="r_title" name="r_title" class="form-control" required/>
		        </div>
		        <div class="col-md-3">
		            <label for="r_name" class="form-label">작성자</label>
		            <input type="text" id="r_name" name="r_name" class="form-control" value="${user.u_name}" required disabled/>
		        </div>
	        </div>
	        
	        </div>
	        <div class="mb-3">
	            <label for="r_content" class="form-label">내용</label>
	            <textarea id="r_content" name="r_content" class="form-control" rows="8"></textarea>
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
                $('#r_content').summernote({
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
                    $("#r_content").summernote("editor.insertImage",path+"/"+fname);
                });
            }
        </script>
    </div>
    </div>
</body>
</html>
