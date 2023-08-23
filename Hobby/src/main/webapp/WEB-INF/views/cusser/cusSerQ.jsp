<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    function sendData(f) {
        /* // 다른 방법
        if(f.title.value.trim().length <= 0){
            alert("제목을 입력하세요");
            f.title.focus();
            return;
        }
        
        if(f.content.value.trim().length <= 0){
            alert("내용을 입력하세요");
            f.content.focus();
            return;
        } */
        
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
    <div id="bbs">
    <form method="post">
        <table>
            <caption>문의 게시판</caption>
            <tbody>
                <tr>
                    <th>작성자:</th>
                    <td><input type="text" name="u_name" size="45"/></td>
                </tr>
                <tr>
                    <th>내용:</th>
                    <td><textarea name="q_content" cols="50" rows="8" id="content"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="button" value="보내기" onclick="sendData(this.form)"/>
                        <input type="reset" value="다시"/>
                        <input type="button" value="목록" onclick="list_go(this.form)"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    </div>
</body>
</html>
