<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
</head>
<body>
    <h1>비밀번호 변경</h1>
    
    <form method="post" action="/changePassword">
        <label for="currentPassword">현재 비밀번호:</label>
        <input type="password" id="currentPassword" name="currentPassword" required><br>
        
        <label for="newPassword">새로운 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        
        <label for="confirmPassword">새로운 비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        
        <input type="submit" value="비밀번호 변경">
    </form>
</body>
</html>
