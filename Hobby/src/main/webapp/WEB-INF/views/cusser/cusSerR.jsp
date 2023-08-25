<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
    .container {
		margin: auto;
		width: 50%;
		background-color: #d4ead7; /* 변경된 배경색 */
		padding: 20px; /* 내용과의 간격을 위해 추가 */
		border-radius: 10px; /* 컨테이너 모서리 둥글게 */
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
		margin-top: 130px;
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
</style>
<script type="text/javascript">
    function sendData(f) {
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
    <div class="container">
        <div class="report-form">
            <form method="post">
                <h3 class="mb-4">신고하기</h3>
                <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
                  <label for="floatingInput">작성자</label>
                </div>
                <div class="mb-3">
                    <label for="r_content" class="form-label">내용:</label>
                    <textarea id="r_content" name="r_content" class="form-control" rows="8"></textarea>
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
                    url : "/saveImg.do",
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
</body>
</html>
