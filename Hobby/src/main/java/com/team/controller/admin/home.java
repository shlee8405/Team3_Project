package com.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class home {

	@Autowired private UserService userService;
	
	@GetMapping("/adminUser.do")
	public ModelAndView goAdminUser() /*관리자 유저*/ {
		ModelAndView mv = new ModelAndView("admin/user");
		List<UserVO> list = userService.getAllUsers();
		mv.addObject("list", list);
		return mv;
	}
	
	
}
