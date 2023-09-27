<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 댓글</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<script type="text/javascript">
function comment_go(f) {
	 // 유효성 검사
	if(f.writer.value.trim().length <=0){
		alert("이름을 입력해 주세요");
		f.writer.focus();
		return;
	}
	if(f.content.value.trim().length <=0){
		alert("내용을 입력해 주세요");
		f.content.focus();
		return;
	}
	f.action = "/";
	f.submit();
}

function comment_del(f) {
	f.action = "/";
	f.submit();
}
</script>
</head>
<body>
<%-- 댓글 입력 --%>
	<div style="padding:50px; width:580px; margin: auto; ">
		<form method="post">
			<fieldset>
				<p>이름 : <input type="text" name="writer" ></p>
				<p>내용 : <br>
					<textarea rows="4" cols="40" name="content"></textarea>
				 </p>
				 <input type="button" value="댓글저장" onclick="comment_go(this.form)">
				 <input type="hidden" name="b_idx" value="${bvo.b_idx}">
				 <input type="hidden" name="cPage" value="${cPage}">
			 </fieldset>
		</form>
	</div>
	<br><br><br>
	
	<%-- 댓글 출력 --%>
	<div style="display: table;" >
		<c:forEach var="k" items="${c_list}">
		 <div style="border: 1px solid #cc00cc; width: 400px; margin: 20px; padding: 20px;">
		 	<form method="post">
		 		<p>이름 : ${k.writer}</p>
		 		<p>내용 : ${k.content }</p>
		 		<p>날짜 : ${k.write_date.substring(0,10)}</p>
		 		<%-- 실제로는 로그인 성공해야 지만 삭제번트이 보여야 한다. --%>
		 		<input type="button" value="댓글삭제" onclick="comment_del(this.form)">
		 		<input type="hidden" value="${k.c_idx}" name="c_idx">
		 		<input type="hidden" value="${k.b_idx}" name="b_idx">
		 		<input type="hidden" name="cPage" value="${cPage}">
		 	</form>
		 </div>
		</c:forEach>
	</div>
</body>
</html>