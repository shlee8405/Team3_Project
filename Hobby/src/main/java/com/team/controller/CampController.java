package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;

@Controller
public class CampController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/map.do")
	public ModelAndView goMap() {
		ModelAndView mv = new ModelAndView("test/map");
		return mv;
	}
}
