<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}


.sidebar-link {
color:#ffffff!important;

}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<script type="text/javascript">
	function go_admin() {
		location.href = "/adminHome.do"
	}

	function go_adminUser() {
		location.href = "/adminUser.do"
	}

	function go_adminGroup() {
		location.href = "/adminGroup.do"
	}

	function go_adminQNA() {
		location.href = "/adminQNA.do"
	}

	function go_adminReport() {
		location.href = "/adminReport.do"
	}

	function go_home() {
		location.href = "/home.do"
	}
	
	function sendData(f) {
    	
		if(document.getElementById('pop_title').value.trim() === "" || document.getElementById('pop_content').value.trim() === "") {
	    	alert('제목과 내용을 모두 입력해주세요.');
	    return false;
		}
	        f.action="/insert_Popup.do"; // 수정: 여기서 작은 따옴표를 삭제하고 세미콜론 추가
	        f.submit();
	    }
	
</script>
</head>
<body>
<main>
    <!-- SIDEBAR -->
   	<jsp:include page="sidebar.jsp" />

  <!-- MAIN CONTAINER -->
   <div class="container"  style="width: 85%; margin-left:15vw;">

        <!-- FIRST CONTAINER ( USER LIST )-->
        <div id="test" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:75vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        " >
        
        	<div class="row " style="justify-content:center;">
				<h1>팝업 관리</h1>
			</div>
            <div class="container-fluid align-self-end" style="width: 50%">
    <div class="ask-form">
    <form method="post">
        
        <div class="row g-3" style="padding-bottom: 20px;" >
	        <div class="col-md-9">
	            <label for="pop_title" class="form-label">제목</label>
	            <input type="text" id="pop_title" name="pop_title" class="form-control" required/>
	        </div>
        </div>
        
        <div class="mb-3">
            <label for="pop_content" class="form-label">내용</label>
            <textarea id="pop_content" name="pop_content" class="form-control" rows="8" required></textarea>
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-primary" value="보내기" onclick="sendData(this.form)"/>
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
        $('#pop_content').summernote({
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
            $("#pop_content").summernote("editor.insertImage",path+"/"+fname);
        });
    }
    </script>
    </div>
        </div>
   </div>
</main>

</body>
</html>