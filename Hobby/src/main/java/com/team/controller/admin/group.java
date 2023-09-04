package com.team.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;

@Controller
public class group {

	
	@Autowired 
	private GroupService groupService;
	
	public ModelAndView insertGroupAdmin(GroupVO gvo) {    /* 모임 생성 */
		ModelAndView mv = new ModelAndView("admin/group");
		int result = groupService.getGroupWriteOk(gvo);
		String groupAddCheck = "false"; 
		if (result > 0) groupAddCheck = "true";
		mv.addObject("Checker", groupAddCheck);
		return mv;
	}

	
	public ModelAndView updateGroupAdmin(GroupVO gvo ) {    /* 모임 수정 */
		ModelAndView mv = new ModelAndView("admin/group");
		int res = groupService.getGroupUpdate(gvo);
		String groupUpdateCheck = "false" ;
		if (res > 0 ) groupUpdateCheck = "true" ;
		mv.addObject("Checker", groupUpdateCheck);
		return mv;
	}
	
	public ModelAndView deleteGroupAdmin(GroupVO gvo) {		/* 모임 삭제 */
		ModelAndView mv = new ModelAndView("admin/group");
		int res = groupService.getGroupDelete(gvo);
		String groupDeleteCheck = "false"; 
		if (res > 0) groupDeleteCheck = "true";
		mv.addObject("Checkers",groupDeleteCheck);
		return mv;
	}
}

