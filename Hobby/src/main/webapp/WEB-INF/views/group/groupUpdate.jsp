<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
	#bbs table {
	    width:800px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>
<script type="text/javascript">
	function update_ok(f) {
		// 유효성 검사 
		if(f.g_title.value.trim().length <=0){
			alert("제목을 입력하세요");
			f.g_title.focus();
			return;
		}
		if(f.g_maxPeople.value.trim().length <=0){
			alert("총인원을 입력하세요");
			f.g_maxPeople.focus();
			return;
		}
		if(f.g_intro.value.trim().length <=0){
			alert("모임소개를 입력하세요");
			f.g_intro.focus();
			return;
		}
		if(f.g_desc.value.trim().length <=0){
			alert("내용을 입력하세요");
			f.g_desc.focus();
			return;
		}
		if(f.g_date.value.trim().length <=0){
			alert("날짜를 입력하세요");
			f.g_date.focus();
			return;
		}
		if(f.g_location.value.trim().length <=0){
			alert("캠핑 장소를 입력하세요");
			f.g_location.focus();
			return;
		}
		
		f.action="/groupUpdate.do";
		f.submit();
	}
	function list_go(f) {
		f.action="/groupList.do";
		f.submit();
	}
</script>
</head>
<body>
<h2>상세보기 수정폼</h2>
<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 수정">
			<caption>모임 수정</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="g_title" size="45" value="${gvo.g_title}"></td>
				</tr>
				<tr align="center">
					<th bgcolor="#99ccff">작성자</th>
					<td>${gvo.u_idx}</td>
				</tr>
				<tr>
					<th>모임 총인원</th>
					<td><input type="number" name="g_maxPeople" value="${gvo.g_maxPeople}"></td>
				</tr>
				<tr>
					<th>썸네일 이미지</th>
					<c:choose>
						<c:when test="${empty gvo.g_fname}">
							<td><input type="file" name="file"><b>이전 파일 없음</b></td>
						         <input type="hidden" name="g_oldfname" value="">	
						</c:when>
						<c:otherwise>
							<td><input type="file" name="file"><b>${gvo.g_fname}</b></td>
						         <input type="hidden" name="g_oldfname" value="${gvo.g_fname}">	
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>모임 소개</th> 
					<td><input type="text" name="g_intro" size="60" value="${gvo.g_intro }"></td>
				</tr>
				<tr>
					<th>캠핑 날짜</th>
					<td><input type="date" name="g_date" size="10" id="g_date" value="<fmt:formatDate value="${gvo.g_date}" pattern="yyyy-MM-DD" />"/></td>
				</tr>
				<tr>
					<th>캠핑 장소</th>
					<td><input type="text" name="g_location" id="g_location" value="${gvo.g_location}"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="g_desc" cols="50" id="g_desc"
							rows="8">${gvo.g_desc}</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="u_idx" value="${gvo.u_idx}">
						<input type="hidden" name="g_idx" value="${gvo.g_idx}">
						<%-- <input type="hidden" name="cPage" value="${cPage}"> --%>
						<input type="button" value="수정" onclick="update_ok(this.form)"/>
						<input type="button" value="취소" onclick="list_go(this.form)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    	<script src="resources/js/summernote-lite.js"></script>
    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
    	<script type="text/javascript">
    	$(function(){
    		$('#g_desc').summernote({
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
				$("#g_desc").summernote("editor.insertImage",path+"/"+fname);
			});
		}
    	</script>
</body>
</html>