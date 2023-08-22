package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	

//	@GetMapping("/adminUser.do")
//	public ModelAndView goAdminUser() /* 관리자 유저 */ {
//		ModelAndView mv = new ModelAndView("admin/user");
//		List<UserVO> list = userService.getAllUsers();
//		mv.addObject("list", list);
//		return mv;
//	}
	
	
	@GetMapping("/shltest.do")
	public ModelAndView goSHLTEST() {
		ModelAndView mv = new ModelAndView("test/shl_test");
		return mv;
	}
}

