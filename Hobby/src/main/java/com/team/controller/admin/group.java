package com.team.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.groupuser.service.GroupuserService;

@Controller
public class group {
	@Autowired
	private GroupuserService groupuserService;
	
	@RequestMapping("/adminGroupDetailSearch")
	public ModelAndView adminGroupDetailSearch() {
		ModelAndView mv = new ModelAndView("admin/group");
		
		return mv;
	}
}
