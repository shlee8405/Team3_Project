package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PasswordChangeController {

    @GetMapping("/changePassword")
    public String showChangePasswordPage() {
        return "changePassword";
    }

    @PostMapping("/changePassword")
    public String changePassword(String currentPassword, String newPassword, String confirmPassword) {
        // 여기에서 현재 비밀번호가 맞는지 확인하고 새로운 비밀번호로 변경하는 로직을 추가하세요.
        // 비밀번호 변경이 성공하면 성공 페이지로, 실패하면 실패 페이지로 리다이렉트하거나 메시지를 표시하세요.
    	if (isCurrentPasswordValid(currentPassword)) {
            if (newPassword.equals(confirmPassword)) {
                // 비밀번호 변경 로직 추가 (새로운 비밀번호로 변경)
                // 변경 성공 시 리다이렉트하거나 메시지를 표시하세요.
                return "redirect:/successPage"; // 성공 페이지 URL
            } else {
                // 새로운 비밀번호와 확인 비밀번호가 일치하지 않을 때의 처리
                return "redirect:/passwordMismatchPage"; // 비밀번호 불일치 페이지 URL
            }
        } else {
            // 현재 비밀번호가 맞지 않을 때의 처리
            return "redirect:/invalidPasswordPage"; // 비밀번호 불일치 페이지 URL
        }
    }

    private boolean isCurrentPasswordValid(String currentPassword) {
        // 여기에서 현재 비밀번호를 확인하는 로직을 구현하세요.
        // 실제로는 데이터베이스에서 사용자의 비밀번호와 비교하는 등의 작업이 필요합니다.
        // 이 예제에서는 간단히 "12345"라는 비밀번호로 가정합니다.
        return currentPassword.equals("12345");
    }
}