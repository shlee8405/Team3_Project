package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class WithdrawalController {
	@Autowired
	private UserService userService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 탈퇴 페이지로 이동하는 컨트롤러
	@RequestMapping("/withdrawal.do")
	public ModelAndView withdrawal() {
		ModelAndView mv = new ModelAndView("mypage/withdrawal");
		return mv;
	}
	
	// 탈퇴하는 컨트롤러
	@RequestMapping("/withdrawal2.do")
	public ModelAndView withdrawal2(HttpServletRequest request, @RequestParam("currentPassword") String now) {
	    ModelAndView mv = new ModelAndView();
	    String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
	    List<UserVO> Ulist = userService.getUsers(u_idx);
	    String dbpw = Ulist.get(0).getU_pw();

	    if (now == null || now.trim().isEmpty()) {
        // 현재 비밀번호 입력창이 비었을 때 JavaScript 알림 표시
        mv.setViewName("mypage/withdrawal");
        mv.addObject("errorMsg", "비밀번호 입력");
        return mv;
	    }
	    
	    if (!passwordEncoder.matches(now, dbpw)) {
		        // 현재 비밀번호가 일치하지 않을 때 JavaScript 알림 표시
	        mv.addObject("errorMsg", "비밀번호 틀림");
		        mv.setViewName("mypage/withdrawal");
		        mv.addObject("error", "fail");
		        mv.addObject("passwordMismatch", true); // 추가: 비밀번호 불일치 여부를 전달
		        return mv;
		    }else {
		    	request.getSession().getServletContext().removeAttribute("sessionUidx");
				request.getSession().getServletContext().removeAttribute("adminChecker");
		    	//request.getSession().removeAttribute("sessionUidx");
		        userService.getDeleteUser(u_idx);
		        mv.setViewName("redirect:/home.do"); 
		    }
	 
		    return mv;
	}

}
