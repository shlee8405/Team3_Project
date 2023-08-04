package com.team.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

import org.springframework.stereotype.Controller;

@Controller
public class MyController {

	@GetMapping("/camp.do")
	public ModelAndView goCamp() {
	    ModelAndView mv = new ModelAndView("test/camp");
	    String[] test = {"장소", "010 0000 0000", "3321.321", "4321.321", "5"};
	    String[] test1 = {"장소2", "010 3333 3330", "11.321", "321.321", "3"};
	    mv.addObject("test", test); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    mv.addObject("test1", test1); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    return mv;
	}
	
	@GetMapping("/group.do")
	public ModelAndView goGroup() {
		ModelAndView mv = new ModelAndView("test/groupAdd");
			String[] test = {"제목", "이름", "010 0000 0000", "4321.321", "5"};
		    mv.addObject("test", test); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
		    return mv;
	}
	
	@GetMapping("/groupList.do") 
	public ModelAndView goGroupList() {
		ModelAndView mv = new ModelAndView("test/groupList");
		String[] test3 = {"장소", "010 0000 0000", "15", "휴일", "5"};
	    String[] test4 = {"장소2", "010 3333 3330", "20", "안휴일", "3"};
	    mv.addObject("test3", test3); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    mv.addObject("test4", test4); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
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
	@GetMapping("/test.do")
	public ModelAndView goTest() {
		ModelAndView mv = new ModelAndView("test");
		return mv;
	}
	
	@GetMapping("/home.do")
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	@PostMapping("/test_groupSend.do")
	public ModelAndView goGroupAddForm() {
		ModelAndView mv = new ModelAndView("test/groupList");
		return mv;
	}
}	
