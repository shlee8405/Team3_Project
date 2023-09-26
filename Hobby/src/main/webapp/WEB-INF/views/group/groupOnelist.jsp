<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib    prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style type="text/css">
@font-face{
        font-family: MBCM;
        src: url(/resources/fonts/MBCM.ttf);
    }
    @font-face {
        font-family: TAEBAEK;
        src: url(/resources/fonts/TAEBAEK.ttf);
    }
	a { text-decoration: none;}
	#onelist{width: 1000px; border-collapse:collapse; text-align: center;}
	.allist{border-bottom: 1px solid lightgray; padding: 3px; height: 40px;}
	.list{width: 1000px; margin:auto; text-align: center;}
	.btn5{
		background-color: #548C54;
		width: 120px;
		height: 50px;
		font-size: 22px;
		font-weight: bold;
		border-radius: 10px; 
		color: #FFFCFC;
		cursor: pointer;
	}
	.onelistHeader{
	font-family: MBCM;
	}
	#groupCount{
	width:300px;
	text-align: right;
	padding-right: 30px;
	font-size: 25px;
	font-weight: bold;
	}
	.infoItem {
		border: 1px solid gray;
		width: 1000px;
		min-height: 600px;
    max-height: 1200px;
    overflow-y: auto;
	}
	/* 댓글 */
	.comment-container {
	    display: flex; /* 플렉스 박스 레이아웃을 사용합니다. */
	    align-items: center; /* 요소를 수직으로 중앙 정렬합니다. */
	}
	
	#commId {
	    flex: 1; /* <p> 요소가 사용 가능한 공간을 채우도록 합니다. */
	    margin-right: 10px; /* <p> 요소와 <textarea> 사이의 간격을 조절합니다. */
	}
	/* 댓글 출력 양식을 지정하는 CSS 코드 */
	.comment-container {
	    border: 1px solid #4CAF50;
	    width: 1000px;
	    padding: 10px; /* 내용과 테두리 사이의 간격 조정 */
	    margin: 10px 0; /* 댓글과 댓글 사이의 간격 조정 */
	    background-color: #f5f5f5; /* 배경색 지정 (선택 사항) */
	}
	
	.comment-header {
		text-align: left;
	    margin-bottom: 20px;
	}
	
	.comment-content {
		text-align: left;
	    font-weight: bold;
	    margin-bottom: 10px;
	    margin-left: 30px;
	}
	
	.comment-date {
	    font-style: italic;
	}
	
	.comment-delete-button {
    background-color: #ff0000;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    float: right; /* 삭제 버튼을 오른쪽으로 배치 */
    margin-left: 10px; /* 삭제 버튼과 내용 사이의 간격 조정 */
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
    // 세션에서 u_idx 값을 가져와 JavaScript 변수로 저장
    var u_idx = <%= (String) request.getSession().getServletContext().getAttribute("sessionUidx") %>;
   /*  console.log("u_idx value:", u_idx);  // u_idx의 값을 콘솔에 출력
    
    function insertMember(g_idx) {
    	console.log("joinGroup function called");  // 함수 호출 확인
        // u_idx가 null 또는 빈 문자열인 경우 로그인되어 있지 않다고 판단
         if (!u_idx || u_idx === "null") {
            alert("로그인이 필요한 기능입니다.");
            return; // 함수를 여기서 종료
        }

        window.location.href = "/insertMember.do?g_idx=" + g_idx;
    } */

    function participateGroup(g_idx) {
        // sessionUidx 체크
        if (!u_idx || u_idx === "null") {
            alert("로그인 후 이용해주세요.");
            return;
        }
        
        // 로그인 상태면 서버로 요청 보내기
        joinGroup(g_idx, u_idx);
    }

    function joinGroup(g_idx, u_idx) {
        $.ajax({
            url: '/joinGroup.do',
            type: 'POST',
            data: {
                g_idx: g_idx
            },
            success: function(response) {
                if (response.message === "참여 성공") {
                    // 참여한 상태로 버튼 변경
                    alert("참여했습니다!");
                    // 버튼의 텍스트와 이벤트 핸들러를 변경합니다.
                    $(".chamBtn").removeClass('btn-primnary');
                    $(".chamBtn").addClass('btn-danger');
                    location.reload();
                    // $("button").text("참여 취소").off('click').on('click', function() { joinGroup(g_idx, u_idx); });
                } else {
                    // 참여 취소 상태로 버튼 변경
                    alert("참여를 취소했습니다!");
                    // 버튼의 텍스트와 이벤트 핸들러를 변경합니다.
                    $('.chamBtn').removeClass('btn-danger');
                    $('.chamBtn').addClass('btn-primary');
                    location.reload();
                    //$("button").text("참여").off('click').on('click', function() { joinGroup(g_idx, u_idx); });
                }
            },
            error: function(error) {
                alert("처리 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
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
<%-- <c:set var="sessionUidx" value="${sessionScope.sessionUidx}" /> --%>
<div class="list">
<h2 class="onelistHeader">모임 상세보기</h2>
<hr>
<br>
<form method="post">
<div style="display: flex; align-items: flex-start;">
    <!-- 새로 추가된 썸네일 이미지 부분 -->
    <div style="width: 300px; height: 300px;">
        <c:choose>
            <c:when test="${empty gvo.g_fname}">
                <!-- 빈 공간 유지 --> 
                <img src="resources/images/캠핑.png" style="width: 300px; height: 300px;">
            </c:when>
            <c:otherwise>
                <img src="resources/images/${gvo.g_fname}" style="width: 300px; height: 300px;">
            </c:otherwise>
        </c:choose>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
			<table id="onelist" class="allist">
				<tr align="center">
					<th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">제  목</th>
					<td class="allist"><b>${gvo.g_title}</b></td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">작성자</th>
					<td class="allist">
					  		<c:forEach var="j" items="${userlist}">
							    <c:if test="${gvo.u_idx==j.u_idx}">
							      ${j.u_nickname}
							    </c:if>
					   		</c:forEach>
				   </td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">모임소개</th>
					<td class="allist">${gvo.g_intro }</td>
				</tr>
				<tr align="center">
				    <th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">캠핑 날짜</th>
				    <td class="allist">${gvo.g_date}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">캠핑 장소</th>
					<td class="allist">${gvo.g_cdo} ${gvo.g_gugun} ${gvo.g_location}</td>
				</tr>
				<tr align="center">
					<th class="allist" bgcolor="#637F42" style="color: #fff;font-size: 18px;">모임 정원</th>
					<td class="allist">${gvo.g_maxPeople }</td>
				</tr>
				<tr>
				<th class="allist" bgcolor="#637F42" style="color: #fff; font-size: 18px;"><b>참가자:</b> </th>
					<td  colspan="2">
					<br>
					<c:if test="${gvo.g_date <= now}">
					    <p><b>이미 지난 모임입니다.</b></p>
					</c:if>
					<c:if test="${isParticipated}">
						<p><b>당신은 이 그룹에 이미 참여하였습니다.</b></p>
					</c:if>
						    <div class="col-9">
								<% int count = 0; %>
								<c:forEach var="k" items="${groupUsers}">
									<c:choose>
										<c:when test="${k.g_idx==g_idx}">
											<c:forEach var="j" items="${userlist}">
												<c:choose>
													<c:when test="${j.u_idx==k.u_idx }">
														<c:set var="membercount" value="1" />
														<li>${j.u_nickname}</li>
														<% count=count+1; %>
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<% if(count==0) { %>
									<li> 없음 </li>
								<%} %>
								<br>
						    </div>
		   			<!-- 변수의 값 확인 -->
					<%-- <p>gvo.g_date: ${gvo.g_date}</p>
					<p>now: ${now}</p>
					<p>gvo.g_maxPeople: ${gvo.g_maxPeople}</p>
					<p>gvo.g_curPeople: ${gvo.g_curPeople}</p> --%>
						
						<!-- 조건 비교를 위해 사용하기 -->
						<c:choose>
						    <c:when test="${isParticipated}">
						        <!-- 사용자가 이미 참여한 상태 -->
						        <c:if test="${gvo.g_date > now}">
						            <button class="btn btn-danger chamBtn" onclick="participateGroup(${gvo.g_idx})">참여 취소</button><br>
						        </c:if>
						    </c:when>
						    <c:otherwise>
						        <!-- 사용자가 참여하지 않은 상태 -->
						        <c:if test="${gvo.g_date > now && gvo.g_maxPeople > gvo.g_curPeople}">
						            <button class="btn btn-primary chamBtn" onclick="participateGroup(${gvo.g_idx})">참여</button><br>
						        </c:if>
						    </c:otherwise>
						</c:choose>
						<br>
		   			 </td>
	   			</tr>
			</table>
			</div>
		
			<br>
			 <div class="infoItem">
        <span>${gvo.g_desc }</span>
    </div>
    <br><br>
    <div class="infoActions">
        <input type="hidden" name="g_idx" value="${gvo.g_idx}">
        <input type="button" value="목록" onclick="list_go(this.form)" />
        <input type="hidden" name="cPage" value="${cPage }">
    <c:set var="groupUidxStr" value="${gvo.u_idx}" /> <!-- gvo는 그룹의 정보를 담고 있는 객체로 추정됩니다. -->
		<c:if test="${sessionUidx eq groupUidxStr}">
		    <input type="button" value="수정" onclick="edit_go(this.form)" />
		    <input type="button" value="삭제" onclick="delete_go(this.form)" />
	</c:if>
    </div>
		</form>
		<br>
		<br>
		<br>
		<%-- 댓글 입력 --%>
	<div>
		<form method="post">
			<fieldset>
				   <div class="comment-container">
				<c:if test="${sessionUidx != null}">
					    <p id="commId"><b>아이디 : 
						    <c:forEach var="j" items="${userlist}">
							    <c:if test="${sessionUidx==j.u_idx}">
									  ${j.u_nickname}
								</c:if>
					   		</c:forEach></b></p>
				</c:if>
					    <textarea id="commentArea" placeholder="내용을 입력하세요" rows="4" cols="80" name="gc_content"></textarea>
				 <input id="commIn" type="button" value="댓글저장" onclick="comment_go(this.form)">
					</div>
				 <input type="hidden" name="g_idx" value="${gvo.g_idx}">
				 <input type="hidden" name="u_idx" value="<%=request.getSession().getServletContext().getAttribute("sessionUidx") %>">
				 <input type="hidden" name="cPage" value="${cPage}">
			 </fieldset>
		</form>
	</div>
		
	<!-- 로그인 확인후 입력창 활성화 -->
	<script>
    $(document).ready(function() {
        var sessionUidx = '<%=(String) request.getSession().getServletContext().getAttribute("sessionUidx")%>';
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
	<br>
	<%-- 댓글 출력 --%>
	<div style="display: table;" >
		<c:forEach var="k" items="${gc_list}">
		 <div class="comment-container">
		    <form class="container" method="post">
		        <p class="comment-header"><b>아이디 : 
		        	<c:forEach var="j" items="${userlist}">
		        		<c:if test="${k.u_idx==j.u_idx}">
		        			${j.u_nickname}
		        		</c:if>
					 </c:forEach></b> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 날짜 : ${k.gc_date}</p>
		        <p class="comment-content">내용 : ${k.gc_content }</p>
		        <!-- 세션의 u_idx와 댓글의 u_idx를 문자열로 변환 -->
		        <c:set var="commentUidxStr" value="${k.u_idx}" />
		        <!-- 문자열로 변환된 값을 비교 -->
		        <c:if test="${sessionUidx eq commentUidxStr}">
		            <input type="button" value="삭제" class="comment-delete-button" onclick="comment_del(this.form)" />
		        </c:if>
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