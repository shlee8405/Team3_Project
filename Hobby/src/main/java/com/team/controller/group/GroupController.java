package com.team.controller.group;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	
	@GetMapping("/groupList.do")
    public ModelAndView getAllGroups() {
		ModelAndView mv = new ModelAndView("group/groupList");
		List<GroupVO> glist = groupService.getAllGroups();
		mv.addObject("glist", glist);
        return mv;
    }
	@GetMapping("/group_writeForm.do")
	public ModelAndView getGroupWriteForm() {
		return new ModelAndView("group/groupWrite");
	}
    
	
	
}
