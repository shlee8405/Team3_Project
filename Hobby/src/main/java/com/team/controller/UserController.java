package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.qna.service.QnaService;
import com.team.report.service.ReportService;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@RestController
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReportService reportService;
	
	
	@PostMapping("/signup.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("test/login");
		int result = userService.getUserInsert(uvo);
		return mv;
		
	}
	  @PostMapping("/login.do")
	  public ModelAndView getUserLogin(UserVO uvo) {
		  ModelAndView mv = new ModelAndView("index2");
		  return mv;
	  }
	 
}
