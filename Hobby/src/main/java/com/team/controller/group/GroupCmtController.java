package com.team.controller.group;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.commons.Paging;
import com.team.group.service.GroupService;
import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.user.vo.UserVO;

@Controller
public class GroupCmtController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private Paging paging;
	
	@PostMapping("/groupCmtList.do")
	public ModelAndView commentInsert( HttpServletRequest request, GroupCmtVO gcvo, @ModelAttribute("cPage") String cPage,
	        @ModelAttribute("g_idx") String g_idx, @RequestParam("u_idx") String u_idx) {
		ModelAndView mv = new ModelAndView("redirect:/group_onelist.do");
		String gc_content = request.getParameter("gc_content");
	    gcvo.setGc_content(gc_content);
		gcvo.setU_idx(u_idx);
		System.out.println("Debug u_idx: " + u_idx);
		int result = groupService.getCommInsert(gcvo);
		return mv;
	}
	@PostMapping("/groupCmtDel.do")
	public ModelAndView commentDel(GroupCmtVO gcvo, @RequestParam("gc_idx") String gc_idx, @ModelAttribute("cPage") String cPage,
			@ModelAttribute("g_idx") String g_idx) {
		ModelAndView mv = new ModelAndView("redirect:/group_onelist.do");
		int result = groupService.commentDel(gcvo);
		return mv;
	}
	
	
	
	
}