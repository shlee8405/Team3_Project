package com.team.controller.group;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.team.group.service.GroupService;
import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.user.vo.UserVO;

public class GroupCmtController {
	@Autowired
	private GroupService groupService;
	
	@GetMapping("/groupCmtList.do")
	public ModelAndView getGroupCmtList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("group/groupComment");
		String gc_idx = request.getParameter("gc_idx");
		List<GroupCmtVO> gc_list = groupService.getCommList(gc_idx);
		
		mv.addObject("gc_list",gc_list);
		return mv;
	}
	
	
}