package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class PasswordChangeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/changePassword.do")
	public ModelAndView changePassword() {
		ModelAndView mv = new ModelAndView("mypage/changePassword");
		return mv;
	}
	
	@RequestMapping("/change.do")
	public ModelAndView change(HttpServletRequest request, @RequestParam("currentPassword") String now, @RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword) {
	    ModelAndView mv = new ModelAndView();
	    String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
	    List<UserVO> Ulist = userService.getUsers(u_idx);
	    String dbpw = Ulist.get(0).getU_pw();

	    if (now == null || now.trim().isEmpty()) {
        // 현재 비밀번호 입력창이 비었을 때 JavaScript 알림 표시
        mv.setViewName("mypage/changePassword");
        mv.addObject("errorMsg", "현재 비밀번호 입력");
        return mv;
	    }
	    
	    if (!passwordEncoder.matches(now, dbpw)) {
		        // 현재 비밀번호가 일치하지 않을 때 JavaScript 알림 표시
	        mv.addObject("errorMsg", "비밀번호 틀림");
		        mv.setViewName("mypage/changePassword");
		        mv.addObject("error", "fail");
		        mv.addObject("passwordMismatch", true); // 추가: 비밀번호 불일치 여부를 전달
		        return mv;
		    }
	
		    // 새로운 비밀번호와 확인 비밀번호가 일치하는지 확인
	    if (!newPassword.equals(confirmPassword)) {
	        mv.setViewName("mypage/changePassword");
	        mv.addObject("errorMsg", "새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	        return mv;
	    }
		    if (!newPassword.equals(confirmPassword)) {
		        mv.setViewName("mypage/changePassword");
		        mv.addObject("passwordMismatch", true); // 추가: 비밀번호 불일치 여부를 전달
		        return mv;
		    }
	
		    // 새로운 비밀번호 암호화 및 저장
		    String encodedNewPassword = passwordEncoder.encode(newPassword);
		    Ulist.get(0).setU_pw(encodedNewPassword);
		    int result = userService.pass(u_idx, encodedNewPassword);
	
		    if (result > 0) {
		        mv.setViewName("redirect:/home.do");
		    } else {
		        // 비밀번호 변경에 실패한 경우에 대한 처리
		        // 예를 들어, mv.addObject("error", "비밀번호 변경에 실패하였습니다.") 등으로 에러 메시지를 전달할 수 있습니다.
		        mv.setViewName("mypage/changePassword");
		    }
	
		    return mv;
		}


}