package com.team.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class user {

	@Autowired
	private  UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	// 회원가입 DB 저장 실행
	@PostMapping("/signupGoAdmin.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		//비밀번호 암호화
		String newPass = passwordEncoder.encode(uvo.getU_pw());
		//setter in vo
		uvo.setU_pw(newPass);
		
		//비밀번호 암호화 상태로 DB 저장
		int result = userService.getUserInsert(uvo);
		return mv;
	}
	@PostMapping("/signupGoAdminAdmin.do")
	public ModelAndView getUserAdminInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		//비밀번호 암호화
		String newPass = passwordEncoder.encode(uvo.getU_pw());
		//setter in vo
		uvo.setU_pw(newPass);
		
		//db저장
		int result = userService.getAdminInsert(uvo);
		return mv;
	}
	
}
