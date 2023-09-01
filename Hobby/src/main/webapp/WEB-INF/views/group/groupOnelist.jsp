<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: none;}
	#onelist{width: 800px; border-collapse:collapse; text-align: center;}
	.allist{border: 1px solid black; padding: 3px}
	.list{width: 800px; margin:auto; text-align: center;}
	.btn{
		background-color: #548C54;
		width: 120px;
		height: 50px;
		font-size: 22px;
		font-weight: bold;
		border-radius: 10px; 
		color: #FFFCFC;
		cursor: pointer;
	}
	#groupCount{
	width:300px;
	text-align: right;
	padding-right: 30px;
	font-size: 25px;
	font-weight: bold;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 	function list_go(f) {
		f.action="/groupList.do";
		f.submit();
	}
 	function edit_go(f) {
		f.action="/groupUpdate_Form.do";
		f.submit();
	}
	function delete_go(f) {
		var chk = confirm("정말 삭제할까요?");
		f.action="/groupDelete.do";
		f.submit();
	}
      var count_party = 0;
      var maxClicks = ${gvo.g_maxPeople}; // 버튼을 누를 수 있는 최대 횟수
      
     /*  $(document).ready(function() {
    	  // 버튼 클릭 이벤트를 설정합니다.
    	  $('#myButton_ok').click(party_click); 
    	  // 이벤트 핸들러를 여기에 더 추가할 수 있습니다.
    	}); */
      
      function party_click() {
     	count_party++;
      document.getElementById("count_party").innerHTML = count_party;
          if (count_party >= maxClicks) {
              $("#ok").css("display","none");
              $("#no").css("display","block");
              $("")
          }
      }
      function party_click_no() {
      document.getElementById("count_party").innerHTML = count_party;
          if (count_party < 1) {
              //document.getElementById("myButton_cancle").style.display = true;
              $("#ok").css("display","block");
              $("#no").css("display","none");
          }else{
      		count_party--;
          }
	} 
      function comment_go(f) {
    		 // 유효성 검사
    		if(f.gc_content.value.trim().length <=0){
    			alert("내용을 입력해 주세요");
    			f.gc_content.focus();
    			return;
    		}
    		console.log("u_idx")
    	    f.action = "/groupCmtList.do"
    		f.submit();
    	}

    	function comment_del(f) {
		var chk = confirm("정말 삭제할까요?");
			if(chk){
	    		f.action = "/groupCmtDel.do";
	    		f.submit();
			}
    	}
    	
    </script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
<div class="list">
<h2>모임 상세보기</h2>
<hr>
<br>
<form method="post">
			<table id="onelist" class="allist">
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">제  목</th>
					<td class="allist">${gvo.g_title}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">작성자</th>
					<td class="allist">${gvo.u_idx}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">모임소개</th>
					<td class="allist">${gvo.g_intro }</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">썸네일</th>
					<c:choose>
						<c:when test="${empty gvo.g_fname }">
							<td class="allist"><b>첨부 파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<td class="allist">
								<img src="resources/images/${gvo.g_fname}" style="width: 200px; height: 200px">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr align="center">
				    <th class="allist" bgcolor="#99ccff">캠핑 날짜</th>
				    <td class="allist">${gvo.g_date}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">캠핑 장소</th>
					<td class="allist">${gvo.g_cdo} ${gvo.g_gugun} ${gvo.g_location}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#99ccff">모임 정원</th>
					<td class="allist">${gvo.g_maxPeople }</td>
				</tr>
				<tr align="center">
					<td class="allist" colspan="2" style="text-align: left">
						<pre style="padding-left: 15px">${gvo.g_desc }</pre>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td class="allist" colspan="2">
							<input type="hidden" name="g_idx" value="${gvo.g_idx}">
							<%-- <input type="hidden" value="${cPage}" name="cPage"> --%>
							<input type="button" value="목록" onclick="list_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="수정" onclick="edit_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_go(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<p id="groupCount"><span id="count_party">0</span>/${gvo.g_maxPeople}&nbsp;&nbsp;</p>
		<div id="ok">
			<button class="btn" id="myButton_ok" onclick="party_click()">참여</button>
		</div>&nbsp;&nbsp;
		<div id="no" style="display:none;">
			<button class="btn" id="myButton_cancle" onclick="party_click_no()">참여 취소</button>
		</div>
		</div>
		
		<%-- 댓글 입력 --%>
	<div style="padding:50px; width:580px; margin: auto; ">
		<form method="post">
			<fieldset>
				<c:if test="${sessionUidx != null}">
				    <p id="commId">아이디 : ${sessionUidx}</p>
				</c:if>
				<p >내용 : <br>
					<textarea id="commentArea" rows="4" cols="40" name="gc_content"></textarea>
				 </p>
				 <input id="commIn" type="button" value="댓글저장" onclick="comment_go(this.form)">
				 <input type="hidden" name="g_idx" value="${gvo.g_idx}">
				 <input type="hidden" name="u_idx" value="<%=request.getSession().getServletContext().getAttribute("sessionUidx") %>">
				 <input type="hidden" name="cPage" value="${cPage}">
			 </fieldset>
		</form>
	</div>
	
	<!-- 로그인 확인후 입력창 활성화 -->
	<script>
    $(document).ready(function() {
        var sessionUidx = '<%=request.getSession().getServletContext().getAttribute("sessionUidx")%>';
        if (sessionUidx === '' || sessionUidx === 'null') {  // 세션 값이 없을 경우
            $("#commentArea").prop("disabled", true);
            $("#commentArea").val("로그인 후 입력해주세요.");
            $("#commIn").prop("disabled", true);
        } else {  // 세션 값이 있을 경우
            $("#commentArea").prop("disabled", false);
            $("#commIn").prop("disabled", false);
        }
        
    });
</script>
	
	<%-- 댓글 출력 --%>
	<div style="display: table;" >
		<c:forEach var="k" items="${gc_list}">
		 <div style="border: 1px solid #cc00cc; width: 400px; margin: 20px; padding: 20px;">
		 	<form method="post">
		 		<p>아이디 : ${k.u_idx}</p>
		 		<p>내용 : ${k.gc_content }</p>
		 		<p>날짜 : ${k.gc_date.substring(0,10)}</p>
		 		<%-- 실제로는 로그인 성공해야지만 삭제번트이 보여야 한다. --%>
		 		<input type="button" value="댓글수정" onclick="comment_update(this.form)"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 		<!-- JSTL을 이용한 세션 변수 접근 -->
				<c:set var="sessionUidx" value="${sessionScope.u_idx}" />
				
				<!-- 값들을 출력해서 확인 -->
				<!-- Debugging lines -->
				<%-- <c:out value="${sessionUidx}" />
				<c:out value="${k.u_idx}" /> --%>
				
				<!-- 디버깅 정보 -->
				<%-- <c:if test="${sessionUidx eq k.u_idx}"> --%>
				    <input type="button" value="삭제" onclick="comment_del(this.form)" />
				<%-- </c:if> --%>
		 		<input type="hidden" value="${k.gc_idx}" name="gc_idx">
		 		<input type="hidden" value="${k.g_idx}" name="g_idx">
		 		<input type="hidden" name="cPage" value="${cPage}">
		 	</form>
		 </div>
		</c:forEach>
		</div>
		<br>
		<br>
		<br>
		<br>
		</div>
		
</body>
</html>