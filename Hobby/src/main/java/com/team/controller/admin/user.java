package com.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class user {

	@Autowired private UserService userService;
	
	
	public ModelAndView insertUserAdmin(UserVO vo) {    	/*  유저 추가 */
		ModelAndView mv = new ModelAndView("admin/user");
		int res = userService.getUserInsert(vo);
		String userAddCheck = "false"; 
		if (res > 0 ) userAddCheck = "true";
		mv.addObject("Checker", userAddCheck);
		
		return mv;
	}
	
	public ModelAndView updateUserAdmin(UserVO vo) {    	/* 유저 수정 */
		ModelAndView mv = new ModelAndView("admin/user");
		// FIXME
		int res = userService.getUserUpdate(vo);
		String userUpdateCheck = "false";
		if (res > 0) userUpdateCheck = "true";
		mv.addObject("Checker" ,userUpdateCheck);

		return mv;
	}	
	
	public ModelAndView deleteUserAdmin(UserVO vo) {		/* 유저 삭제 */
		ModelAndView mv = new ModelAndView("admin/user");
		// FIXME
		int res = userService.getUserDelete(vo);
		String userDeleteCheck = "false";
		if (res > 0 ) userDeleteCheck ="true" ;
		mv.addObject("Checker" , userDeleteCheck);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	public ModelAndView insertAdminAdmin(UserVO vo){    	/* 관리자 추가 */
		ModelAndView mv = new ModelAndView("admin/user");
		//FIXME
		int res = userService.getAdminInsert(vo);
		String userAddCheck = "false";
		if (res > 0) userAddCheck = "true";
		mv.addObject("Checker", userAddCheck);
		
		return mv;
	}
	

	
	
}
