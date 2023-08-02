package com.team.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

import org.springframework.stereotype.Controller;

@Controller
public class MyController {

	@GetMapping("/camp.do")
	public ModelAndView goCamp() {
		ModelAndView mv = new ModelAndView("test/camp");
		return mv;
	}
	@GetMapping("/group.do")
	public ModelAndView goGroup() {
		ModelAndView mv = new ModelAndView("test/group");
		return mv;
	}
	@GetMapping("/login.do")
	public ModelAndView goLogin() {
		ModelAndView mv = new ModelAndView("test/login");
		return mv;
	}
	@GetMapping("/signup.do")
	public ModelAndView goSignup() {
		ModelAndView mv = new ModelAndView("test/signup");
		return mv;
	}
	@GetMapping("/hello.do")
	public ModelAndView goHello() {
		ModelAndView mv = new ModelAndView("test/hello");
		return mv;
	}
	@GetMapping("/world.do")
	public ModelAndView goWorld() {
		ModelAndView mv = new ModelAndView("test/world");
		return mv;
	}

	
}	
