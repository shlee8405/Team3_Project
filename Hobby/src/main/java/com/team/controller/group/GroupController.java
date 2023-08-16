package com.team.controller.group;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	
	@GetMapping("/groupList.do")
    public ModelAndView groupListForm() {
		ModelAndView mv = new ModelAndView("group/groupList");
		List<String[]> posts = new ArrayList<>();
		posts.add(new String[] {"제목 1", "내용 1", "thumbnail1.jpg"});
		posts.add(new String[] {"제목 2", "내용 2", "thumbnail2.jpg"});
		mv.addObject("posts", posts);
        return mv;
    }

   
    
	
	
}
