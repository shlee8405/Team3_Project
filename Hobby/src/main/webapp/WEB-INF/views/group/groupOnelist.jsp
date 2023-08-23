<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 600px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px}
	div{width: 600px; margin:auto; text-align: center;}
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
 <script>
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
	
    </script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
<div>
<h2>모임 상세보기</h2>
<hr>
<br>
<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td>${gvo.g_title}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${gvo.u_idx}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">모임소개</td>
					<td>${gvo.g_intro }</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">썸네일</td>
					<c:choose>
						<c:when test="${empty gvo.g_fname }">
							<td><b>첨부 파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<td>
								<img src="resources/images/${gvo.g_fname}" style="width: 200px; height: 200px">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">날짜</td>
					<td>${gvo.g_date}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">캠핑장소</td>
					<td>${gvo.g_location}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">모임 정원</td>
					<td>${gvo.g_maxPeople }</td>
				</tr>
				<tr align="center">
					<td colspan="2" style="text-align: left">
						<pre style="padding-left: 15px">${gvo.g_desc }</pre>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="g_idx" value="${gvo.g_idx}">
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
		</div>
</body>
</html>